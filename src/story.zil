<INSERT-FILE "gamebook">

<GLOBAL STARTING-POINT PROLOGUE>

<ROUTINE RESET-OBJECTS ()
	<RESET-CONTAINER ,LOST-SKILLS>
	<RESET-CONTAINER ,EAT-BAG>
	<RESET-CONTAINER ,LOST-BAG>
	<RETURN>>

<ROUTINE RESET-STORY ()
	<RESET-TEMP-LIST>
	<SETG RITUAL-BALL-STARTED F>
	<SETG TICKS 0>
	<SETG CROSS 0>
	<SETG IMMORTAL F>
	<SETG BLESSING-WAR-GOD F>
	<SETG DONATION 0>
	<SET-DESTINATION ,STORY008 1 ,STORY275>
	<SET-DESTINATION ,STORY048 1 ,STORY117>
	<SET-DESTINATION ,STORY060 3 ,STORY194>
	<SET-DESTINATION ,STORY071 1 ,STORY117>
	<SET-DESTINATION ,STORY091 2 ,STORY136>
	<SET-DESTINATION ,STORY094 2 ,STORY063>
	<SET-DESTINATION ,STORY133 2 ,STORY179>
	<SET-DESTINATION ,STORY340 4 ,STORY384>
	<PUTP ,STORY004 ,P?DEATH T>
	<PUTP ,STORY013 ,P?DEATH T>
	<PUTP ,STORY017 ,P?DEATH T>
	<PUTP ,STORY022 ,P?DEATH T>
	<PUTP ,STORY028 ,P?DEATH T>
	<PUTP ,STORY033 ,P?DEATH T>
	<PUTP ,STORY046 ,P?DEATH T>
	<PUTP ,STORY051 ,P?DEATH T>
	<PUTP ,STORY058 ,P?DEATH T>
	<PUTP ,STORY062 ,P?DEATH T>
	<PUTP ,STORY063 ,P?DEATH T>
	<PUTP ,STORY068 ,P?DEATH T>
	<PUTP ,STORY073 ,P?DEATH T>
	<PUTP ,STORY085 ,P?DEATH T>
	<PUTP ,STORY092 ,P?DEATH T>
	<PUTP ,STORY094 ,P?DEATH T>
	<PUTP ,STORY102 ,P?DEATH T>
	<PUTP ,STORY110 ,P?DEATH T>
	<PUTP ,STORY111 ,P?DEATH T>
	<PUTP ,STORY115 ,P?DEATH T>
	<PUTP ,STORY121 ,P?DEATH T>
	<PUTP ,STORY124 ,P?DEATH T>
	<PUTP ,STORY129 ,P?DEATH T>
	<PUTP ,STORY133 ,P?DEATH T>
	<PUTP ,STORY143 ,P?DEATH T>
	<PUTP ,STORY150 ,P?DEATH T>
	<PUTP ,STORY154 ,P?DEATH T>
	<PUTP ,STORY164 ,P?DEATH T>
	<PUTP ,STORY166 ,P?DEATH T>
	<PUTP ,STORY168 ,P?DEATH T>
	<PUTP ,STORY178 ,P?DEATH T>
	<PUTP ,STORY184 ,P?DEATH T>
	<PUTP ,STORY194 ,P?DEATH T>
	<PUTP ,STORY195 ,P?DEATH T>
	<PUTP ,STORY199 ,P?DEATH T>
	<PUTP ,STORY204 ,P?DEATH T>
	<PUTP ,STORY205 ,P?DEATH T>
	<PUTP ,STORY206 ,P?DEATH T>
	<PUTP ,STORY216 ,P?DEATH T>
	<PUTP ,STORY224 ,P?DEATH T>
	<PUTP ,STORY227 ,P?DEATH T>
	<PUTP ,STORY229 ,P?DEATH T>
	<PUTP ,STORY230 ,P?DEATH T>
	<PUTP ,STORY232 ,P?DEATH T>
	<PUTP ,STORY235 ,P?DEATH T>
	<PUTP ,STORY242 ,P?DEATH T>
	<PUTP ,STORY246 ,P?DEATH T>
	<PUTP ,STORY253 ,P?DEATH T>
	<PUTP ,STORY265 ,P?DEATH T>
	<PUTP ,STORY268 ,P?DEATH T>
	<PUTP ,STORY272 ,P?DEATH T>
	<PUTP ,STORY273 ,P?DEATH T>
	<PUTP ,STORY276 ,P?DEATH T>
	<PUTP ,STORY281 ,P?DEATH T>
	<PUTP ,STORY285 ,P?DEATH T>
	<PUTP ,STORY290 ,P?DEATH T>
	<PUTP ,STORY291 ,P?DEATH T>
	<PUTP ,STORY294 ,P?DEATH T>
	<PUTP ,STORY295 ,P?DEATH T>
	<PUTP ,STORY296 ,P?DEATH T>
	<PUTP ,STORY298 ,P?DEATH T>
	<PUTP ,STORY299 ,P?DEATH T>
	<PUTP ,STORY311 ,P?DEATH T>
	<PUTP ,STORY316 ,P?DEATH T>
	<PUTP ,STORY319 ,P?DEATH T>
	<PUTP ,STORY320 ,P?DEATH T>
	<PUTP ,STORY328 ,P?DEATH T>
	<PUTP ,STORY333 ,P?DEATH T>
	<PUTP ,STORY353 ,P?DEATH T>
	<PUTP ,STORY360 ,P?DEATH T>
	<PUTP ,STORY362 ,P?DEATH T>
	<PUTP ,STORY395 ,P?DEATH T>
	<PUTP ,STORY400 ,P?DEATH T>
	<PUTP ,STORY419 ,P?DEATH T>
	<PUTP ,STORY428 ,P?DEATH T>
	<PUTP ,STORY431 ,P?DEATH T>
	<PUTP ,STORY438 ,P?DEATH T>
	<RETURN>>

<CONSTANT DRINK-POTION-KEY-CAPS !\D>
<CONSTANT DRINK-POTION-KEY !\d>
<CONSTANT MAGIC-MIRROR-KEY-CAPS !\M>
<CONSTANT MAGIC-MIRROR-KEY !\m>
<CONSTANT POINTS-KEY-CAPS !\P>
<CONSTANT POINTS-KEY !\p>

<CONSTANT ALL-POSSESSIONS "You lost all your possessions.">
<CONSTANT TEXT-BEAD "You remember to slip the jade bead under your tongue as advised">
<CONSTANT VITALITY-RESTORED "Your vitality has been restored">

<GLOBAL IMMORTAL F>
<GLOBAL BLESSING-WAR-GOD F>
<GLOBAL RITUAL-BALL-STARTED F>
<GLOBAL TICKS 0>
<GLOBAL CROSS 0>
<GLOBAL DONATION 0>

<ROUTINE SPECIAL-INTERRUPT-ROUTINE (KEY)
	<COND (<EQUAL? .KEY DRINK-POTION-KEY-CAPS DRINK-POTION-KEY>
		<COND (<CHECK-ITEM ,MAGIC-POTION>
			<CRLF>
			<DRINK-POTION>
			<RTRUE>
		)>
	)(<EQUAL? .KEY MAGIC-MIRROR-KEY-CAPS MAGIC-MIRROR-KEY>
		<COND (<CHECK-ITEM ,GREEN-MIRROR>
			<ORACLE>
			<RTRUE>
		)>
	)(<EQUAL? .KEY POINTS-KEY-CAPS POINTS-KEY>
		<SHOW-SCORES>
		<RTRUE>
	)>
	<RFALSE>>

<ROUTINE DRINK-POTION ()
	<CRLF>
	<TELL "Drink magic potion?">
	<COND (<YES?>
		<SETG LIFE-POINTS <+ ,LIFE-POINTS 5>>
		<COND (<G? ,LIFE-POINTS ,MAX-LIFE-POINTS> <SETG LIFE-POINTS ,MAX-LIFE-POINTS>)>
		<REMOVE ,MAGIC-POTION>
	)>>

<ROUTINE START-RITUAL-BALL ()
	<SETG RITUAL-BALL-STARTED T>
	<EMPHASIZE "The ritual ball contest has started. Press 'P' any time to view current scores.">>

<ROUTINE SHOW-SCORES ()
	<COND (,RITUAL-BALL-STARTED
		<CRLF>
		<CRLF>
		<HLIGHT ,H-BOLD>
		<TELL "Current Scores">
		<HLIGHT 0>
		<CRLF>
		<CRLF>
		<TELL "Your score: " N ,TICKS " points" CR>
		<TELL "Opposition: " N ,CROSS " points" CR>
		<PRESS-A-KEY>
	)>>

<ROUTINE SCORE-POINTS ("OPT" POINTS SIDE)
	<COND (<NOT <ASSIGNED? POINTS>> <SET POINTS 1>)>
	<COND (<NOT <ASSIGNED? SIDE>> <SET SIDE ,PLAYER>)>
	<COND (<EQUAL? .SIDE ,PLAYER>
		<SETG TICKS <+ ,TICKS .POINTS>>
	)(ELSE
		<SETG CROSS <+ ,CROSS .POINTS>>
	)>
	<HLIGHT ,H-BOLD>
	<TELL CR "Your ">
	<COND (<EQUAL? .SIDE ,PLAYER> <TELL "side scores ">)(ELSE <TELL "foes score ">)>
	<PRINTN .POINTS>
	<TELL " point">
	<COND (<G? .POINTS 1> <TELL "s">)>
	<TELL ,PERIOD-CR>
	<HLIGHT 0>>

<ROUTINE RESET-UNIVERSE ("AUX" (POSSESSIONS NONE) (COUNT 0) (SKILL NONE) (REQUIREMENT NONE))
	<RESET-POSSESSIONS>
	<TRANSFER-CONTAINER ,LOST-SKILLS ,SKILLS>
	<SETG MAX-LIFE-POINTS <GETP ,CURRENT-CHARACTER ,P?LIFE-POINTS>>
	<SETG LIFE-POINTS ,MAX-LIFE-POINTS>
	<SETG MONEY <GETP ,CURRENT-CHARACTER ,P?MONEY>>
	<MOVE ,ALL-MONEY ,PLAYER>
	<SET POSSESSIONS <GETP ,CURRENT-CHARACTER ,P?POSSESSIONS>>
	<COND (.POSSESSIONS
		<SET COUNT <GET .POSSESSIONS 0>>
		<DO (I 1 .COUNT)
			<MOVE <GET .POSSESSIONS .I> ,PLAYER>
		>
	)>
	<SET SKILL <FIRST? ,SKILLS>>
	<REPEAT ()
		<COND (<NOT .SKILL> <RETURN>)>
		<SET REQUIREMENT <GETP .SKILL ,P?REQUIRES>>
		<COND (.REQUIREMENT <MOVE <GET .REQUIREMENT 1> ,PLAYER>)>
		<SET SKILL <NEXT? .SKILL>>
	>
	<RESET-OBJECTS>
	<RESET-STORY>>

<ROUTINE ORACLE ("OPT" STORY "AUX" DESTINATIONS COUNT CHOICES)
	<COND (<NOT <CHECK-ITEM ,GREEN-MIRROR>> <RETURN>)>
	<COND (<NOT .STORY> <SET STORY ,HERE>)>
	<SET DESTINATIONS <GETP .STORY ,P?DESTINATIONS>>
	<COND (.DESTINATIONS
		<HLIGHT ,H-BOLD>
		<TELL CR CR "You used " T ,GREEN-MIRROR " to get a glimpse of your future" ,PERIOD-CR>
		<HLIGHT 0>
		<REPEAT ()
			<SET COUNT <GET .DESTINATIONS 0>>
			<SET CHOICES <GETP .STORY ,P?CHOICES>>
			<DO (I 1 .COUNT)
				<CRLF>
				<HLIGHT ,H-BOLD>
				<TELL "... " <GET .CHOICES .I> ":" CR>
				<COND (<GETP <GET .DESTINATIONS .I> ,P?STORY>
					<HLIGHT 0>
					<PRINT-PAGE <GET .DESTINATIONS .I>>
					<HLIGHT ,H-BOLD>
					<COND (<GETP <GET .DESTINATIONS .I> ,P?DEATH>
						<TELL CR "... this way may lead to tragedy" ,PERIOD-CR>
					)(<GETP <GET .DESTINATIONS .I> ,P?VICTORY>
						<TELL CR "... this way may lead to glory" ,PERIOD-CR>
					)>
					<COND (<OR <GETP <GET .DESTINATIONS .I> ,P?DESTINATIONS> <GETP <GET .DESTINATIONS .I> ,P?CONTINUE>>
						<TELL CR "... further adventures lie ahead" ,PERIOD-CR>
					)>
					<HLIGHT 0>
				)(ELSE
					<TELL CR "... your vision of this future is obscured" ,PERIOD-CR>
				)>
				<PRESS-A-KEY>
			>
			<TELL CR "Do you want to take a look again?">
			<COND (<NOT <YES?>> <CRLF> <LOSE-ITEM ,GREEN-MIRROR> <RETURN>)>
		>
	)>>

<ROUTINE DONATE-CACAO ("AUX" AMOUNT)
	<COND (<AND ,RUN-ONCE <G? ,MONEY 0>>
		<SETG DONATION 0>
		<SET AMOUNT <GET-NUMBER "Make a donation for the god's benison" 0 ,MONEY>>
		<COND (<G? .AMOUNT 0>
			<CHARGE-MONEY .AMOUNT>
			<SETG DONATION .AMOUNT>
		)>
	)>>

<ROUTINE TEST-IMMORTALITY (DAMAGE MESSAGE "OPT" STORY)
	<COND (<NOT .STORY> <SET STORY ,HERE>)>
	<COND (,IMMORTAL <PREVENT-DEATH .STORY> <RETURN>)>
	<COND (,BLESSING-WAR-GOD
		<TELL CR "Use the Blessing of The War God to prevent the loss of " N .DAMAGE " life points?">
		<COND (<YES?> <PREVENT-DEATH .STORY> <SETG BLESSING-WAR-GOD F> <RETURN>)>
	)>
	<LOSE-LIFE .DAMAGE .MESSAGE .STORY>>

<ROUTINE EAT-PROVISIONS (QUANTITY STORY "OPT" DAMAGE JUMP "AUX" (COUNT 0) (CONSUMED 0))
	<RESET-TEMP-LIST>
	<RESET-CONTAINER ,EAT-BAG>
	<COND (<CHECK-ITEM ,HAUNCH-OF-VENISON>
		<SET COUNT <+ .COUNT 1>>
		<PUT TEMP-LIST .COUNT ,HAUNCH-OF-VENISON>
	)>
	<COND (<CHECK-ITEM ,SALTED-MEAT>
		<SET COUNT <+ .COUNT 1>>
		<PUT TEMP-LIST .COUNT ,SALTED-MEAT>
	)>
	<COND (<CHECK-ITEM ,PAPAYA>
		<SET COUNT <+ .COUNT 1>>
		<PUT TEMP-LIST .COUNT ,PAPAYA>
	)>
	<COND (<CHECK-ITEM ,OWL>
		<SET COUNT <+ .COUNT 1>>
		<PUT TEMP-LIST .COUNT ,OWL>
	)>
	<COND (<CHECK-ITEM ,MAIZE-CAKES>
		<SET COUNT <+ .COUNT 1>>
		<PUT TEMP-LIST .COUNT ,MAIZE-CAKES>
	)>
	<COND (<G? .COUNT 0>
		<SELECT-FROM-LIST TEMP-LIST .COUNT .QUANTITY "food" ,EAT-BAG "eat">
		<SET CONSUMED <COUNT-CONTAINER ,EAT-BAG>>
		<COND (<G? .CONSUMED 0>
			<COND (<NOT .DAMAGE>
				<COND (<L? .CONSUMED .QUANTITY>
					<GAIN-LIFE <- .QUANTITY .CONSUMED>>
				)(ELSE
					<GAIN-LIFE .QUANTITY>
				)>
			)(<G=? .CONSUMED .QUANTITY>
				<EMPHASIZE "You were able to eat your fill">
				<PREVENT-DEATH .STORY>
			)(ELSE
				<TEST-IMMORTALITY <- .QUANTITY .CONSUMED> ,DIED-OF-HUNGER .STORY>
			)>
			<COND (.JUMP <STORY-JUMP .JUMP>)>
		)(.DAMAGE
			<TEST-IMMORTALITY .QUANTITY ,DIED-OF-HUNGER .STORY>
		)>
	)(ELSE
		<CRLF>
		<TELL "... But you have nothing to eat">
		<TELL ,PERIOD-CR>
		<COND (.DAMAGE <TEST-IMMORTALITY .QUANTITY ,DIED-OF-HUNGER .STORY>)>
	)>
	<UPDATE-STATUS-LINE>>

<ROUTINE RESTORE-VITALITY ()
	<COND (<L? ,LIFE-POINTS ,MAX-LIFE-POINTS>
		<EMPHASIZE ,VITALITY-RESTORED>
		<SETG LIFE-POINTS ,MAX-LIFE-POINTS>
		<UPDATE-STATUS-LINE>
	)>>

<CONSTANT PROLOGUE-TEXT "Last night you dreamed you saw your brother again. He was walking through a desert, his sandals scuffing up plumes of sooty black sand from the low endless dunes. It seemed you were hurrying to catch him up, but the sand slipped away under your feet and you could make no headway up the slop. You heard your own voice call his name: \"Morning Star!\" But muffled by distance, the words went rolling off the sky unheeded.||You struggled on. Cresting the dune, you saw your brother standing close by, staring at something in his hands. Your heart thudded with relief as you stumbled through the dream towards him. But even as your hand reached out for his shoulder, a sense of dread was growing like a storm cloud to blot out any joy. You saw the object Morning Star was holding: an obsidian mirror. You leaned forward and gazed at the face of your brother reflected in the dark green glass.||Your twin brother's face was the face of a skull.||The soothsayer nods as you finish recounting the dream. He plays idly with his carved stone prophecy-markers, pouring them from one hand to the other with a light rattling sound.||\"Today is the day of Lamat,\" he says in his thin old voice. \"And the symbol of Lamat is the death's head. On this day, the morning-star has ended its cycle and will not be visible in the heavens for ninety days, when it will reappear as the evening-star. The meaning of the dream is therefore that in the absence of your brother it falls to you, Evening Star to fulfil his duties.\"||You cannot resist a smile, even though the ominous import of the dream weighs heavily on your soul. \"So it only concerns the importance of duty? I wonder if my clan elders have been speaking to you?\"||The soothsayer snorts and casts the prophecy-markers back into his bag with a pretence of indignation, but he has too good a heart to overlook your concern for your brother. Turning at the door, he adds, \"The King gave Morning Star a great honour when he made him his ambassador. But it is no less honourable to stay at home and help with the affairs of one's clan. You are young, Evening Star; your chance for glory will come.\"||\"Do the prophecy-makers also tell you that?\"||He rattles the bag. \"These? They're just for show; it's the two old stones on either side of my nose that tell me everything I need to know about the future!\" He points to his eyes and hobbles out in a gale of wheezing laughter.||You lean back, feeling the cool of the stone wall press against your bare shoulders. The soothsayer intended to set your mind at rest, but you have shared a bond with Morning Star since the two of you were born. To be troubled by such a dream is not, you feel sure, a mere quirk of the imagination. Somehow you sense that something terrible has befallen your brother.||You are still brooding an hour later when a servant comes scurrying into the room. \"There is news of Lord Morning Star's expedition...\" he begins, almost too frightened of your reaction to blurt out the words.||You are on your feet in an instant. \"What news?\"||The servant bows. \"The Council of Nobles is holding an emergency session. The rumour... I have heard a rumour that only a single member of the expedition returned alive.\"||Pausing only to draw on your cloak, you hurry outside and head along the street towards the city centre. All around you sprawl the tall thatched roofs of the city, spreading out towards the distant fields. Each clan or group of families has its own dwellings of stone or mud-brick, according to status. These rest upon raised platforms above the level of the street, their height determined again by status. But not even the most exalted noble has a home to match the grand dwellings of the gods, which you now see towering ahead of you atop their immense pyramids. They shimmer with the colours of fresh blood and polished bone in the noonday sunlight, covered with demonic carvings which stare endlessly down across the city of Koba.||The central plaza of the city is a blaze of white stone in the sunshine. Quickening your step, you approach the amphitheatre where the Council of Nobles is meeting. As you step under the arch of the entrance, your way is barred by two burly warriors of the King's guard, each armed with an obsidian-edged sword. \"You may not enter.\"||\"I am Evening Star. The ambassador is my brother. Has he returned to Koba?\"||One of them peers at you, recognition trickling like cold honey into his gaze. \"I know you now. Morning Star has not returned, no.\"||The other says, \"Look, I suppose you'd better go in. One of the ambassador's retinue came back this morning. He's telling the Council what happened.\"||You walk in to the amphitheatre and numbly find a seat. You can hardly take in the guard's words; they sit like stones in your head, impossible to accept. Can it be true? Your twin brother -- dead?||A man you recognize as one of Morning Star's veteran warriors stands in the centre of the amphitheatre, giving his report. The seats on either side are crowded with the lords and ladies of Koba, each face a picture of grave deliberation. At the far end is the King himself, resplendent in a turquoise mantle of quetzal feathers, his throne carved to resemble the open jaws of some titanic monster on whose tongue he seems to sit like the very decree of the gods.||\"...arrived at the Great City,\" the veteran is saying. \"We found it ransacked -- the temples torn down, whole palaces burned. Some poor wretches still live there, eking out a stark existence in the ruins, but it is like the carcass of a beast who lies with a death-wound. Whenever we asked how this destruction had come about, we received the same reply: werewolves from the land of the dead, beyond the west, had descended from the desert and slain all the Great City's defenders in a single night of carnage.\"||There is a murmuring at this. The Great City had endured for centuries before Koba was even built. The King raises his hand for silence. \"What was Lord Morning Star's decision when he heard this?\"||\"Majesty, he led us into the desert. He believed it his duty to uncover the truth of the matter and report it to you. After many days of trekking almost all our water was used up. We had faced monsters along the way, and many of us bore grievous injuries. Then we came to a place like a royal palace, but entirely deserted except for dogs and owls. We camped outside the walls there, and on the next day Morning Star told us he had dreamed of a sorcerer called Necklace of Skulls who dwelt within the palace. He said he would enter and find out if this sorcerer had sent the werewolves to destroy the Great City. We watched him enter the portals of the palace, and we waited for his return for eight days, but he did not emerge. Then we began the long march back here to Koba, but sickness and the creatures of the desert gradually took their toll, and I alone remain to tell the tale.\"||The King rises to his feet. \"Morning Star must be considered slain by this sorcerer. His mission shall not be recorded as a failure, since he died attempting to carry out his duty. Prayers shall be said for the safe journey of his soul through the underworld. This meeting is ended.\"||The others file out in groups, heads bent together in urgent debate. For most of them the veteran's report carried that special thrill of a distant alarm. A great but far-off city reduced to ruin; a disaster from halfway across the world. Cataclysmic news, but an event comfortingly remote from the day to day affairs at home. A matter for the noblemen to worry over when they sit with their cigars at night. The reverberations of a toppling temple in the Great City will be heard here in Koba as no more than the droning discussions of old men.||For you it is different. Left alone in the amphitheatre, you sit like a figure of clay, eerily detached from your own turbulent emotions. Fractured images and words whirl through your stunned brain. Morning Star is dead. Your twin brother, lost for ever...||A single sudden thought of burning clarity impels you to your feet. In that instant you seem to see your destiny unrolling in front of you like along straight carpet. You turn your face to the west, eyes narrowing in the glare of the declining sun.||Your brother might not be dead. There is only one place you can learn the truth.||You must journey to the western desert, to the palace of the sorcerer called Necklace of Skulls.">

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
	(TYPES TWO-NONES)
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
	<TEST-IMMORTALITY 1 ,DIED-OF-HUNGER ,STORY004>>

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

<CONSTANT TEXT007 "You hear a sound. It is quiet and unsettling. It sounded like a rattling intake of breath in a dry dead throat. You have the sudden impression that something has become aware of your presence here. Something is watching you.||You look back. The tunnel behind the boat is now filled with ochre mist that hangs in the air in long sparkling veils. As you watch, you see the cloud getting thicker as more mist seeps out of the edges of the rock tombs.||The demon in the back of the canoe also takes a glance back. He pauses stock-still for a moment, then explodes into frantic action. Paddling furiously, he yells to the other demon, \"They've woken up! Let's get out of here!\"||Too late. The ochre cloud suddenly comes rushing forward as though blown by a blast of wind. The boat is completely enveloped. The demons are obviously expecting trouble and do not wait around. \"Abandon ship!\" you hear the one in the prow yelling, and then two heavy splashes can be heard as they jump overboard.||Phantom figures loom out of the mist, pressing their skeletal faces close to yours and clutching at you with thin fingers of yellow bone. You are rigid with terror; you cannot even find the breath to scream. The mist sends a chill deep into you that no fire will ever be able to warm again.||The mist retreats as rapidly as it appeared, drawing back in long wisps into the rock tombs like smoke being sucked back into a row of pipes. But the danger is not over. Without the two oarsmen, your canoe is being carried out of control by the river current.">
<CONSTANT CHOICES007 <LTABLE "use" "use a" "otherwise">>

<ROOM STORY007
	(DESC "007")
	(STORY TEXT007)
	(PRECHOICE STORY007-PRECHOICE)
	(CHOICES CHOICES007)
	(DESTINATIONS <LTABLE STORY076 STORY099 STORY214>)
	(REQUIREMENTS <LTABLE SKILL-SEAFARING ROPE NONE>)
	(TYPES <LTABLE R-SKILL R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY007-PRECHOICE ()
	<COND (,RUN-ONCE
		<EMPHASIZE "Your maximum Life Points is permanently reduced by 2.">
		<SETG MAX-LIFE-POINTS <- ,MAX-LIFE-POINTS 2>>
		<COND (<G? ,LIFE-POINTS ,MAX-LIFE-POINTS> <SETG LIFE-POINTS ,MAX-LIFE-POINTS>)>
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
		<COND (<OR <CHECK-SKILL ,SKILL-SWORDPLAY> <CHECK-SKILL ,SKILL-ETIQUETTE>>
			<SET-DESTINATION ,STORY008 1 ,STORY252>
		)(ELSE
			<SET-DESTINATION ,STORY008 1 ,STORY275>
		)>
	)>>

<CONSTANT TEXT009 "You descend into the pyramid. The staircase is narrow, steep and dank. Lighting-strokes cast a guttering white glare from above, plunging you into darkness as they pass. The thundercracks in the sky resound ominously through the heavy stone blocks of the pyramid. The steps are slippery with damp, forcing you to make the descent slowly. At last you reach the bottom and pass through a doorway draped with thick fleshy roots. A tunnel stretches ahead which you have to feel your way along. No light penetrates this far down. The smell in the air is of damp soil and limestone.||The walls vibrate as another thunderbolt shakes the earth. Suddenly you are knocked off your feet by a heavy weight of rubble dropping on you. You realize the tunnel has caved in. Claustrophobia seizes you. Struggling in panic, you claw at the rubble in a frantic attempt to dig yourself free.||Your hands break through to the air and you push up, gasping for breath. You are no longer in the underground tunnel, though. You have emerged into an unearthly landscape. A barren plain stretches away in all directions under a sky of red-tinged darkness. In the distance you can see a haze of sulphurous clouds lit by fiery light: the lip of volcanic fissure. You head towards it">

<ROOM STORY009
	(DESC "009")
	(STORY TEXT009)
	(PRECHOICE STORY009-PRECHOICE)
	(CONTINUE STORY080)
	(CODEWORD CODEWORD-PAKAL)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY009-PRECHOICE ()
	<COND (<CHECK-ITEM ,JADE-BEAD>
		<EMPHASIZE "You lodged the jade bead under your tongue as the spirit advised you.">
	)>
	<CRLF>
	<TELL ,TEXT009>
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
		<TEST-IMMORTALITY 1 ,DIED-IN-COMBAT ,STORY013>
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
	<TEST-IMMORTALITY 1 ,DIED-GREW-WEAKER ,STORY017>
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
	<COND (<CHECK-CODEWORD ,CODEWORD-ANGEL> <DELETE-CODEWORD ,CODEWORD-ANGEL>)>
	<LOSE-SKILL ,SKILL-SPELLS>>

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
<CONSTANT CHOICES020 <LTABLE "use" "or" "otherwise">>

<ROOM STORY020
	(DESC "020")
	(STORY TEXT020)
	(CHOICES CHOICES020)
	(DESTINATIONS <LTABLE STORY012 STORY035 STORY058>)
	(REQUIREMENTS <LTABLE SKILL-CUNNING SKILL-CHARMS NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

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
		<TEST-IMMORTALITY 2 ,DIED-OF-THIRST ,STORY022>
		<COND (<IS-ALIVE>
			<LOSE-ITEM ,WATERSKIN>
			<EMPHASIZE "You waterskin has been emptied.">
		)>
	)(ELSE
		<PREVENT-DEATH ,STORY022>
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
<CONSTANT CHOICES025 <LTABLE "use" "jerk your hand away quickly" "slowly reach around with your other hand to seize the tarantula from behind">>

<ROOM STORY025
	(DESC "025")
	(STORY TEXT025)
	(CHOICES CHOICES025)
	(DESTINATIONS <LTABLE STORY048 STORY071 STORY094>)
	(REQUIREMENTS <LTABLE SKILL-WILDERNESS-LORE NONE NONE>)
	(TYPES <LTABLE R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

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
		<TELL ,TEXT027-CONTINUED>
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
	<TEST-IMMORTALITY 3 ,DIED-GREW-WEAKER ,STORY028>>

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
<CONSTANT CHOICES030 <LTABLE "use" "pay him" "else make your way north on foot">>

<ROOM STORY030
	(DESC "030")
	(STORY TEXT030)
	(CHOICES CHOICES030)
	(DESTINATIONS <LTABLE STORY332 STORY355 STORY264>)
	(REQUIREMENTS <LTABLE SKILL-SEAFARING 2 NONE>)
	(TYPES <LTABLE R-SKILL R-MONEY R-NONE>)
	(FLAGS LIGHTBIT)>

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
<CONSTANT TEXT033-CONTINUED "You realize that at last the passage is beginning to slope upwards again. You are climbing out of the canyon, towards the dragon's other head. Sure enough, the awful heat gradually subsides. When you reach the top of your gruelling ascent, however, a further shock awaits you. The dragon's hind and jaws are closed. You are trapped in here.">
<CONSTANT CHOICES033 <LTABLE "use" "or" "a">>
<CONSTANT TEXT033-END "Your days will end in the maw of the the dragon">

<ROOM STORY033
	(DESC "033")
	(STORY TEXT033)
	(PRECHOICE STORY033-PRECHOICE)
	(CHOICES CHOICES033)
	(DESTINATIONS <LTABLE STORY439 STORY428 STORY125>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS SKILL-CUNNING CHILLI-PEPPERS>)
	(TYPES <LTABLE R-SKILL R-SKILL R-ITEM>)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY033-PRECHOICE ()
	<COND (,RUN-ONCE
		<TEST-IMMORTALITY 5 ,DIED-GREW-WEAKER ,STORY033>
		<COND (<IS-ALIVE>
			<CRLF>
			<TELL ,TEXT033-CONTINUED>
			<TELL ,PERIOD-CR>
			<COND (<NOT <OR <CHECK-SKILL ,SKILL-SPELLS> <CHECK-SKILL ,SKILL-CUNNING> <CHECK-ITEM ,CHILLI-PEPPERS>>>
				<CRLF>
				<TELL ,TEXT033-END>
				<TELL ,PERIOD-CR>
				<PUTP ,STORY033 ,P?DEATH T>
			)>
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
	(CONTINUE STORY431)
	(FLAGS LIGHTBIT)>

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
	<START-RITUAL-BALL>
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
		<RESTORE-VITALITY>
		<COND (<G? <COUNT-CONTAINER ,LOST-SKILLS> 0>
			<CRLF>
			<TELL "You regained: ">
			<PRINT-CONTAINER ,LOST-SKILLS>
			<TRANSFER-CONTAINER ,LOST-SKILLS ,SKILLS>
		)>
		<UPDATE-STATUS-LINE>
	)>
	<CRLF>
	<TELL ,TEXT043-CONTINUED ,PERIOD-CR>>

<CONSTANT TEXT044 "The giant adopts a look of furious concentration. He puffs out the huge boulders of his cheeks and screws his eyes tight. A rumbling groan escapes from the deep well of his throat, followed by a spluttering and a single cough like a lava plug being blown out of the ground.||He opens his mouth and there on his tongue lies a stone jar. \"What's that?\" you ask.||\"Ake it and thee,\" he replies.||\"I beg your pardon?\" you say, lifting the jar to examine it.||'I said, \"Take it and see,\"' he repeats impatiently. When he sees you grimace at the smell of the jar's contents, he adds: \"It's a healing drink. A magical recipe thousands of years old.\"||\"I think it's gone off!\"||\"No, it's supposed to smell like that,\" he says.||(The potion can be drunk once at any time to restore 5 lost Life Points by pressing 'D')">

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
	<TEST-IMMORTALITY .DAMAGE ,DIED-OF-THIRST ,STORY046>
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
			<SET-DESTINATION ,STORY048 1 ,STORY139>
		)(ELSE
			<SET-DESTINATION ,STORY048 1 ,STORY117>
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
	<EMPHASIZE ,ALL-POSSESSIONS>
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
	<TEST-IMMORTALITY 2 ,DIED-GREW-WEAKER ,STORY051>>

<CONSTANT TEXT052 "A sense of panic begins to well up, churning your thoughts into a confused mixture of fact and fancy. You begin to imagine that you have strayed into the underworld and that the mighty trees surrounding you are no more than the smallest subterranean roots of the fabled Ceiba tree that supports the heavens. You jump in alarm at every tiny sound of scurrying insects or fluttering wings. If you cannot find your way out of the forest soon, our only fate will be madness followed by a slow torturing death by starvation.">
<CONSTANT CHOICES052 <LTABLE "bear off to the right" "continue in the direction you have been walking up till now" "decide to go left">>

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
<CONSTANT CHOICES055 <LTABLE "use" "fight the guards" "make no attempt to resist">>

<ROOM STORY055
	(DESC "055")
	(STORY TEXT055)
	(CHOICES CHOICES055)
	(DESTINATIONS <LTABLE STORY032 STORY102 STORY124>)
	(REQUIREMENTS <LTABLE SKILL-CUNNING NONE NONE>)
	(TYPES <LTABLE R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

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
<CONSTANT CHOICES057 <LTABLE "use" "or" "battle with the creature: attack it now while it is still attached to its host" "wait until nightfall">>

<ROOM STORY057
	(DESC "057")
	(STORY TEXT057)
	(CHOICES CHOICES057)
	(DESTINATIONS <LTABLE STORY377 STORY011 STORY104 STORY100>)
	(REQUIREMENTS <LTABLE SKILL-CUNNING SKILL-SPELLS NONE NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

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
		<PREVENT-DEATH ,STORY058>
	)(ELSE
		<PUTP ,STORY058 ,P?DEATH T>
		<EMPHASIZE "You have nothing to offer.">
	)>>

<CONSTANT TEXT059 "The drink proves cool and invigorating.">
<CONSTANT TEXT059-CONTINUED "Your companion leads up to the kapok tree, where a group of nobles are resting under the canopy of foliage. They greet him cordially, but you are given a somewhat cooler reception until he explains how you helped him cross the river blood.||It is a relief to be out of the glaring light of the low underworld sun for a while. Out of the shade, you can see less fortunate souls moving to and fro with their hands pressed to their foreheads, squinting in the eternal sunshine. You settle down with your back to the tree and wait to hear what the nobles have to say">

<ROOM STORY059
	(DESC "059")
	(STORY TEXT059)
	(PRECHOICE STORY059-PRECHOICE)
	(CONTINUE STORY106)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY059-PRECHOICE ()
	<GAIN-LIFE 2>
	<CRLF>
	<TELL ,TEXT059-CONTINUED>
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
	<COND (<CHECK-ITEM ,JADE-BEAD>
		<SET-DESTINATION ,STORY060 3 ,STORY148>
	)(ELSE
		<SET-DESTINATION ,STORY060 3 ,STORY194>
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
	<TELL ,TEXT061-CONTINUED>
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
	<TEST-IMMORTALITY 2 ,DIED-FROM-INJURIES ,STORY062>
	<COND (<IS-ALIVE>
		<SETG MAX-LIFE-POINTS <- ,MAX-LIFE-POINTS 2>>
		<COND (<G? ,LIFE-POINTS ,MAX-LIFE-POINTS> <SETG LIFE-POINTS ,MAX-LIFE-POINTS>)>
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
	<TEST-IMMORTALITY 3 ,DIED-FROM-INJURIES ,STORY063>
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
	<TEST-IMMORTALITY .DAMAGE ,DIED-FROM-INJURIES ,STORY068>
	<IF-ALIVE TEXT068-CONTINUED>>

<CONSTANT TEXT069 "Cliffs rise in front of you, and you make your way along them until you find a long shoulder of rock by which you are able to scale to the top.||You have gone only a little further when you hear a distant keening noise. It sounds like the wind, but you do not feel even a breath of air in the sultry stillness. Then you notice half a dozen long plumes of dust moving along the ground in your direction. Above each dust-plume is a dark twisting funnel of air. Whirlwinds -- and they are bearing straight down on you. Superstitious dread crawls up your spine. You recall tales of the demons of the desert, who rip men limb from limb with the fury of their whirlwinds.">
<CONSTANT CHOICES069 <LTABLE "use" "use a wand" "stand ready to fight the demons off" "run back towards the cliffs">>

<ROOM STORY069
	(DESC "069")
	(STORY TEXT069)
	(CHOICES CHOICES069)
	(DESTINATIONS <LTABLE STORY345 STORY092 STORY115 STORY137>)
	(REQUIREMENTS <LTABLE SKILL-FOLKLORE SKILL-SPELLS NONE NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

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
	<COND (<CHECK-SKILL ,SKILL-ETIQUETTE>
		<SET-DESTINATION ,STORY071 1 ,STORY139>
	)(ELSE
		<SET-DESTINATION ,STORY071 1 ,STORY117>
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
	<TEST-IMMORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY073>>

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
	<KEEP-ITEM ,PADDLE>>

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
		<TELL ,TEXT077-WELCOMED>
		<TELL ,PERIOD-CR>
		<STORY-JUMP ,STORY192>
	)(<CHECK-CODEWORD ,CODEWORD-POKTAPOK>
		<CRLF>
		<TELL ,TEXT077-EXPERT>
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
		<TELL ,TEXT078-CONTINUED>
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
		<PREVENT-DEATH ,STORY085>
	)(ELSE
		<TEST-IMMORTALITY 1 ,DIED-OF-THIRST ,STORY085>
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
	<SCORE-POINTS 2 ,PLAYER>
	<COND (<G? ,TICKS 6>
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

<CONSTANT TEXT091 "Jade Thunder goes down to the water's edge and sweeps his wand in a grand magical gesture. The water immediately in front of him becomes as smooth and flat as a sheet of glass. You blink in amazement as the effect stretches off into the distance, leaving a glassy causeway through the waves.||You test your weight on the causeway. It is solid. \"Neat trick,\" you say, impressed.||\"I used to be quite famous in my heyday.\" Jade Thunder starts out along the causeway.||\"Can't I join you?\" you call after him.||\"Not on this path. But if you care to sail south to the mainland, look along the coast for a giant who's buried to his neck in the sand. He has been counting stars since the dawn of time. Tell him the true number, which is one hundred thousand million and seven, and he will grant you one wish.\"||You watch him walk of towards the horizon, then go to rejoin the others at the ship. You are amazed to discover that instead of the flimsy vessel in which you set sail, you now have a magnificent craft of green-lacquered kikche wood with magical sails that can never lose the wind. You climb aboard and put out to sea, but now you must decide.">
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
			<SET-DESTINATION ,STORY091 2 ,STORY114>
		)(ELSE
			<SET-DESTINATION ,STORY091 2 ,STORY136>
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
			<TEST-IMMORTALITY 2 ,KILLED-AT-ONCE ,STORY092>
		)(ELSE
			<EMPHASIZE ,KILLED-AT-ONCE>
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
	<COND (,RUN-ONCE <TEST-IMMORTALITY 1 ,DIED-GREW-WEAKER ,STORY094>)>
	<COND (<IS-ALIVE>
		<CRLF>
		<TELL ,TEXT094-CONTINUED>
		<TELL ,PERIOD-CR>
		<COND (,RUN-ONCE
			<COND (<CHECK-SKILL ,SKILL-ETIQUETTE>
				<SET-DESTINATION ,STORY094 2 ,STORY139>
			)(ELSE
				<SET-DESTINATION ,STORY094 2 ,STORY063>
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
	<COND (,RUN-ONCE
		<RESET-CONTAINER ,PLAYER>
		<MOVE ,ALL-MONEY ,PLAYER>
	)>
	<RETURN ,STORY050>>

<CONSTANT TEXT096 "They succeed in dislodging several fat plums without disturbing any spiders. You watch as they squabble happily over the distribution of their spoils. Apparently you were just unlucky in finding a tarantula in the fruit you tried to pick, but the incident has deadened your appetite and you continue on your way without stopping to collect any of the plums yourself.">

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
	<KEEP-ITEM ,PADDLE>>

<CONSTANT TEXT100 "The woman dozes until the long red rays of late afternoon are drawing back across the treetops. Suddenly her arms jerk up as though on strings, seizing the pitcher and lifting it to reveal a second head is superficially humanoid, there is no mistaking it for any human face with its staring bloodshot eyes and black slit of a mouth.||Long black hair uncoils like tendrils from the monstrous head. Some of the tresses are up to two metres long, and you watch in revulsion as they form into thin matted stalks which remind you of an insect's legs. These probe the ground, preparing to support the creature's weight, and then with a grisly sucking sound the head pulls itself free of the sleeping woman's neck. As soon as it sets eyes on you it gives a gurgle of ghoulish glee and comes scuttling forward on its limbs of twisted hair. It uses some of these to propel itself up level with your face, snapping at your neck with its sharp chisel-shaped teeth while other strands of hair snake out to encircle your wrists. You cannot use a weapon now even if you have one; this struggle will be fought at close quarters.">

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
	<TEST-IMMORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY102>
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
	<TELL ,TEXT107-CONTINUED>
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
	<LOSE-SKILL ,SKILL-SPELLS>>

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
	<TEST-IMMORTALITY .DAMAGE ,DIED-FROM-INJURIES ,STORY110>
	<IF-ALIVE TEXT110-CONTINUED>>

<CONSTANT TEXT111 "You slam into him. For a creature formed of living shadow, he feels very solid.">

<ROOM STORY111
	(DESC "111")
	(STORY TEXT111)
	(PRECHOICE STORY111-PRECHOICE)
	(CONTINUE STORY226)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY111-PRECHOICE ()
	<TEST-IMMORTALITY 1 "You died from the impact." ,STORY111>
	<COND (<IS-ALIVE>
		<CRLF>
		<COND (<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
			<TELL "You get possession of the ball and send it bouncing against the end zone, scoring a point" ,PERIOD-CR>
			<SCORE-POINTS 1 ,PLAYER>
		)(ELSE
			<TELL "Your opponent gets the ball and scores a point" ,PERIOD-CR>
			<SCORE-POINTS 1 ,FOES>
		)>
	)>>

<CONSTANT TEXT112 "You slam the ball against the side wall then run backwards into the middle of the arena, keeping your eye on it as it bounces. A blow with your wrist sends it spinning up to strike the low-score zone, giving your team another point. It ricochets towards your opponents, who eagerly seize possession.">

<ROOM STORY112
	(DESC "112")
	(STORY TEXT112)
	(CONTINUE STORY181)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY112-PRECHOICE ()
	<SCORE-POINTS 1 ,PLAYER>>

<CONSTANT TEXT113 "\"You have done me a service, and yet you ask no favour in return,\" rumbles the giant. \"Hence I shall bestow my gift: immortality.\"||You wait but nothing happens. You don't feel any different. You raise your hands; you still look the same. \"Is that it?\"||\"Yes. Now your natural lifespan is infinite.\"||\"My natural lifespan?\" you say. A point like this is worth getting exactly right.||\"You will never die a natural death,\" the giant clarifies.||You don't know what to say. \"Er... well, thank you.\" Uppermost in your thoughts is that adventurers rarely die natural deaths in any case.||\"Also, you cannot suffer gradual injury,\" adds the giant. \"A single fatal accident can kill you outright, but that is all.\"||That sounds better. As the giant said, the only thing that can now kill you is an overwhelming catastrophe like falling into a volcano.">

<ROOM STORY113
	(DESC "113")
	(STORY TEXT113)
	(PRECHOICE STORY113-PRECHOICE)
	(CONTINUE STORY135)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY113-PRECHOICE ()
	<EMPHASIZE "You have become immortal. You cannot lose Life Points.">
	<SETG IMMORTAL T>>

<CONSTANT TEXT114 "Midnight Bloom agrees to a detour since it will give her the chance to buy some of the fine pottery that is brought from Nachan through the fens. Putting into a lagoon where there is a small fishing village, she tells you to be quick about checking the wizard's story. \"I would like to resume our journey to Tahil at first light,\" she says.||It is already late afternoon. The sun is trawling in the red net">

<ROOM STORY114
	(DESC "114")
	(STORY TEXT114)
	(CONTINUE STORY260)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT115 "The whirlwinds strike you with frightening force. The air is sucked out of your lungs and your limbs are stretched until you fear they will be torn from their sockets. With a burst of desperate strength, you break free of the demon's clutches and go staggering back across the sand.">
<CONSTANT TEXT115-CONTINUED "You must try another tack:">
<CONSTANT CHOICES115 <LTABLE "use a" "flee for your life">>

<ROOM STORY115
	(DESC "115")
	(STORY TEXT115)
	(PRECHOICE STORY115-PRECHOICE)
	(CHOICES CHOICES115)
	(DESTINATIONS <LTABLE STORY092 STORY137>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS NONE>)
	(TYPES <LTABLE R-SKILL R-NONE>)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY115-PRECHOICE ("AUX" (DAMAGE 3))
	<COND (,RUN-ONCE
		<COND (<CHECK-SKILL ,SKILL-SWORDPLAY>
			<SET DAMAGE 1>
		)(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
			<SET DAMAGE 2>
		)>
		<TEST-IMMORTALITY .DAMAGE ,DIED-FROM-INJURIES ,STORY115>
		<IF-ALIVE TEXT115-CONTINUED>
	)>>

<CONSTANT TEXT116 "Which temple do you wish to visit?">
<CONSTANT CHOICES116 <LTABLE "visit the temple of the War God" "the temple of the Moon Goddess" "or the temple of the Death God" "you do not think any of the priests will be of much help,and would ask the Matriarch to let you have some of the clan treasures">>

<ROOM STORY116
	(DESC "116")
	(STORY TEXT116)
	(CHOICES CHOICES116)
	(DESTINATIONS <LTABLE STORY231 STORY254 STORY277 STORY138>)
	(TYPES FOUR-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT117 "\"I was very nearly bitten by a tarantula!\" you tell the peasant as he comes up to the side of the causeway.||He mops at his brow. \"They enjoy the cool and moisture under the bunches of fruit,\" he remarks. \"Sometimes I wish I too were a tarantula, and not a poor farmer who must toil in this sweltering heat.\"||You smile, familiar with the customary grumblings of peasants. \"Let us hope the rains will be abundant this year,\" you say by way of conversation. \"The crops grow worse because of the drought.\"||\"In Yashuna the priests are holding a ceremony in honour of the Rain God,\" he says, nodding. Is it your imagination, or does a craft look come into his eye as he adds: \"My eldest son was going to attend the ceremony, but I need him to help me in the fields. Perhaps you would like to go in his place?\"||\"I presume the priests would not appreciate all and sundry poking their nose into such sacred rituals.\"||\"Quite so,\" he says. \"But I have here a jade bracelet which my son was told to wear. It authorizes him to take an intimate role in the proceedings. I could sell it to you for a cacao or two.\"||You study the bracelet he is holding out. It is in the shape of a water serpent with the glyph of the Rain God on its triangular head. \"In all candour, this is worth rather more than the sum mentioned,\" you reply cautiously.||He shrugs. \"I would be happy for any money at all in these hard times. Is it a deal, or not?">
<CONSTANT TEXT117-CONTINUED "Bidding the peasant good.day, you set off once more towards Yashuna">

<ROOM STORY117
	(DESC "117")
	(STORY TEXT117)
	(PRECHOICE STORY117-PRECHOICE)
	(CONTINUE STORY163)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY117-PRECHOICE ()
	<COND (<G? ,MONEY 0>
		<CRLF>
		<TELL "Buy " T ,SERPENT-BRACELET " for 1 " D ,CURRENCY "?">
		<COND (<YES?>
			<CHARGE-MONEY 1>
			<TAKE-ITEM ,SERPENT-BRACELET>
		)>
	)(ELSE
		<EMPHASIZE "You do not have enough cacao">
	)>
	<CRLF>
	<TELL ,TEXT117-CONTINUED ,PERIOD-CR>>

<CONSTANT TEXT118 "Straying deeper in the forest, you surprise a deer which bolts off through the undergrowth. It reminds you how hungry you are now.">
<CONSTANT CHOICES118 <LTABLE "hunt for food" "set a trap" "sneak up on some game" "search among your belongings for something to eat">>

<ROOM STORY118
	(DESC "118")
	(STORY TEXT118)
	(CHOICES CHOICES118)
	(DESTINATIONS <LTABLE STORY187 STORY210 STORY233 STORY256>)
	(REQUIREMENTS <LTABLE SKILL-TARGETING SKILL-WILDERNESS-LORE SKILL-ROGUERY NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT119 "Thoughts gradually come trickling back -- and, along with them, a dull sense of pain. You realize you are alive. A cold wet rock presses against your back. Above you is not the open sky but a grey-lit cavern roof.||You slowly raise your head. Your ordeal has left you as weak as a newborn child, and each movement feels as though the entire weight of the earth were pressing down on your limbs. You see that the slab of smooth rock on which you are lying is surrounded by an underground lake. Blood flows freely from a deep gash in your thigh, streaming into the black water like sunset swallowed up by the night.||A great reptilian head floats alongside the rock. You have the impression of an immense body of glistening green coils. Eyes which are aglow with the lore of centuries stare back at yours. The serpent's tongue flickers out on the water, tasting the blood that swirls there.||You slump back wearily. You are lying in the underworld and a water serpent is feasting on your lifeblood.">
<CONSTANT CHOICES119 <LTABLE "struggle to your feet and chase the serpent off" "lie still and do nothing">>

<ROOM STORY119
	(DESC "119")
	(STORY TEXT119)
	(CHOICES CHOICES119)
	(DESTINATIONS <LTABLE STORY166 STORY143>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT120 "Following the crowds, you pass under an archway at the north edge of the city. People go milling past and you find yourself carried by the surge of bodies along a plaster-paved causeway that leads through light woodland. You are surprised to see no buildings on this side of the city. The crowds are all eagerly discussing some great spectacle that lies in store, and you catch snatches of conversation as you are borne along. \"Now the Rain God will no longer forsake us,\" says one man. A woman who is carrying two squalling brats shouts back over her shoulder: \"Just so long as the sacrifice pleases him! Don't forget that.\"||Then the trees give way to an immense clearing. At first you cannot tell what lies ahead, but by pushing your way forward you reach the front of the crowd. Your breath escapes from your lungs in a gasp of awe. The clearing is formed by a gigantic hole in the ground. It looks as though the crust of the earth simply crumbled away to real an entrance into the underworld. The sinkhole is more than twenty metres deep and even a strong man could never hope to cast a spear right across to the far side. The sides of the pit are raw limestone clothed in a dry tangled mass of roots and creepers, dropping right down to the murky lake that occupies the bottom of this vast cavernous gulf.||\"What is it?\" you ask a priest standing beside you.||When he answers, you discover that your first wild impression was correct. \"This is the sacred well of Yashuna,\" he replies in a stately voice. \"It is the mouth of the underworld.\"">

<ROOM STORY120
	(DESC "120")
	(STORY TEXT120)
	(PRECHOICE STORY120-PRECHOICE)
	(CONTINUE STORY234)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY120-PRECHOICE ()
	<COND (<CHECK-ITEM ,SERPENT-BRACELET> <STORY-JUMP ,STORY257>)>>

<CONSTANT TEXT121 "You stumble into a bush whose sharply hooked leaves give you some nasty scratches. In ordinary circumstances such wounds would only be a painful nuisance. Here in the feverish dankness of the jungle, they soon go septic and begin to weep.">
<CONSTANT TEXT121-CONTINUED "You must decide what route to follow from here:">
<CONSTANT CHOICES121 <LTABLE "go right" "left" "straight ahead">>

<ROOM STORY121
	(DESC "121")
	(STORY TEXT121)
	(PRECHOICE STORY121-PRECHOICE)
	(CHOICES CHOICES121)
	(DESTINATIONS <LTABLE STORY075 STORY412 STORY029>)
	(TYPES THREE-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY121-PRECHOICE ()
	<COND (,RUN-ONCE <TEST-IMMORTALITY 1 ,DIED-FROM-INJURIES ,STORY121>)>
	<IF-ALIVE TEXT121-CONTINUED>>

<CONSTANT TEXT122 "You lash out with lightning speed, pinning the snake's head against the cliff-face before it can dodge. It writhes, hissing angrily and slapping the stone with its muscular coils, but is powerless to break free. You apply increasing pressure to its neck until it goes limp and drops to fall with a heavy plop in the river below.||You peer into the tomb. The darkness seems to rustle with unseen threats, but you know that it is just a figment of your imagination. You have dealt with the tomb guardian. Now you are eager to see if there is any treasure to be had.">

<ROOM STORY122
	(DESC "122")
	(STORY TEXT122)
	(CONTINUE STORY339)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT123 "\"Do you know the myths of the twins called Forethought and Afterthought?\" she asks. You shake your head. \"Well, it is very popular in these parts. This picture deals with the part of the story when the twins have crossed the desert and are about to pass into the Deathlands. First they must greet each of the four sentinels correctly: Lord Skull, Lord Blood -- \"||\"Milady,\" calls out one of the artisans, interrupting her. \"We've run out of the green dye. How about using blue for these feathers in the bloke's hat?\"||\"No, no! That won't do!\" she cries. Turning to you, she mumbles, \"Please excuse me...\" and hurries off to remonstrate with the artisans.">
<CONSTANT CHOICES123 <LTABLE "now either seek an audience with the King" "pay for lodging in the city if you have nay money">>

<ROOM STORY123
	(DESC "123")
	(STORY TEXT123)
	(CHOICES CHOICES123)
	(DESTINATIONS <LTABLE STORY077 STORY101>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT124 "Luckily for you, the royal guards consider that a simple task like beating up offenders is beneath their dignity. They give you a few sharp blows to teach you a lesson, then shove you across the courtyard. \"Beat it!\" growls one, jabbing you in the kidneys with the end of his staff. \"I don't want to catch sight of you hanging around here again.\"">

<ROOM STORY124
	(DESC "124")
	(STORY TEXT124)
	(PRECHOICE STORY124-PRECHOICE)
	(CONTINUE STORY262)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY124-PRECHOICE ()
	<TEST-IMMORTALITY 2 ,DIED-FROM-INJURIES ,STORY124>>

<CONSTANT TEXT125 "Scattering the chillies onto the dragon's tongue has the desired effect. He opens his mouth and spits you out with a great bellow of pain and surprise. You scrabble off to a safe distance before turning to watch his anguished attempts to wipe his tongue clean against the clifftop.||Kawak's rear head has blunt face with upcurving tusks and pallid globular eyes. He glowers at you and speaks with difficulty because of his burning tongue, saying, \"If you attempt to return this way, I shall devour you.\"||Bearing this warning in mind, you hurry onwards.">

<ROOM STORY125
	(DESC "125")
	(STORY TEXT125)
	(PRECHOICE STORY125-PRECHOICE)
	(CONTINUE STORY263)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY125-PRECHOICE ()
	<LOSE-ITEM ,CHILLI-PEPPERS>>

<CONSTANT TEXT126 "The head's spittle sprays into your eyes, stinging you like venom. Its strands of hair hug it to your neck, and you see its red eyes blazing with impending triumph. You must act quickly, or all is lost.">
<CONSTANT CHOICES126 <LTABLE "deliver a forearm smash to its jaw" "dive to the ground and try to force its face into the dirt" "attempt to batter it against the bole of the nearby tree">>

<ROOM STORY126
	(DESC "126")
	(STORY TEXT126)
	(CHOICES CHOICES126)
	(DESTINATIONS <LTABLE STORY334 STORY311 STORY378>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT127 "You turn away and push your way out of the crowd. There are those who say it is a great honour to be chosen for sacrifice, but you have no desire to witness the death of the two young people so soon after your own bereavement.||You journey north until the causeway ends. Dusty tracks fringed with scrubland carry you the rest of the way to the coast. A farmer directs you to the village of Balak. You pass through the streets, pace quickening as you catch the enticing smell of salt spray on the air. You emerge from between two high-roofed houses and there is the sea spread out in front of you, glittering under a cloudless blue sky.">
<CONSTANT CHOICES127 <LTABLE "use" "or" "otherwise">>

<ROOM STORY127
	(DESC "127")
	(STORY TEXT127)
	(CHOICES CHOICES127)
	(DESTINATIONS <LTABLE STORY370 STORY391 STORY158>)
	(REQUIREMENTS <LTABLE LETTER-OF-INTRODUCTION SKILL-SEAFARING NONE>)
	(TYPES <LTABLE R-ITEM R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT128 "You now realize that drinking from the well would have enabled you to see the occupants of the Deathlands as normal folk, but without that magic you must see them as they truly are in the eyes of the living: skeletal remains encrusted with teeming mould. Before you succumb to blind panic, you raise your wand and cast an enchantment of illusion over your own vision, allowing you to see them as they were in life. Now you can converse with them without a feeling of terror.">

<ROOM STORY128
	(DESC "128")
	(STORY TEXT128)
	(CONTINUE STORY106)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT129 "He gives a wild shriek of rage and plunges both knives towards you. The attack comes with such speed that you have no time to react, and for a split-second it seems your time has come. But the sentinel stops his lunge with perfect precision so that the tips of the blades just prick your skin. You look down to see two bright drops of blood forming on your chest.||This is no ordinary wound, however. No one can recover from an injury dealt by Lord Blood's knives.">

<ROOM STORY129
	(DESC "129")
	(STORY TEXT129)
	(PRECHOICE STORY129-PRECHOICE)
	(CONTINUE STORY084)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY129-PRECHOICE ()
	<TEST-IMMORTALITY 2 ,DIED-FROM-INJURIES ,STORY129>
	<COND (<IS-ALIVE>
		<SETG MAX-LIFE-POINTS <- ,MAX-LIFE-POINTS 2>>
		<COND (<G? ,LIFE-POINTS ,MAX-LIFE-POINTS> <SETG LIFE-POINTS ,MAX-LIFE-POINTS>)>
	)>>

<CONSTANT TEXT130 "The symbol on the diadem represents the World Tree, the source of all birth and regeneration. Whether its power is enough to restore the dead to life remains to be tested.||You carefully set the severed head upright on the sand and place the diadem over its brow. \"What do we do now?\" breathes the servant.||You admit you don't know. \"Just wait, I suppose.\"||The shadows flow like ink as the moon rises higher, laying a cool white patina over the desert that lends it a sense of strange enchantment. If you are ever to witness a miracle, tonight would be the time for it.||The moon reaches its zenith. Both you and the servant gaze up into the night sky, overawed by a shared sense of wonder at the countless stars. A moment later you share something else: a startled jump as a voice calls: \"By the gods! What am I doing buried up to my neck in the sand?\"||Although you were waiting for such a miracle, it is no less amazing now that it has happened. You dig the sand out from around the warrior's head to find his body has been wholly restored by the magic of the diadem. \"A miracle!\" gasps the servant. \"Master, this kind of traveller brought you back from the dead.\"||\"Nonsense,\" snaps the warrior, scuffing sand off his limbs, \"I must have been knocked out, that's all. Fancy burying me in the sand, you daft idiots!\"||It seems he intends to keep the gold diadem.">

<ROOM STORY130
	(DESC "130")
	(STORY TEXT130)
	(PRECHOICE STORY130-PRECHOICE)
	(CONTINUE STORY015)
	(CODEWORD CODEWORD-ANGEL)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY130-PRECHOICE ()
	<LOSE-ITEM ,GOLD-DIADEM>>

<CONSTANT TEXT131 "You have held back from using the Man of Gold until you really needed its power. Now the time has come. Holding the little manikin in your hand, you wait until you feel it beginning to stir and then place it on the floor of the passage.||The Man of Gold strikes a haughty pose as he surveys the tangle of wooden beams. His elongated head and theatrically imperious stance remind you of the nobles of long ago whom you have seen depicted in ancient paintings. Striding forward, he takes hold of two of the beams and braces them against the side walls. His strength is incredible -- despite his tiny size, he is able to support the whole passage while you push the other beams out of the way and continue on to the far end. Once you are safe, he drops the beams he is holding and the roof caves in. Coughing at the clouds of rock dust, you peer through the rubble but can see no sign of the Man of Gold.||The courtiers are already here waiting. \"You should have kept that manikin until you faced a real challenge,\" they mutter insidiously.">

<ROOM STORY131
	(DESC "131")
	(STORY TEXT131)
	(PRECHOICE STORY131-PRECHOICE)
	(CONTINUE STORY431)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY131-PRECHOICE ()
	<LOSE-ITEM ,MAN-OF-GOLD>>

<CONSTANT TEXT132 "The following evening you are shown into the House of Cold, where sparkling sheets of ice encase the walls and long icicles form pillars from floor to ceiling. Your breath curls like smoke in the freezing air as you stand shivering and watch the courtiers swing the heavy door shut.">
<CONSTANT CHOICES132 <LTABLE "use" "or" "otherwise">>

<ROOM STORY132
	(DESC "132")
	(STORY TEXT132)
	(CHOICES CHOICES132)
	(DESTINATIONS <LTABLE STORY155 STORY319 STORY178>)
	(REQUIREMENTS <LTABLE <LTABLE STONE LUMP-OF-CHARCOAL> FIREBRAND NONE>)
	(TYPES <LTABLE R-ALL R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT133 "He lunges into you as you try to get past. It is clearly a foul but from the way the courtiers are baying for blood you suspect the normal rules do not apply.">
<CONSTANT CHOICES133 <LTABLE "either run towards the enemy defensive player" "stand where you are and hope your partner can get the ball to you">>

<ROOM STORY133
	(DESC "133")
	(STORY TEXT133)
	(PRECHOICE STORY133-PRECHOICE)
	(CHOICES CHOICES133)
	(DESTINATIONS <LTABLE STORY111 STORY179>)
	(TYPES TWO-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY133-PRECHOICE ()
	<COND (,RUN-ONCE
		<COND (<CHECK-SKILL ,SKILL-AGILITY>
			<PREVENT-DEATH ,STORY133>
		)(ELSE
			<TEST-IMMORTALITY 1 ,DIED-FROM-INJURIES ,STORY133>
		)>
	)>
	<COND (<IS-ALIVE>
		<COND (<CHECK-CODEWORD ,CODEWORD-SHADE>
			<SET-DESTINATION ,STORY133 2 ,STORY203>
		)(ELSE
			<SET-DESTINATION ,STORY133 2 ,STORY179>
		)>
	)>>

<CONSTANT TEXT134 "\"The game is over,\" you announce, \"and we are the victors.\"||The voice speaks from the shrine in a croak of malice: \"You resorted to cheating. The wage of dishonour is death.\"||A flat metallic twang builds rapidly in the dry air. There is a sour taste on your tongue, and you can feel your hair standing on end. You glance at your partner just in time to see him explode in a blossom of silent white sparks, leaving nothing but a scorched black patch on the dusty ground.||Necklace of Skulls has vaporized him -- snuffed out his life with a casual flicker of sorcery! You are horrified by the callous murder, but you cannot waste time brooding on it now. If you don't act quickly, you will be next.">

<ROOM STORY134
	(DESC "134")
	(STORY TEXT134)
	(CONTINUE STORY019)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT135 "The giant gives a hiccup and something white rolls out of his mouth onto the sand.||\"What's that?\" you ask him.||\"Your brother's skull,\" he replies. \"Don't thank me. Its proper place in the scheme of things is here with you. I'm just the instrument of destiny in this case.\"||Tucking your brother's skull into your haversack, you set off along the beach. You have not gone more than a hundred paces when you hear a loud grunt followed by a damp sucking noise. You turn to see the giant hauling himself out of the ground. Throwing off the mass of sand and shingle that has accumulated around his body over aeons, he stands on the shore. He is big enough to climb the highest pyramid with two bounds.||You watch as the water closes over the black dome of his head, you turn away with a feeling of awe.">
<CONSTANT CHOICES135 <LTABLE "head on to Tahil by land" "by sea">>

<ROOM STORY135
	(DESC "135")
	(STORY TEXT135)
	(PRECHOICE STORY135-PRECHOICE)
	(CHOICES CHOICES135)
	(DESTINATIONS <LTABLE STORY228 STORY251>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY135-PRECHOICE ()
	<COND (,RUN-ONCE <TAKE-ITEM ,BROTHERS-SKULL>)>
	<COND (<CHECK-CODEWORD ,CODEWORD-SAKBE> <STORY-JUMP ,STORY300>)>>

<CONSTANT TEXT136 "The trader is prepared to detour south just to drop you off, but then you will have to find your own way to Tahil. \"It wasn't in our original agreement,\" he reminds you. \"My business is in Tahil, not in the fens.\"">
<CONSTANT CHOICES136 <LTABLE "agree to being set down on the mainland coast south of the Isle of the Iguana" "you would rather sail on to Tahil">>

<ROOM STORY136
	(DESC "136")
	(STORY TEXT136)
	(CHOICES CHOICES136)
	(DESTINATIONS <LTABLE STORY260 STORY300>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT137 "You race back towards the clifftops with the whirling demons hot on your heels. You can hear the screeching wind as they rush across the sand. And is it just your imagination, or can you also hear another sound behind the wind -- a sound like wild laughter?||You reach the cliff. The whirlwinds are right at your back. Trapped, you dive frantically to one side, landing heavily. You try to rise, but you are too exhausted to run any further.||Luckily you do not have to. The demons are unable to stop themselves, and pitch straight over the side of the cliff. You distinctly hear their cries of outrage and shock as the swirling eddies of dust and wind tumble downwards.||Breathing a sight of relief, you set off again into the west.">

<ROOM STORY137
	(DESC "137")
	(STORY TEXT137)
	(CONTINUE STORY161)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT138 "The Matriarch speaks to a servant, who goes bustling out and returns shortly leading two slaves bearing a large wooden chest. This is set down in front of the Matriarch's seat and the two slaves are ushered outside before it can be opened. The Matriarch beckons you over. \"These,\" she says, delving into the interior of the chest, \"are the treasures of our ancestors.\"||A golden figuring catches your eye. It is in the form of a muscular naked man with an elongated forehead. \"What is this?\" you ask.||\"The Man of Gold -- most ancient of all our treasures. It is said that in the earliest days of the world, the gods experimented with various substances to create life. One of the lesser gods tried using gold, but because it was so scarce he could only make a small human.\"||You lift the Man of Gold with a sense of awe. \"Is it alive, then?\"||\"If you hold it in your hands long enough, it will come to life through your body's warmth. Then it will serve you with great strength and skill -- but only once.\"||\"Only once?\" you ask. \"If it only works once, how does anyone know this?\"||The Matriarch responds with a sly wink. \"You have to trust your elders sometimes, Evening Star. Now, do you want the Man of Gold or would you rather take a look at the other treasures?\"">

<ROOM STORY138
	(DESC "138")
	(STORY TEXT138)
	(PRECHOICE STORY138-PRECHOICE)
	(CONTINUE STORY185)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY138-PRECHOICE ()
	<COND (<NOT <KEEP-ITEM ,MAN-OF-GOLD ,STORY093>>
		<CRLF>
		<TELL "You decided to choose from the rest of the treasures" ,PERIOD-CR>
	)>>

<CONSTANT TEXT139 "Your bearing and accent immediately mark you as a member of the nobility. The peasant stands watching you with a sullen expression. \"In these times of drought my fruit is precious to me,\" he says. \"But I will sell you a papaya for two cacao.\"||\"Your fruit is infested with poisonous spiders,\" you reply proudly. I am doubtful whether it is worth the risk of picking it, drought or not.\"||He compresses his lips, biting back an angry retort out of deference to your status. \"One cacao, then,\" he says.">
<CONSTANT TEXT139-CONTINUED "Bidding the peasant a curt good-day, you continue along the causeway towards Yashuna">

<ROOM STORY139
	(DESC "139")
	(STORY TEXT139)
	(PRECHOICE STORY139-PRECHOICE)
	(CONTINUE STORY163)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY139-PRECHOICE ()
	<COND (<G? ,MONEY 0>
		<COND (<NOT <CHECK-ITEM ,PAPAYA>>
			<CRLF>
			<TELL "Buy a papaya (1 " D, CURRENCY ")?">
			<COND (<YES?>
				<CHARGE-MONEY 1>
				<TAKE-ITEM ,PAPAYA>
			)>
		)(ELSE
			<EMPHASIZE "You already have that.">
		)>
	)(ELSE
		<EMPHASIZE "You do not have enough money for that.">
	)>
	<CRLF>
	<TELL ,TEXT139-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT140 "You steady yourself against the rough stone walls, only to recoil with a gasp of disgust. The brief contact has left an unpleasant coating of slime on your hands. You hurriedly wipe it away on your cloak. The stench grows stronger with each step you take until it is almost unbearable. You feel sick, but you manage to reach the chamber and stoop to inspect the item that caught your eye. It is a bowl of polished stone incised with the emblem of the Creator God, who gave life to all things. You need no special sense to recognize the aura of divine magic. This can only be the fabled Chalice of Life in which the gods brewed the primordial potion that birthed the ancestors of mankind.">
<CONSTANT TEXT140-CONTINUED "As you rise to return to the boat, however, a trickle of viscous slime drips from the roof of the chamber across your face. Spluttering, you look up. A shiver of horror runs through you as you see the creatures whose lair this is.||There are about a dozen of them, clinging to the walls and ceiling of tunnel like bloated pods. They are about as big as large dogs, humanoid in the upper body but with the hindquarters of giant snails. Their flesh, where it is exposed from their shells, glistens with thick mucus. There features are horribly unformed, like babies torn prematurely from their mother's womb, and they utter soft bleating cries as they close inexorable to block your escape">
<CONSTANT CHOICES140 <LTABLE "use an item" "fight your way to safety">>

<ROOM STORY140
	(DESC "140")
	(STORY TEXT140)
	(PRECHOICE STORY140-PRECHOICE)
	(CHOICES CHOICES140)
	(DESTINATIONS <LTABLE STORY305 STORY328>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY140-PRECHOICE ()
	<COND (,RUN-ONCE <KEEP-ITEM ,CHALICE-OF-LIFE>)>
	<CRLF>
	<TELL ,TEXT140-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT141 "A grip of iron closes on your arm and you are dragged bodily into the black pit inside the tree. A musky stench makes you reel as you a are pinned against a wall of moss and decaying wood. The creature's body is covered with rough scales and it begins to strangle you with remorseless strength. You can do nothing to save yourself, and your last thought is of the gold diadem clutched in your hand. You batter it against the creature in a futile struggle, bending the soft metal with no care for its value now. You will be the richest corpse in the forest.">

<ROOM STORY141
	(DESC "141")
	(STORY TEXT141)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT142 "You are surprised to find the market almost deserted. Contrary to your assumption, most of the populace are not headed here, but are streaming to the causeway that leads north out of the city.||The stalls are set up under awnings whose cool shade is welcoming after the dusty heat of the road.||You stand back and examine the wares on offer. The traders are doing so little business that you should have the chance of some real bargains.||You make a show of strolling casually past a number of stalls, careful not to give any sign of interest in the items you want most. This will help you when the haggling starts.||You find the following on sale:">

<ROOM STORY142
	(DESC "142")
	(STORY TEXT142)
	(PRECHOICE STORY142-PRECHOICE)
	(CONTINUE STORY188)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY142-PRECHOICE ()
	<MERCHANT <LTABLE WATERSKIN ROPE TERRACOTTA-EFFIGY BLOWGUN INCENSE> <LTABLE 1 2 3 3 3>>>

<CONSTANT TEXT143 "As more of your blood flows away, your growing sense of weakness begins to border on hallucination. A strange warmth spreads through you, as though the rock on which you are lying were not a cold stone in the waters of the underworld, but bathed in the rays of an unseen sun. The rhythmic slap of the serpent's tongue as it licks the blood-rimmed water lulls you into a dreamy state. Your head bobs up again, but this time without apparent effort. Staring at the serpent, you begin to imagine that you can see a tall figure standing with his feet on its coils. He looks like a king in his resplendent panoply of blue jade, copper and long turquoise quetzal feathers. You can only half make him out like an image seen in a cloudy mirror, but you see enough to tell that he is not a human being. He can only be the Rain God himself.">
<CONSTANT CHOICES143 <LTABLE "speak to the Rain God" "rise up and fight">>

<ROOM STORY143
	(DESC "143")
	(STORY TEXT143)
	(PRECHOICE STORY143-PRECHOICE)
	(CHOICES CHOICES143)
	(DESTINATIONS <LTABLE STORY212 STORY166>)
	(TYPES TWO-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY143-PRECHOICE ()
	<COND (,RUN-ONCE
		<TEST-IMMORTALITY 1 "You've died from losing too much blood" ,STORY143>
	)>>

<CONSTANT TEXT144 "The forest is a bewildering maze with walls of tattered green moss and gloomy bark. Sensing eyes upon you, you spin around but there is no one there. Are you being followed, or is your mind playing tricks on you?">
<CONSTANT CHOICES144 <LTABLE "veer off to the right" "go straight on from here" "decide to head left">>

<ROOM STORY144
	(DESC "144")
	(STORY TEXT144)
	(CHOICES CHOICES144)
	(DESTINATIONS <LTABLE STORY052 STORY121 STORY006>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT145 "The snake's head jabs forward and you feel its fangs sink into your flesh. A sensation like acid burning its way across your chest is immediately followed by a creeping numbness; panic is replaced by ghastly calm. You stare at the hooded monster coiled at your breast. It looks like a suckling demon in one of the mythological murals on temple walls. You watch the waves of muscular effort which pulse along its neck as it pumps the contents of its venom sac into your veins.||You slump to the ledge, unable to feel the cold stone against your flesh. A cloudy film moves in from the edges of your vision. The eyes of the serpent glimmer like the first stars of evening...||Darkness falls.">

<ROOM STORY145
	(DESC "145")
	(STORY TEXT145)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT146 "\"As you can see, the two figures in this part of the frieze are inverted,\" says the priestess. \"This is to indicate they are in the underworld.\"||\"But specifically who are they?\" you enquire. \"One seems to be a nobleman -- the other his slave, perhaps?\"||She nods. \"They are shown approaching the path into the afterlife. As the old adage goes, a rich man can only reach the afterlife if taken there by a poor man. That is why many nobles arrange to have their favourite servant buried with them in their tomb. But the picture in this case also has a symbolic meaning: the 'rich' man is the sun, escorted through the underworld each night by the planet Venus.\"||Her answers are very enlightening. If only you had had such lucid instruction from the priests in Koba you would have a better understanding of the ancient myths. Before you can ask her anything else, however, she is called away to inspect some details of the mural. You are left to ponder your next move.">
<CONSTANT CHOICES146 <LTABLE "go to the royal palace and ask to see the King" "spend some money on arranging a place to stay">>

<ROOM STORY146
	(DESC "146")
	(STORY TEXT146)
	(CHOICES CHOICES146)
	(DESTINATIONS <LTABLE STORY077 STORY101>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROOM STORY147
	(DESC "147")
	(EVENTS STORY147-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY147-EVENTS ()
	<COND (<CHECK-SKILL ,SKILL-AGILITY> <RETURN ,STORY193>)>
	<RETURN ,STORY216>>

<CONSTANT TEXT148 "The monster rushes forward on its strong stumpy legs, saliva pouring from its snapping jaws. You flinch back, expecting to feel a stab of pain as it sinks its teeth into your flesh, but it abruptly stops short as thought it has run in an invisible wall. It is powerless to do more than growl and make futile threatening lunges in your direction, but you edge past cautiously all the same.">

<ROOM STORY148
	(DESC "148")
	(STORY TEXT148)
	(CONTINUE STORY020)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT149 "Your options are limited and you must choose between them quickly.">
<CONSTANT CHOICES149 <LTABLE "match your strength against the head and try to fling it away" "fall to the ground and try grappling with it there">>

<ROOM STORY149
	(DESC "149")
	(STORY TEXT149)
	(CHOICES CHOICES149)
	(DESTINATIONS <LTABLE STORY334 STORY311>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT150 "Bitter life-sucking cold envelops you in the moment you enter the water. The shock almost stops your heart.">
<CONSTANT TEXT150-CONTINUED "Half in a swoon, you stumble weightlessly down the stairway towards a submarine glimmer of icy green light. If you stay in this water for much longer you know you are doomed">

<ROOM STORY150
	(DESC "150")
	(STORY TEXT150)
	(PRECHOICE STORY150-PRECHOICE)
	(CONTINUE STORY173)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY150-PRECHOICE ("AUX" (DAMAGE 2))
	<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE> <SET DAMAGE 1>)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-GREW-WEAKER ,STORY150>
	<COND (<IS-ALIVE>
		<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
			<EMPHASIZE "Your hardiness inures you to the extreme cold.">
		)>
		<CRLF>
		<TELL ,TEXT150-CONTINUED>
		<TELL ,PERIOD-CR>
	)>>

<CONSTANT TEXT151 "Seized by uncontrollable horror at the sight of your companion's ghastly transformation, you turn and run, not stopping until you are far from the kapok tree and its throng of gristly nobles.">

<ROOM STORY151
	(DESC "151")
	(STORY TEXT151)
	(CONTINUE STORY200)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT152 "The palace of Necklace of Skulls cannot be far from here, since it is reputed to lie at the western rim of the world. With a wry glance at the shimmering sun, you set out across the dunes.||Thankfully, the sun sets at last and the cool of evening comes on the breeze. By this time you are weary with heat and thirst, but you know you must press on to cover as much ground as possible. The stars emerge like a thousand gleaming pebbles seen in a stream. Moonlight soaks the sand in hues of charcoal and silver.||You reach the crest of a dune to find a dramatic scene unfolding before your eyes. Only thirty paces away, a warrior in jaguar-hide cloak stands confronting a giant serpent with four heads. The warrior's servant holds up a burning torch to give more light as his master moves forward. The torchlight looks like fresh blood along the monster's gruesome fang-rimmed jaws.">
<CONSTANT CHOICES152 <LTABLE "rush in to attack the monster" "sneak off while the warrior is fighting it" "stand by and watch what happens">>

<ROOM STORY152
	(DESC "152")
	(STORY TEXT152)
	(CHOICES CHOICES152)
	(DESTINATIONS <LTABLE STORY175 STORY365 STORY198>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT153 "\"If this is indeed Chalice of Life,\" you tell the servant, it is the very bowl in which the Lord of all Gods gave birth to mankind.\"||He looks on, appropriately wide-eyed with awe, as you lift the dead man's head and place it within the chalice. The two of you retreat to a distance of at least thirty paces, as though tacitly sharing a fear that the spot where the chalice rests is about to be struck by a thunderbolt.|| In fact what happens is far stranger. As the moon nears its zenith, its rays seem to become a stream of heavy vapour pouring directly down into the chalice. Soon you cannot see the head at all because the interior of the chalice is brimming with thick white mist. This rises up into a swirling column about two metres high which just hangs there above the chalice, shining with a core of moonbeams.||Suddenly a breeze arises briefly. This mist disperses at one, and as the last strands are blown away you behold the warrior standing in the chalice, his body once more made whole. He opens his eyes and watches you approach. \"What are you gawping at?\" he says.||The servant is so confused by feelings of joy, amazement and superstitious fear that he falls to the ground in a near faint. \"I've just restored you to life with that chalice,\" you tell the warrior.||\"Nonsense!\" He looks down. \"What chalice?\"||You note with dismay that the chalice has indeed vanished. Obviously such power is not meant to stay in one mortal's hands for long. You just hope that you used it wisely.">

<ROOM STORY153
	(DESC "153")
	(STORY TEXT153)
	(PRECHOICE STORY153-PRECHOICE)
	(CONTINUE STORY015)
	(CODEWORD CODEWORD-ANGEL)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY153-PRECHOICE ()
	<LOSE-ITEM ,CHALICE-OF-LIFE>>

<CONSTANT TEXT154 "You remove a second beam without mishap -- and a third. Just as you are beginning to feel confident, a deep crack appears instantaneously across the roof of the passage. It is accompanied by a growl of breaking rock. Your body stiffens. You are on the point of jumping back, but it is too late. A cascade of rubble knocks you flat. You lie with your hands over your head as rocks batter you, bruising ad scraping your flesh. You wince as you feel a rib cracking.">
<CONSTANT TEXT154-CONTINUED "You crawl on the end of the passage where the dog-like courtiers await you. \"I had a lucky escape,\" you say as you stagger to your feet.||The chief courtier sniggers. \"That was just a little practical joke of ours,\" he says. \"I thought you'd have no trouble! You'll have to buck your ideas up if you're going to survive the real tests.\"">

<ROOM STORY154
	(DESC "154")
	(STORY TEXT154)
	(PRECHOICE STORY154-PRECHOICE)
	(CONTINUE STORY431)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY154-PRECHOICE ()
	<TEST-IMMORTALITY 3 "You were buried underneath the rubble" ,STORY154>
	<IF-ALIVE TEXT154-CONTINUED>>

<CONSTANT TEXT155 "Unravelling a few fibres from your clothes, you use the stone to strike sparks off the walls until you have set the fibres alight. Then you carefully ignite a few splinters of charcoal and use this to get the rest of the lump burning.||The charcoal gives scant warmth, but it is better than nothing. Huddling beside your tiny fire, you spend a long miserable night waiting for the courtiers to let you out of the House of Cold.">

<ROOM STORY155
	(DESC "155")
	(STORY TEXT155)
	(PRECHOICE STORY155-PRECHOICE)
	(CONTINUE STORY202)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY155-PRECHOICE ()
	<LOSE-ITEM ,LUMP-OF-CHARCOAL>>

<CONSTANT TEXT155-WIN "You manage to send the ball soaring to strike one of the zones marked out along the top of the wall. You score a point">
<CONSTANT TEXT155-LOSE "You stumble and jar your elbow on the side pall, recoiling in agony while your opponent gains possession of the ball">

<ROOM STORY156
	(DESC "156")
	(PRECHOICE STORY156-PRECHOICE)
	(CONTINUE STORY179)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY156-PRECHOICE ()
	<CRLF>
	<COND (<CHECK-CODEWORD ,CODEWORD-POKTAPOK>
		<SCORE-POINTS 1 ,PLAYER>
		<TELL ,TEXT155-WIN>
	)(ELSE
		<TELL ,TEXT155-LOSE>
	)>
	<TELL ,PERIOD-CR>
	<COND (<CHECK-CODEWORD ,CODEWORD-SHADE> <STORY-JUMP ,STORY203>)>>

<CONSTANT TEXT157 "You do not need to fight Necklace of Skulls. You have beaten him at every turn, and he knows it. \"Listen to me, wizard,\" you call up to him. \"You put dangers across my path, but I prevailed. Your courtiers tested me with their ordeals, but I survived. You conjured men of shadow to contend against me in the ball game, but I won. You slew my brother once, but here he stands beside me, alive again!\"||There is no reply. Only cold brooding silence emanates from the lightless depths of the shrine.||You raise your fist. \"Stay out of our way in the future, Necklace of Skulls,\" you warn him. \"Keep to your palace and don't trouble living men with your noxious ways. Otherwise, my brother and I will return and pull that shrine down on top of you.\"||There is a long pause like the sigh of breath in a dying man's throat. \"Very well,\" says the sorcerer's voice. \"I agree to those terms.\"||The silence from the shrine somehow deepens. You sense that Necklace of Skulls has withdrawn his presence deep into the underworld.">

<ROOM STORY157
	(DESC "157")
	(STORY TEXT157)
	(CONTINUE STORY442)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT158 "You strike up conversation with a couple of traders who are down on the shore making repairs to their vessels. The first tells you he is setting out for Tahil tomorrow, and would be pleased to take you along. \"Not only for the sake of civilized company, either,\" he adds. There are pirates in the area, and an extra hand would be useful in deterring them.\"||\"I have a better deterrent in mind,\" says the other man, looking up from his work. \"I shall delay my journey for a week or so. By that time, the pirates will have already made enough from raiding other vessels to sail back to their homeland, leaving the coast clear.\"||\"Perhaps I could travel with you?\" you ask him.||He snorts. \"Not for free! I am partially deaf, so company is of no interest whether it be civilized or not. Also, I have just explained why I won't need a guard. If you want to come along, you can pay four cacao for your passage.">
<CONSTANT CHOICES158 <LTABLE "sail with the first man for free" "agree to pay and travel in a week">>

<ROOM STORY158
	(DESC "158")
	(STORY TEXT158)
	(CHOICES CHOICES158)
	(DESTINATIONS <LTABLE STORY280 STORY205>)
	(REQUIREMENTS <LTABLE NONE 4>)
	(TYPES <LTABLE R-NONE R-MONEY>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT159 "When can you reply with a well-mannered but firm objection, the lord immediately recognizes you as a fellow noble and apologizes. \"I took you for a common trader,\" he says, bowing contritely. \"I am very story.\"||\"These are difficult times,\" you say. \"Are all these people refugees from the Great City?\"||He glances along the quay. \"Either from there or the outlying farmlands. The attack on the city has sent a shockwave across the civilized world. From this day, certain fundamentals we have always taken for granted are suddenly thrown into question.\"||\"Such as where to get a servant capable of mixing a decent cup of spiced cocoa,\" you put in.||He laughs. \"Exactly. Well, I'd better find another ship for my family to travel in.\"||You wave your hand expansively. \"Not at all! I shan't be needing this one again, since I'm travelling on inland. I think perhaps if you gave my, er, servants here a few cacao for their trouble they could take you back to Balak.\"||Your travelling companions smile and nod their thanks to you when the lord's back is turned. Without another word, you take up your pack and set out towards Shakalla.">

<ROOM STORY159
	(DESC "159")
	(STORY TEXT159)
	(CONTINUE STORY085)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT160 "You emerge at last from the forest beside a village where you get directions to the city of Nachan. You pass west along a wooded ridge overlooking flat plains that stretch northwards towards the sea. The journey takes you a day and a night, and you have to sleep under the stars. Arising early, you yawn and stretch your cramped limbs. The countryside is swathed in fog which lies in hollows like an ocean of whiteness. You stroll onwards until the path emerges from a copse of trees and you stand overlooking a marvellous sight. You arrived at Nachan just a the moment of sunrise. The palaces and temples rise from the spectral fog: man-made hilltops thrusting through cloud. Beyond them lie the suburbs of the city, where lights twinkle like fading stars under the blanket of mist.||The warmth of day burns away the fog as you make your descent from the ridge. Now you can see the scintillant colours on the walls of the ceremonial buildings -- a vivid interplay of hues which is very unlike the austere white and red of Koba's palaces.||By the time you reach the level of the streets, the mist has retreated to just a few strands hanging around the upper steps of the pyramids and veiling the tree-covered hills that form a backdrop to the city. Already there are people hurrying to and fro. Some are carrying garlands of flowers while others in fanciful costumes are carpeting the roads with fresh west leaves. \"Is there a festival?\" you ask a passer-by.||\"Indeed there is,\" he replies. \"Tonight is the anniversary of the old king's death.\"">
<CONSTANT CHOICES160 <LTABLE "break your journey here" "head on overland towards Ashaka" "follow the river to the coast">>

<ROOM STORY160
	(DESC "160")
	(STORY TEXT160)
	(CHOICES CHOICES160)
	(DESTINATIONS <LTABLE STORY426 STORY008 STORY030>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT161 "Days pass. You have lost track of how long you have been travelling across the desert. The intense sun leeches the ground of all moisture and turns the horizon to a blaze of dazzling whiteness. Dusk brings no respite, but only an icy wind that leaves you shuddering inside your thin clothes. Your tongue is as dry as burnt paper, and blisters make every every step a misery.">

<ROOM STORY161
	(DESC "161")
	(STORY TEXT161)
	(PRECHOICE STORY161-PRECHOICE)
	(CONTINUE STORY207)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY161-PRECHOICE ()
	<COND (<CHECK-ITEM ,WATERSKIN> <STORY-JUMP ,STORY184>)>>

<CONSTANT TEXT162 "The Matriarch hands you a letter. \"Present this to Midnight Bloom, a distant cousin of yours who lives in the town of Balak on the northern coast,\" she explains. \"Midnight Bloom is an experienced seafarer, having traded the clan's goods with the distant city of Tahil for several years, and can arrange a passage for you there. Once in Tahil, you are halfway to your goal.\"||You take the letter of introduction. Rising to your feet, you bow to the Matriarch. \"I shall strive always to conduct myself with honour during my quest,\" you say.||\"See that you do,\" she replies. \"You wear the clan's honour on your shoulders.\" As you reach the door, she calls after you: \"Oh, and Evening Star --\"||\"You turn. \"My lady?\"||\"Good luck.\" She gives you one of her rare smiles -- a momentary crack in the sober mask of clan authority -- and waves you out into the bright sunshine.">

<ROOM STORY162
	(DESC "162")
	(STORY TEXT162)
	(CONTINUE STORY093)
	(ITEM LETTER-OF-INTRODUCTION)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT163 "Travelling on, you see a group of small children gazing longingly at the fruit growing in the orchard beside the causeway. One of them finds a stick and goes over to prod at a bunch of juicy plums. In the light of your recent experience, you wonder if they might be in danger from tarantulas.">
<CONSTANT CHOICES163 <LTABLE "give them some food from your own pack" "stand by and watch them pick the fruit">>

<ROOM STORY163
	(DESC "163")
	(STORY TEXT163)
	(CHOICES CHOICES163)
	(DESTINATIONS <LTABLE STORY186 STORY096>)
	(REQUIREMENTS <LTABLE <LTABLE MAIZE-CAKES PAPAYA> NONE>)
	(TYPES <LTABLE R-ANY R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT164 "Its talons cut your flesh with the force of obsidian blades as you strike again and again, trying desperately to fend off the attack while climbing down out of the monster's reach. Its hideous roars would make the braves warriors go faint with terror.">
<CONSTANT TEXT164-ARMED "You are able to deflect the worst lunges.">
<CONSTANT TEXT164-CONTINUED "You reach the ground and run off into the undergrowth. The creature shrieks its rage to the forest depths, unleashing a curse which pursues you with inescapable magical force: \"Thief, you will never again pilfer so easily, for I curse you now with clumsiness. Your foot will grow clubbed like a gnarled knot of wood, and you will stumble and falter from this day until the time of your death.\"">
<CONSTANT TEXT164-CHARMS "You are able to counteract the curse with sorcery of your own.">
<CONSTANT TEXT-END "The stabai have made themselves scarce, affrighted by the monster's anger. You are alone. Running until you have left the dead tree far behind, you lean breathlessly against a fallen log to examine the diadem. It is inlaid with a jade plaque in the cruciform shape of the sacred Tree of Life. You drop it into your pack ruefully, as it cost you dear">

<ROOM STORY164
	(DESC "164")
	(STORY TEXT164)
	(PRECHOICE STORY164-PRECHOICE)
	(CONTINUE STORY324)
	(ITEM GOLD-DIADEM)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY164-PRECHOICE ("AUX" (ARMED F) (DAMAGE 3))
	<COND (<OR <CHECK-SKILL ,SKILL-SWORDPLAY> <CHECK-SKILL ,SKILL-UNARMED-COMBAT>>
		<SET ARMED T>
		<SET DAMAGE 1>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY164>
	<COND (<IS-ALIVE>
		<COND (.ARMED <EMPHASIZE TEXT164-ARMED>)>
		<CRLF>
		<TELL ,TEXT164-CONTINUED>
		<CRLF>
		<COND (<CHECK-SKILL ,SKILL-AGILITY>
			<COND (<CHECK-SKILL ,SKILL-CHARMS>
				<EMPHASIZE TEXT164-CHARMS>
			)(ELSE
				<LOSE-SKILL ,SKILL-AGILITY>
			)>
		)>
		<CRLF>
		<TELL ,TEXT-END>
		<TELL ,PERIOD-CR>
	)>>

<CONSTANT TEXT165 "The causeway soon peters out and you leave the fields and orchards far behind. Light woodland begins to be replaced by the luxuriant foliage of the thick forest. After a few days you find yourself walking through deep leaf-rooted glades. Rainfall is more plentiful here than in the arid northern peninsula that is your homeland, and you are startled by the resulting profusion of vegetation and wildlife. For several days you subsist well enough on a diet of wild plums, avocados and breadnuts, but increasingly you find the plants of the region to be unfamiliar and you are no longer certain what is safe to eat.||Arriving at a wooden house, you introduce yourself the family living there. The man is a hunter who tells you that he formerly farmed a small plot near Yashuna. \"But lately the rains have been unreliable,\" he adds. \"At last I decided to bring my family south where the land is more bountiful.\"||\"Are there no dangers to living close to the forest?\" you ask, casting a wary eye at the forbidding gloom between the tall tree-trunks.||He nods and draws deeply on his pipe. \"Many! Apart from supernatural creatures such as the spiteful stabai and the strangler beast, there are also jungle people who will brook no outsiders in their territory. They claim to be the guardians of the World Tree, which supports the sky itself.\"||The hunter asks no payment for the food and hospitality he gives you but you feel obliged to offer him a cacao anyway. Then, bidding these kind people farewell, you set off west towards the great city of Nachan.">

<ROOM STORY165
	(DESC "165")
	(STORY TEXT165)
	(CONTINUE STORY209)
	(COST 1)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT166 "You realize that the sense of lassitude that afflicts you is a trance brought on by magic. The spell is broken as you rise to your feet and lash out at the serpent. It rears up from the water with an angry hiss. Its body is as thick as a tree and it has fangs like scythes of sharpened glass.||The battle is brief and bloody.">
<CONSTANT TEXT166-CONTINUED "You manage to drive the serpent off at last. You watch it swim away, sliding its glistening coils beneath the black water.||The soft sound of oars echoes across the cavern. You turn to see a canoe approaching out of the gloom, paddled by two of the strangest creatures you have ever seen.">

<ROOM STORY166
	(DESC "166")
	(STORY TEXT166)
	(PRECHOICE STORY166-PRECHOICE)
	(CONTINUE STORY097)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY166-PRECHOICE ("AUX" (DAMAGE 4))
	<COND (<CHECK-SKILL ,SKILL-SWORDPLAY>
		<SET DAMAGE 2>
	)(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
		<SET DAMAGE 3>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY166>
	<IF-ALIVE TEXT166-CONTINUED>>

<CONSTANT TEXT167 "The two demons continue their senseless chortling as they paddle you away form the rock tombs. It is a if they share some private joke -- and you have the unpleasant feeling that the joke is at your expense.">

<ROOM STORY167
	(DESC "167")
	(STORY TEXT167)
	(PRECHOICE STORY167-PRECHOICE)
	(CONTINUE STORY007)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY167-PRECHOICE ()
	<COND (<CHECK-ITEM ,JADE-BEAD> <STORY-JUMP ,STORY236>)>>

<CONSTANT TEXT168 "A rustling in the undergrowth warns you too late that what you took to be another gnarled tree root was in fact a long brown snake. It slithers away through the carpet of dead leaves after sinking its fangs into your ankle. You clutch your head as a wave of sudden weakness rolls over you. The snake was poisonous.||Taking advantage of the distraction to snatch back their shawl, the stabai go loping away into the forest. Their half-audible whoops of jubilation recede until they are just like the whisper of the breeze through the leaves.||You drop to your knees as the poison burns its way through your veins.">
<CONSTANT TEXT168-REMEDY "You bandage the wound and apply herbal remedies.">

<ROOM STORY168
	(DESC "168")
	(STORY TEXT168)
	(PRECHOICE STORY168-PRECHOICE)
	(CONTINUE STORY324)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY168-PRECHOICE ("AUX" (HERBAL F) (DAMAGE 4))
	<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
		<SET HERBAL T>
		<SET DAMAGE 2>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-GREW-WEAKER ,STORY168>
	<COND (<IS-ALIVE>
		<COND (.HERBAL <EMPHASIZE TEXT168-REMEDY>)>
		<LOSE-ITEM ,SHAWL>
	)>>

<CONSTANT TEXT169 "She tells you that the present king's father, Sky Shield, died exactly twenty sacerdotal years ago after a long and prosperous reign. \"You see that pyramid there -- that's where he's buried,\" she says, indicating a tall stepped structure adjoining the royal palace. Of all the buildings of Nachan, only this one is painted entirely red, with monochrome images outlined in white up its steep-stairway. Now that the sun has fully risen, the pyramid is beginning to shimmer in the heat like an image daubed in fresh blood.||\"His tomb is the shrine at the top?\" you ask.||\"No, that lies deep within the pyramid. When the tomb was sealed, the builders left a hollow tube extending up from the sarcophagus; it emerges in the shrine.\"||You raise your eyebrows quizzically. \"What is the purpose of that?\"||\"It's a speaking tube, of course. King Cloud Jaguar uses it when he wishes to commune with the spirit of his dead father.\"||She turns away to give instructions to the artisans, leaving you to decide what to do next.">
<CONSTANT CHOICES169 <LTABLE "seek an audience with the King" "spend some money to arrange a place to stay">>

<ROOM STORY169
	(DESC "169")
	(STORY TEXT169)
	(CHOICES CHOICES169)
	(DESTINATIONS <LTABLE STORY077 STORY101>)
	(TYPES TWO-NONES)
	(CODEWORD CODEWORD-PSYCHODUCT)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT170 "You place your blowgun so that it forms a bridge to the first spire of rock. Quickly crossing, you move the blowgun around to the next spire and proceed in steps right across the canyon.||By the time you are nearing the far side, you can hear alarming creaks each time you tread on the blowgun. It was never intended to be used like this. Reaching the safety of firm ground at last, you pick up the blowgun and inspect the damage. Your weight has bent it out of shape and split the wood, making it useless. Still, at least it got you across the dreaded Death Canyon. You glance back, shuddering now that you allow yourself to imagine the long drop down through those heavy volcanic clouds. Hopefully there should be no more obstacles as perilous as that.||Discarding the broken blowgun, you continue on your journey.">

<ROOM STORY170
	(DESC "170")
	(STORY TEXT170)
	(PRECHOICE STORY170-PRECHOICE)
	(CONTINUE STORY263)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY170-PRECHOICE ()
	<LOSE-ITEM ,BLOWGUN>>

<CONSTANT TEXT171 "You lower yourself off the causeway. Standing waist-deep in the foul mass of maggots and murky slime gives you a strong urge to vomit. The monster is left fairly hopping with rage, shuffling from one stumpy leg to another as it watches you wade across in the direction of the jetty. \"Cowardly mortal!\" it roars. \"Afraid to face me, eh?\"||Who wouldn't be afraid, with a face like that? In comparison, the maggots are unpleasant but not dangerous. You arrive at the jetty and pull yourself out of the mire, plucking maggots off the backpack which contains your possessions.">

<ROOM STORY171
	(DESC "171")
	(STORY TEXT171)
	(PRECHOICE STORY171-PRECHOICE)
	(CONTINUE STORY020)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY171-PRECHOICE ()
	<COND (<CHECK-ITEM ,HAUNCH-OF-VENISON>
		<TELL CR "The maggots consumed " T ,HAUNCH-OF-VENISON ,PERIOD-CR>
		<LOSE-ITEM ,HAUNCH-OF-VENISON>
	)>>

<CONSTANT TEXT172 "\"Nightcrawlers are disembodied heads that live in calabash trees and descend to glide through the air in the dead of night,\" the fenman tells you. \"They find their way into houses through the roof, and can sometimes be heard crunching the charcoal beside the hearth. I myself once woke after a night of disturbing dreams to find my stock of firewood had mysteriously vanished.\"||\"These nightcrawlers are mischievous creatures, then,\" you reply.||He gives a snort of grim laughter. \"I prefer to think of them as steeped in evil, in view of the fact that they also smother babies.\"||\"I shall be sure to keep a weather eye out for flying head,\" you assure him.||\"Oh, they are more cunning than that! A nightcrawler will sometimes latch onto a human neck, sinking tendrils into the host in the manner of a strangler fig taking root in another tree. In that guise, they may use trickery and guile to entice you off the road into the swamps.\"||\"Presumably the presence of two heads on a body is a sure giveaway, though?\" you say.||He shrugs as though this had never occurred to him. \"Salt is the only remedy,\" he maintains. \"Nightcrawlers are repelled by salt. Farewell to you, then.\" He strolls off towards his house and you are left to mull over his advise as you continue your journey on foot.">

<ROOM STORY172
	(DESC "172")
	(STORY TEXT172)
	(CONTINUE STORY264)
	(CODEWORD CODEWORD-CALABASH)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT173 "You reach the circle of light and plunge through, relieved to discover that you have emerged into open air. It is cold here, but nothing like the deadly cold of the lake.||You wring out your clothes and look around you. The water of the lake is suspended eerily about two metres above your head, forming a roof over this strange world that extends far off into the distance. On the horizon hangs a glaring ball of white light which sends its low rays slanting across the land. The light shines straight into your eyes giving you a headache. You raise one hand to shield yourself from the glare.||Now you notice that you are standing at a crossroads.">
<CONSTANT TEXT173-JADE "You remember that you were advised to keep the jade bead under your tongue until you reached a crossroads. You can take it out of your mouth, and choose to discard it altogether">
<CONSTANT CHOICES173 <LTABLE "use" "or" "pick a direction: take the white road" "the red road" "the black road" "the yellow road">>

<ROOM STORY173
	(DESC "173")
	(STORY TEXT173)
	(PRECHOICE STORY173-PRECHOICE)
	(CHOICES CHOICES173)
	(DESTINATIONS <LTABLE STORY289 STORY312 STORY243 STORY196 STORY219 STORY266>)
	(REQUIREMENTS <LTABLE SKILL-FOLKLORE SKILL-SPELLS NONE NONE NONE NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE R-NONE R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY173-PRECHOICE ()
	<COND (,RUN-ONCE
		<COND (<CHECK-ITEM ,JADE-BEAD>
			<CRLF>
			<TELL ,TEXT173-JADE>
			<TELL ,PERIOD-CR>
			<CRLF>
			<TELL "Discard " T ,JADE-BEAD "?">
			<COND (<YES?>
				<LOSE-ITEM ,JADE-BEAD>
			)>
		)>
	)>>

<CONSTANT TEXT174 "On a impulse you drop the jade bead into the well. As it falls into the water, it emits a gleam of gold-green light for an instant and then dissolves.">
<CONSTANT CHOICES174 <LTABLE "drink from the well" "not">>

<ROOM STORY174
	(DESC "174")
	(STORY TEXT174)
	(PRECHOICE STORY174-PRECHOICE)
	(CHOICES CHOICES174)
	(DESTINATIONS <LTABLE STORY197 STORY180>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY174-PRECHOICE ()
	<COND (,RUN-ONCE <LOSE-ITEM ,JADE-BEAD>)>>

<CONSTANT TEXT175 "You rush down the side of the dune and past the warrior, ignoring his gasp of surprise. You are eager to have the glory of killing this creature.">

<ROOM STORY175
	(DESC "175")
	(STORY TEXT175)
	(CONTINUE STORY222)
	(CODEWORD CODEWORD-ANGEL)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT176 "With the servant, you trek on until the stars are snuffed out by a limpid haze that heralds the approach of dawn. As the heat of the day grows stifling, you find shelter beneath a sand-blasted spar of rock where you rest until nightfall. Then you gather your belongings and set out again. The moon appears over the horizon and casts its colourless beams, lighting your way.||\"Am I now to serve you?\" asks the servant -- almost the first words you've exchanged since killing the hydra.||\"Consider yourself a free man,\" you tell him indifferently. \"Since we may be going to our deaths, it's only fitting that in your last days you should taste the benefits of freedom.\"||He casts a woebegone look at his sagging waterskin. \"If only you'd mention that earlier, I'd have retrieved my late master's waterskin. It seemed disrespectful at the time.\"">

<ROOM STORY176
	(DESC "176")
	(STORY TEXT176)
	(PRECHOICE STORY176-PRECHOICE)
	(CONTINUE STORY199)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY176-PRECHOICE ()
	<COND (<CHECK-ITEM ,WATERSKIN> <STORY-JUMP ,STORY220>)>>

<CONSTANT TEXT177 "A prayer springs to mind that seems appropriate now. As you step cautiously forward along the passage, you touch your amulet and recite: \"Let me not suffer misfortune, nor fall among deceivers; let me not suffer hurt upon the road, nor be impeded by obstacles to back or front; let me not suffer disgrace in my journey, nor be deterred by qualms. Grant me all this, O Lord of the Skies, by your divine grace.\"||You reach the end of the passage. The courtiers are crouching there in the shade of the wall. When they see you emerge unscathed they leap up with expressions of high dudgeon. The chief courtier recovers quickly from the surprise. He puts on an ingratiating smile as he slips his arm around your shoulder. \"Well, you got through that all right,\" he says. \"There's more to you than meets the eye.\"||One of the other courtiers sticks his head into the passage to inspect the vaulting. It immediately collapses. The courtier throws up his arms and has just time to give a startled yelp before he is buried under tons of falling rubble.||A cloud of dust gusts out of the passage. Once it has cleared the passage is entirely blocked. There is no sign of their unlucky courtier, except for a trickle of blood that seeps from under the debris and soaks into the dust at your feet.||\"Courtiers are getting thin on the ground these days,\" you say with a mocking smile.">

<ROOM STORY177
	(DESC "177")
	(STORY TEXT177)
	(CONTINUE STORY431)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT178 "You feel yourself getting drowsy as the chill seeps into your bones. If you fall asleep here you will certainly perish, so you force yourself to pace up and down the long hall. Ice crunches underfoot as you walk, and your limbs are soon blue with cold.">
<CONSTANT TEXT178-RESILIENCE "Your natural resilience helps you resist the cold">
<CONSTANT TEXT178-CONTINUED "It can only be raw determination that sustains you. When the courtiers come to open the door, you note with satisfaction that you have only one more ordeal to face. Then you will be taken to meet the one whom you hate more than any in the world, and yet have never seen. The sorcerer Necklace of Skulls">

<ROOM STORY178
	(DESC "178")
	(STORY TEXT178)
	(PRECHOICE STORY178-PRECHOICE)
	(CONTINUE STORY202)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY178-PRECHOICE ("AUX" (RESILIENT F)(DAMAGE 3))
	<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
		<SET RESILIENT T>
		<SET DAMAGE 2>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-GREW-WEAKER ,STORY178>
	<COND (<IS-ALIVE>
		<COND (.RESILIENT
			<CRLF>
			<TELL ,TEXT178-RESILIENCE>
			<TELL ,PERIOD-CR>
		)>
		<CRLF>
		<TELL ,TEXT178-CONTINUED>
		<TELL ,PERIOD-CR>
	)>>

<CONSTANT TEXT179 "The ball bounces towards your partner, who slams it across the arena in your direction.">
<CONSTANT TEXT179-HIGH "You bat it up into a high-scoring zone">
<CONSTANT TEXT179-LOW "You go for a safer shot but you still get one point">

<ROOM STORY179
	(DESC "179")
	(STORY TEXT179)
	(PRECHOICE STORY179-PRECHOICE)
	(CONTINUE STORY226)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY179-PRECHOICE ("AUX" (SCORED 1))
	<CRLF>
	<COND (<CHECK-SKILL ,SKILL-AGILITY>
		<SET SCORED 2>
		<TELL ,TEXT179-HIGH>
	)(ELSE
		<TELL ,TEXT179-LOW>
	)>
	<TELL ,PERIOD-CR>
	<SCORE-POINTS .SCORED ,PLAYER>>

<CONSTANT TEXT180 "You walk on until you reach the tree. The figures seated there are of macabre appearance: living skeletons whose bones are green with algae. Roots and soil clump their joints, and you can see snakes burrowing between the bars of their ribcages One raises a grinning skull-face to greet you. As it does, a butterfly opens wings of scarlet and gold across its emerald brow. If you saw such a sight in one of the murals on a temple wall, you might be moved to admire its uncanny beauty. Faced with such a thing in stark reality, however, you find yourself jumping back in fright. You hurry past without acknowledging the skeleton's welcoming gestures.">

<ROOM STORY180
	(DESC "180")
	(STORY TEXT180)
	(CONTINUE STORY200)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT181 "You were just beginning to feel confident, but now the shadow men make a daring play which abruptly turns your hopes to bleak despair. You watch aghast as they launch the ball in a smooth trajectory which carries it through the stone ring at the top of the wall. It is a one in a thousand shot, and by the rules of the contest it means that they have won.||Necklace of Skulls' pronouncement falls like an icy wave across the arena: \"The losers' lives are forfeit.\"||A flat metallic twang builds rapidly in the dry air. There is a sour taste on your tongue, and you can feel your hair standing on end. You glance at your partner just in time to see him explode in a blossom of silent white sparks, leaving nothing but a scorched black patch on the dusty ground.||Necklace of Skulls has vaporized him -- snuffed out his life with a casual flick of sorcery! You are horrified by the callous murder, but you cannot waste time brooding on it now. If you don't act quickly, you will be next.">

<ROOM STORY181
	(DESC "181")
	(STORY TEXT181)
	(PRECHOICE STORY181-PRECHOICE)
	(CONTINUE STORY019)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY181-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-VENUS> <DELETE-CODEWORD ,CODEWORD-VENUS>)>>

<CONSTANT TEXT182 "It is early in the morning when you make ready to sail. The sky is a shimmering pane of jade on which the last stars sparkle like dewdrops that are swiftly burnt away when the trembling red disc of the sun lurches up from the east.||Along with the half dozen other crewmen, you push the ship out through the cool grey waves and then jump aboard. Paddles are used to move out from the shores until the sail catches the breeze. Its triangular shape puts you in mind of an elegant bird unfolding its to soar.||The day passes pleasantly as you sail on keeping the shore in sight, but towards evening a cloud looms on the horizon. It indicates a storm blowing from out at sea. \"We must put out from the coastline,\" says one of the crew as you feel the wind rising. \"Otherwise we run the risk of being blown onto the reefs.\"||As the storm rolls over you, it turns the twilight to night and blots out any sign of the shore. Rain sweeps into your face, stinging your eyes with its force. The sailors cling to the mast and mutter prayers to the gods through chattering teeth. Their prayers go unheeded: the sea lifts your vessel like a toy and flings it far out into the unknown ocean.">

<ROOM STORY182
	(DESC "182")
	(STORY TEXT182)
	(CONTINUE STORY406)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT183 "\"Well, what are you waiting for?\" snaps the lord. \"I told you to get out of the ship as my family and I will now be needing it. If you expect payment --\"||You leap out onto the quay, \"Payment? For this wretched craft?\" you cry in an incredulous tone. \"Why, it has nearly cost me my life three times since I left home!\"||\"It looks sturdy enough,\" he says dubiously.||\"Cursed is what it is! Cursed by a woodland imp who dwelt in the tree from which the vessel was built. And cursed am I for being foolish enough to set sail in such a vessel, for I lost my aunt and most of my belongings when it last capsized under me!\"||The Lord looks at the vessel, then at the swelling crowd of refugees. Superstitious fear is struggling with necessity in his mind. \"I'll take the risk,\" he decides.||\"You're a brave man and no mistake!\" you say with an admiring sigh. \"Still, I can't let you take the ship for nothing.\"||\"I'm not paying you,\" he says witheringly.||\"Of course not, sir. I'll pay you, for taking it off my hands.\" You reach for your money-pouch. \"I think -- well twenty cacao would be fair, considering the trouble it's given me...\"||That convinces him. He backs away, dragging his family with him. \"Keep your money! We'll find another ship.\"||Bidding your travelling companions farewell, you set out towards Shakalla.">

<ROOM STORY183
	(DESC "183")
	(STORY TEXT183)
	(CONTINUE STORY085)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT184 "Thirst and weariness continue to sap your strength. Your small remaining supply of water is soon used up.">
<CONSTANT TEXT184-RATION "You manage to ration your supplies more effectively">
<CONSTANT TEXT184-CONTINUED "Your water skin is now used up">

<ROOM STORY184
	(DESC "184")
	(STORY TEXT184)
	(PRECHOICE STORY184-PRECHOICE)
	(CONTINUE STORY152)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY184-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
		<CRLF>
		<TELL ,TEXT184-RATION>
		<TELL ,PERIOD-CR>
		<PREVENT-DEATH ,STORY184>
	)(ELSE
		<TEST-IMMORTALITY 2 ,DIED-OF-THIRST ,STORY184>
	)>
	<COND (<IS-ALIVE>
		<CRLF>
		<TELL ,TEXT184-CONTINUED>
		<TELL ,PERIOD-CR>
		<LOSE-ITEM ,WATERSKIN>
	)>>

<CONSTANT TEXT185 "\"I cannot take this,\" you decide, replacing the golden statuette in the chest. \"It is too precious; the clan might one day need to use it.\"||\"Well said!\" declares the Matriarch, her eyes almost vanishing in her plump face as she beams with satisfaction at your answer. \"The treasures that remain are less potent in their magic, but may also prove useful.\"||There are three other items. The first is a small mirror of dark green glass with a powerful spell inscribed around the rim. \"It can be used to see into the future,\" the Matriarch tells you. \"As for this next item --\" she holds up a sealed jar \"-- it contains a magic drink concocted by your great-grandfather which is capable of healing grievous wounds.\"||\"And what of this?\" you ask, taking out a sword of sharpened green jade adorned with tiny glyphs.||\"That also belonged to your great-grandfather. It served him both as a weapon of war and as a tool of his sorcery.\"">

<ROOM STORY185
	(DESC "185")
	(STORY TEXT185)
	(PRECHOICE STORY185-PRECHOICE)
	(CONTINUE STORY208)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY185-PRECHOICE ()
	<SELECT-FROM-LIST <LTABLE GREEN-MIRROR MAGIC-POTION JADE-SWORD> 3 2>
	<COND (<CHECK-ITEM ,MAGIC-POTION>
		<EMPHASIZE "(You have taken the magic potion. Press 'D' to drink it)">
	)>>

<CONSTANT TEXT186-CONTINUED "The children accept your gift with a look of open-mouthed astonishment before darting shyly off through the orchard. Pleased with yourself at your good deed, you whistle a jaunty tune as you continue towards Yashuna">

<ROOM STORY186
	(DESC "186")
	(PRECHOICE STORY186-PRECHOICE)
	(CONTINUE STORY350)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT-HESITATE "You hesitate for a moment.">

<ROUTINE STORY186-PRECHOICE ("AUX" RESULT)
	<REPEAT ()
		<SET RESULT <GIVE-FROM-LIST <LTABLE MAIZE-CAKES PAPAYA> TEXT-HESITATE TEXT-HESITATE 1>>
		<COND (<EQUAL? .RESULT GIVE-GIVEN> <RETURN>)>
	>
	<CRLF>
	<TELL ,TEXT186-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT187 "Your dart brings down a small brocket of deer. It is scarcely bigger than a dog, but enough to assuage your hunger and leave you with a good haunch of venison to consume later.">

<ROOM STORY187
	(DESC "187")
	(STORY TEXT187)
	(PRECHOICE STORY187-PRECHOICE)
	(CONTINUE STORY279)
	(ITEM HAUNCH-OF-VENISON)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY187-PRECHOICE ()
	<GAIN-LIFE 1>>

<CONSTANT TEXT188 "As you leave the market, a tall fellow emerges from the portico bordering on the temple plaza and stands surveying the marketplace. He is carrying pots that mark him as a fisherman, presumably from one of the coastal towns to the north. \"Huh!\" he mutters, half to himself. \"Is there no demand for good fish these days?\"||\"Probably not when it is several days old,\" you remark, grimacing at the smell wafting from his goods.||He fixes you with a stare of outrage. \"Then buy one of my pots and take up fishing yourself!\" he cries, thrusting a lobster pot towards you. \"There! Destroy my livelihood, if you wish! I will sell you this pot for only two cacao.\"">
<CONSTANT TEXT188-CONTINUED "As you turn to go, he adds: \"I would give anything for a taste of decent bread. I have been on the road for two days with nothing but my own fish to sustain me -- and, as you so tersely put it, they are no longer of the best quality.\"">
<CONSTANT CHOICES188 <LTABLE "trade a parcel of" "otherwise go north" "south">>

<ROOM STORY188
	(DESC "188")
	(STORY TEXT188)
	(PRECHOICE STORY188-PRECHOICE)
	(CHOICES CHOICES188)
	(DESTINATIONS <LTABLE STORY211 STORY120 STORY165>)
	(REQUIREMENTS <LTABLE MAIZE-CAKES NONE NONE>)
	(TYPES <LTABLE R-ITEM R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY188-PRECHOICE ()
	<COND (<AND ,RUN-ONCE <G? ,MONEY 1> <NOT <CHECK-ITEM ,LOBSTER-POT>>>
		<CRLF>
		<TELL "Buy the lobster pot for 2 cacao?">
		<COND (<YES?>
			<CHARGE-MONEY 2>
			<TAKE-ITEM ,LOBSTER-POT>
		)>
	)>>

<CONSTANT TEXT189 "The sun dips across the treetops to the west, sending the hazy light of late afternoon slanting down into the well. You do not need the high priest's signal to know the moment has arrived. Steeling your nerves, you step out from the platform into empty space. The creeper-clad walls of the sinkhole go rushing by as you fall, then the water suddenly seizes you in a silent icy embrace. The impact drives the air out of your lungs and you flail wildly, carried inexorably down by the weight of your gold regalia. It would spell your death, but good luck is with you as always. One of the straps was not fastened securely, and you are able to shrug out of the encumbering regalia and strike up towards the surface.||It takes longer than you would have expected. Your lungs are bursting when you finally struggle up out of the water and gulp fresh air. You are on a rocky outcrop in the middle of a subterranean lake. There is no sign of the open sky. A wan grey light hovers in the air, no brighter than dusk.||A familiar noise echoes across the cavern. It is the splash of oars. You turn to see a canoe approaching, paddle by two bizarre nonhuman creatures.">

<ROOM STORY189
	(DESC "189")
	(STORY TEXT189)
	(CONTINUE STORY097)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT190 "The hard veins of luminous crystal running through the cavern wall make fine handholds. You quickly ascend to the ledge and stand inspecting the tombs. Each is sealed by a massive slab of stone bearing an engraved image of the person buried within. At first glance they look too solid for you to have nay hope of gaining entry, but then you notice that there is one slab which already has a crack in it. Even better, you discover a hammer lying on the ledge. You estimate that it would be an hour's hard work to smash a way into the tomb.">
<CONSTANT CHOICES190 <LTABLE "use" "break the tomb open using the hammer" "use the" "decide against further exploration of the tombs: return to the canoe and continue on your way.
">>

<ROOM STORY190
	(DESC "190")
	(STORY TEXT190)
	(CHOICES CHOICES190)
	(DESTINATIONS <LTABLE STORY283 STORY329 STORY306 STORY167>)
	(REQUIREMENTS <LTABLE SKILL-ROGUERY NONE MAN-OF-GOLD NONE>)
	(TYPES <LTABLE R-SKILL R-NONE R-ITEM R-NONE>)
	(ITEM HAMMER)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT191 "Ordinarily you might try to seize the cobra before it strikes. You have heard of hunters doing this, and your own reflexes are as sharp as any man's. But at the moment your arms are trembling, muscles turned to jelly by the exertions of the past two hours. You could not rely on getting a firm grip.||The cobra is about to attack. It puts its head back, neck bracing for the lethal strike -- an action which momentarily blinds it. It is the one chance you will get, and you do not hesitate. You take a swift step closer and thrust your head forward with all your strength. There is aloud crack as your forehead slams into the cobra and crushes it back into the hard stone of the wall.||You reel back, stunned. The cobra drops limply to the floor and writhes there weakly until you recover your wits enough to stamp on it. Nursing a swelling bump on your head, you squeeze through into the tomb.">

<ROOM STORY191
	(DESC "191")
	(STORY TEXT191)
	(CONTINUE STORY339)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT192 "Your are invited to join King Cloud Jaguar and the nobles of his court in the steam-bath adjoining the palace. This is a domed room which is entered through an aperture so low that each bather has to crawl through on hands and knees.||Inside are rows of stone benches, and the middle of the floor is taken up by a pit filled with pebbles which have been warmed earlier in a fire until they are red-hot. Servants brings pitchers of scented water which sizzles on contact with the hot pebbles, releasing clouds of steam that make the sweat pour from your skin. At first you can hardly stand to draw a breath, but gradually you get used to the sweltering heat and start to enjoy the cleansing feeling. An old nobleman nudges you and hands you some herbs. \"Rub these on your body,\" he grunts. \"Most invigorating!\"">
<CONSTANT TEXT192-CONTINUED "You regain vitality owing to the restorative effect of the herbs and the steam-bath. You also get the chance to ask about the next day's festivities, and you are told that this is the anniversary of the old king's death. When Cloud Jaguar learns of your quest, he is very impressed by your bravery. \"The pillaging of the Great City will have dire consequences,\" he says. \"I have heard tales of demons and werewolves ransacking the temples. Perhaps you can find out the truth on the matter.\"||You bow respectfully. \"I will try, your Majesty.\"||\"You will spend the night in the shrine atop my father's pyramid,\" he continues. \"A tube connects the shrine to the tomb chamber. If it is the will of the gods, my father's spirit may appear to you and offer guidance.\"||You cannot refuse without giving offence. Whatever you think of meeting the late king's ghost, you must do as Cloud Jaguar has commanded. You spend the rest of the day in a mood of excitement tinged with dread, and at nightfall you are taken up to the top of the pyramid and left alone to await the ghost's appearance">

<ROOM STORY192
	(DESC "192")
	(STORY TEXT192)
	(PRECHOICE STORY192-PRECHOICE)
	(CONTINUE STORY415)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY192-PRECHOICE ()
	<GAIN-LIFE 2>
	<CRLF>
	<TELL ,TEXT192-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT193 "With a long bound, you launch yourself from the edge of the canyon onto the first of the spires of rock. Only now do you discover that it is red hot, but you remain undaunted. Careless of the long drop that surrounds you on all sides, you fall into an easy leaping gait which carries you from one spire to the next without pause. You have reached the far side of the canyon even before the heat of the rock can start to scorch your shoes.">

<ROOM STORY193
	(DESC "193")
	(STORY TEXT193)
	(CONTINUE STORY263)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT194 "The monster charges along the causeway. Its three legs are short but thick with muscle, giving it a powerful lurching gait. You almost retch at the foul animal stench of its breath as it opens its jaws to snap at you. You dodge away, trying to move around to the side before counter-attacking. Your reasoning is that its tripedal stance will make it slow to turn. Unfortunately you guessed wrong: it simply rears back onto its hind leg and whirls about to face you, ripping a hunk of flesh from your arm as you step in to strike it.">
<CONSTANT TEXT194-CONTINUED "You finally manage to fight your way past the monster and go running on towards the jetty.">

<ROOM STORY194
	(DESC "194")
	(STORY TEXT194)
	(PRECHOICE STORY194-PRECHOICE)
	(CONTINUE STORY020)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY194-PRECHOICE ("AUX" (DAMAGE 4))
	<COND (<CHECK-SKILL ,SKILL-SWORDPLAY>
		<SET DAMAGE 2>
	)(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
		<SET DAMAGE 3>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY194>
	<IF-ALIVE TEXT194-CONTINUED>>

<CONSTANT TEXT195 "Despite your horror of the macabre creature, you force yourself to close with it in a desperate effort to the end the fight quickly. Its black maw drops open in a triumphant hiss as it lifts its host body's limbs to grapple with you. You are alarmed by the force in its blows: the poor woman it is attached to is being forced to do its bedding with a strength beyond human endurance.">

<ROOM STORY195
	(DESC "195")
	(STORY TEXT195)
	(PRECHOICE STORY195-PRECHOICE)
	(CONTINUE STORY288)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY195-PRECHOICE ("AUX" (DAMAGE 5))
	<COND (<CHECK-SKILL ,SKILL-SWORDPLAY>
		<SET DAMAGE 2>
	)(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
		<SET DAMAGE 3>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY195>>

<CONSTANT TEXT196 "You start out along the road, relieved at the fact that this leaves the dazzling sun of the underworld at your back. You trudge on for hours. For more than hours. Time begins to have no meaning. It seems you are waling on sand, illuminated by a ruddy glow. Your pulse sounds like the roar of the tide. The redness becomes a deep gloomy haze. You feel you can hardly breathe. Each step weighs you down, but you struggle onward towards a blaze of light...||You awaken with a sobbing intake of breath. You are back in your clanhouse in Koba. You have returned through time and space to the start of your adventure. You have a chance to begin again, forewarned by your previous mistakes.">

<ROOM STORY196
	(DESC "196")
	(STORY TEXT196)
	(PRECHOICE RESET-UNIVERSE)
	(CONTINUE STORY001)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT197 "The drink proves cool and invigorating.">
<CONSTANT TEXT197-CONTINUED "You walk on until you reach the tree, passing throngs of wandering souls on your way. All have their arms raised to shield their eyes from the terrible glare of the eternally setting sun. Those under the tree, however, lounge in comfort. They are shaded from the sunlight by the dense foliage. From their rich costumes you perceive them to be the souls of nobles, who enjoy this privilege by reason of their status.">
<CONSTANT TEXT197-NOBLE "The nobles recognize you as one of them and invite you to sit">
<CONSTANT TEXT197-BEGONE "They react haughtily, telling you to begone">

<ROOM STORY197
	(DESC "197")
	(STORY TEXT197)
	(PRECHOICE STORY197-PRECHOICE)
	(CONTINUE STORY200)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY197-PRECHOICE ()
	<GAIN-LIFE 2>
	<CRLF>
	<TELL ,TEXT197-CONTINUED ,PERIOD-CR>
	<COND (<CHECK-SKILL ,SKILL-ETIQUETTE>
		<TELL ,TEXT197-NOBLE>
		<STORY-JUMP ,STORY106>
	)(ELSE
		<TELL ,TEXT197-BEGONE>
	)>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT198 "You see the jagged outline of a sword in the warrior's hand. He is no fool. He realizes the sword is not long enough to reach the vulnerable point where the four huge necks join the monster's body, so he begins by dodging away from its attacks. This forces it to haul its bulk closer. As it does, the warrior suddenly rushes in to the attack.||At first it seems the ploy might work -- three of the heads are extended, slavering eagerly, and he easily jumps past their guard. But from your vantage point you see that he should have made more of his pretence at retreating, since one of the heads has stayed cautiously aloft on the long stalk of its neck, watching warily like a hovering eagle. It lashes down with terrifying ferocity when the warrior is still an arm's length from making his strike. His head is severed from his body in a single snap of those long jaws.||You hurriedly descend the slope of the dune. The fallen warrior's head rolls across the sand and comes to rest at your feet. You glare up at the monster, determined not to fall victim to it in the same way. It sees you and gives vent to four predatory snarls.||You move in. You have no choice. You must slay the hydra or you cannot reach your goal.">

<ROOM STORY198
	(DESC "198")
	(STORY TEXT198)
	(CONTINUE STORY222)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT199 "You are trembling with thirst and exhaustion. Your mouth feels as dry as the endless wastes surrounding you.">

<ROOM STORY199
	(DESC "199")
	(STORY TEXT199)
	(PRECHOICE STORY199-PRECHOICE)
	(CONTINUE STORY220)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY199-PRECHOICE ("AUX" (HARDY F) (DAMAGE 2))
	<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
		<SET HARDY T>
		<SET DAMAGE 1>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-OF-THIRST ,STORY199>
	<COND (<IS-ALIVE>
		<COND (.HARDY
			<CRLF>
			<TELL ,NATURAL-HARDINESS>
			<TELL ,PERIOD-CR>
		)>
	)>>

<CONSTANT TEXT200 "You find a river -- not of blood this time, but of cold pus-coloured fluid -- and follow its course through pale rolling dales until you come to a massive stone arch. Peering inside, you see steps rising up a long a tunnel that goes up through the layer of water roofing the Deathlands. From far ahead comes a shaft of true daylight. You have the way back to the land of the living.||You advance up the tunnel. Soon you can see the bright sunlight ahead, and smell the clean air of the upper world. But to reach it you must run a perilous gauntlet, for now you see that the passage is guarded by four baleful sentinels who sit in alcoves along the walls. They are nearly twice as big as you, with faces of brooding nightmare and talons like jaguar's teeth. From the legends you heard in childhood, you know that the only way safely past these four is to greet each by name.">
<CONSTANT CHOICES200 <LTABLE "make use of either" "or" "otherwise, if you have none of those">>

<ROOM STORY200
	(DESC "200")
	(STORY TEXT200)
	(PRECHOICE STORY200-PRECHOICE)
	(CHOICES CHOICES200)
	(DESTINATIONS <LTABLE STORY267 STORY290 STORY313>)
	(REQUIREMENTS <LTABLE SKILL-FOLKLORE SKILL-ROGUERY NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY200-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-ZAZ> <STORY-JUMP ,STORY244>)>>

<CONSTANT TEXT201 "A deep crunch reverberates through the stone around you and cracks appear in the corbels of the roof with such startling suddenness that they could almost be long splashes of ink. But you know that they are not, and even as the masonry blocks start to shift you are throwing yourself into a forward somersault that carries you safely to the end of the passage. There you turn to see a thick cloud of rock dust billowing out. When the dust settles, the passage has been entirely buried under huge slabs of fallen masonry.||The courtiers join you. \"You're quick on your feet,\" says the chief courtier, patting your shoulder.||You instinctively recoil at his touch. You make no pretence at hiding your loathing as you look at him. \" get the feeling I'm going to need to be.\"">

<ROOM STORY201
	(DESC "201")
	(STORY TEXT201)
	(CONTINUE STORY431)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT202 "When it is time for you to be taken to the House of Gloom, the courtiers summon you with surly grunts. It is obvious from their glowering looks that they did not expect you to endure this long. As they prod you through the doorway, the chief courtier is struck by inspiration.||\"You have been cheating in the ordeals,\" he says. \"Using items to help you. Give me your travelling pack.\" He takes the pack containing your belongings and places it outside the door. \"It will be returned to you tomorrow. If you survive.\" It is a dingy cobweb-strewn chamber with many shadowy recesses. The packed-earth floor rises at intervals in long low mounds. Something about the place stirs the hairs on the nape of your neck. You feel the tingle of awakening dread as you ask: \"What is the ordeal here?\"||The chief courtier places a single short candle on the floor just inside the door. \"This is the place where our ancestors are buried. See those mounds? Their graves. If you can keep the candle alight until morning, they'll leave you alone. But it goes out then their ghosts wills be sure to pay you a visit.\"||The door grates shut, leaving just the trembling flame of the candle between you and eldritch terror.">

<ROOM STORY202
	(DESC "202")
	(STORY TEXT202)
	(PRECHOICE STORY202-PRECHOICE)
	(CONTINUE STORY294)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY202-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-IGNIS>
		<STORY-JUMP ,STORY248>
	)(<CHECK-SKILL ,SKILL-CUNNING>
		<STORY-JUMP ,STORY271>
	)>>

<CONSTANT TEXT203 "The ball bounces towards your brother, but with one arm held to his brow he is not nimble enough to get possession and send it back to you. The attacking shadow man leaps up swatting the ball against one of the scoring zones.">

<ROOM STORY203
	(DESC "203")
	(STORY TEXT203)
	(PRECHOICE STORY203-PRECHOICE)
	(CONTINUE STORY226)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY203-PRECHOICE ()
	<SCORE-POINTS 1 ,FOES>>

<CONSTANT TEXT204 "You place a dart directly between his cobwebby eyes. It would kill any mortal man, but Necklace of Skulls has endured for a thousand years. The sorcery he used to prolong his life turned him into a creature halfway between life and death. He reels back, giving vent to a roar of anguish that sounds like the sky being ripped in two, and pulls the dart out of his bloodless flesh.||You race up the pyramid steps towards him, ducking as he sends a fountain of ultraviolet fire streaming from his fingertips. It scorches your flesh. A direct hit would have charred you to the bone.">
<CONSTANT TEXT204-CONTINUED "Before he has time for another spell, you have closed with him for the final battle">

<ROOM STORY204
	(DESC "204")
	(STORY TEXT204)
	(PRECHOICE STORY204-PRECHOICE)
	(CONTINUE STORY296)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY204-PRECHOICE ()
	<TEST-IMMORTALITY 1 ,DIED-FROM-INJURIES ,STORY204>
	<COND (<IS-ALIVE>
		<CRLF>
		<TELL ,TEXT204-CONTINUED>
		<TELL ,PERIOD-CR>
		<COND (<CHECK-CODEWORD ,CODEWORD-VENUS> <STORY-JUMP ,STORY240>)>
	)>>

<CONSTANT TEXT205 "You have a week to while away before you set sail.">
<CONSTANT TEXT205-FISH "You fish for food in this time">
<CONSTANT TEXT205-POISONING "You are reduced to begging for scraps and collecting snails along the shore. This soon results in mild food poisoning">

<ROOM STORY205
	(DESC "205")
	(STORY TEXT205)
	(PRECHOICE STORY205-PRECHOICE)
	(CONTINUE STORY182)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY205-PRECHOICE ("AUX" (FISHED F))
	<COND (<OR <CHECK-SKILL ,SKILL-SEAFARING> <CHECK-SKILL ,SKILL-WILDERNESS-LORE>>
		<SET FISHED T>
	)(<CHECK-ITEM ,LOBSTER-POT>
		<SET FISHED T>
		<LOSE-ITEM ,LOBSTER-POT>
	)>
	<CRLF>
	<COND (.FISHED
		<TELL ,TEXT205-FISH>
		<TELL ,PERIOD-CR>
		<PREVENT-DEATH ,STORY205>
		<SETG LIFE-POINTS ,MAX-LIFE-POINTS>
	)(ELSE
		<TELL ,TEXT205-POISONING>
		<TELL ,PERIOD-CR>
		<TEST-IMMORTALITY 1 ,DIED-OF-HUNGER ,STORY205>
	)>>

<CONSTANT TEXT206 "Your sword lashes out, clattering loudly against the lord's. The crowd stares in excitement and horror as the two of you circle warily. You see the lord's wife draw her children protectively against her skirts. You lunge in close. Your opponent's sword comes up in a desperate parry that breaks splinters off its obsidian edge. He grunts as a red weal appears across his arm, but he responds with a clubbing upswing of the sword hilt that leaves you stunned.||The fight goes on, carrying you to and fro across quay. At last you score a mighty blow that slashes his hand knocking his sword into the water. He gives a snarl which is as much annoyance as pain, then pulls his family off into the crowd.||You are bleeding from several deep cuts.">
<CONSTANT TEXT206-CONTINUED "You manage to bind your wounds with strips of cloth. Then, bidding your grateful travelling companions goodbye, you set out towards Shakalla.">

<ROOM STORY206
	(DESC "206")
	(STORY TEXT206)
	(PRECHOICE STORY206-PRECHOICE)
	(CONTINUE STORY085)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY206-PRECHOICE ()
	<TEST-IMMORTALITY 2 ,DIED-IN-COMBAT ,STORY206>
	<IF-ALIVE TEXT206-CONTINUED>>

<CONSTANT TEXT207 "Your head is pounding and it feels as though a rough rope has been used to scour your throat. You recognize the symptoms of dehydration. Without water, you will die.||You find three plants that might yield the moisture you need. The first is a large barrel-shaped cactus with a milky sap. The second is a clump of rough spiky leaves with a single long stalk growing up from the centre. The last is another cactus, paler in colour than the first, comprising many flattened bulbous segments with squashy fruits.">
<CONSTANT CHOICES207 <LTABLE "use" "get moisture from the barrel cactus" "the spiky-leafed plant" "the bulbous cactus" "you think none of these plants will help you">>

<ROOM STORY207
	(DESC "207")
	(STORY TEXT207)
	(CHOICES CHOICES207)
	(DESTINATIONS <LTABLE STORY230 STORY253 STORY276 STORY299 STORY322>)
	(REQUIREMENTS <LTABLE SKILL-WILDERNESS-LORE NONE NONE NONE NONE>)
	(TYPES <LTABLE R-SKILL R-NONE R-NONE R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT208-MAGIC-POTION "It can be used once during your adventure. It will restore 5 lost Life Points, up to the limit set your your initial Life Points score. Press 'D' to drink it">
<CONSTANT TEXT208-GREEN-MIRROR "It can be used once -- and only once -- at any point in your adventure before deciding which you will choose. (Press 'M' to use it)">
<CONSTANT TEXT208-JADE-SWORD "It counts as both a sword and a wand for the purposes of skill-use">

<ROOM STORY208
	(DESC "208")
	(PRECHOICE STORY208-PRECHOICE)
	(CONTINUE STORY093)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY208-PRECHOICE ("AUX" (COLON-SPACE ": "))
	<CRLF>
	<COND (<CHECK-ITEM ,MAGIC-POTION> <PRINT-CAP-OBJ ,MAGIC-POTION> <TELL .COLON-SPACE> <TELL ,TEXT208-MAGIC-POTION> <TELL ,PERIOD-CR>)>
	<COND (<CHECK-ITEM ,GREEN-MIRROR> <PRINT-CAP-OBJ ,GREEN-MIRROR> <TELL .COLON-SPACE> <TELL ,TEXT208-GREEN-MIRROR> <TELL ,PERIOD-CR>)>
	<COND (<CHECK-ITEM ,JADE-SWORD> <PRINT-CAP-OBJ ,JADE-SWORD> <TELL .COLON-SPACE> <TELL ,TEXT208-MAGIC-POTION> <TELL ,PERIOD-CR>)>>

<CONSTANT TEXT209 "A sense of awe comes over you while walking through the green gloom that lies between the soaring tree-trunks of the forest. Dragonflies flash with the colours of copper, obsidian and gemstones as they dart in and out of the scattered beams of sunlight. Monkeys chitter unseen high above your head, crashing the thick foliage aside as they tumble from branch to branch. A dust-like swirling in the shadows is in fact the flight of countless tiny gnats. There is a hot perfumed dampness here: the rich odour of the forest floor rising to mingle with the scent that trickles down from brightly hued orchids. You pass huge fanciful growths of fungi which look like unearthly stones dropped by the gods.||A sparkle of bright light catches your eye. Standing some distance off, framed in the eternal twilight of the jungle like a jewel displayed on dark cloth, is a bewitching figure. She turns her face towards you and you give a gasp of surprise. Her features -- her whole body -- are suffused with a dazzling golden radiance that seems to shine from her very skin. With a musical laugh, she swirls her shawl up around her shoulders and starts to dance between the trees.">
<CONSTANT CHOICES209 <LTABLE "pursue her" "not">>

<ROOM STORY209
	(DESC "209")
	(STORY TEXT209)
	(CHOICES CHOICES209)
	(DESTINATIONS <LTABLE STORY232 STORY160>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT210 "You rig a spear trap by using creepers to lash a splintered branch to a tethered sapling. Before long a deer springs the trap and is impaled by the branch. You rush forward to administer a merciful death, then set to preparing the meat. There is enough to provide you with a good meal and leave a launch of venison over.">

<ROOM STORY210
	(DESC "210")
	(STORY TEXT210)
	(PRECHOICE STORY210-PRECHOICE)
	(CONTINUE STORY279)
	(ITEM HAUNCH-OF-VENISON)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY210-PRECHOICE ()
	<GAIN-LIFE 1>>

<CONSTANT TEXT211 "You offer to sell him your maize cakes, but he protests that his wife would not be happy if he returned home with no money to show for his journey. \"On the other hand, I could give you this parcel of salt,\" he suggests, taking a bundle of oiled cloth from his backpack. \"It is worth nothing to me on the way back to Balak, but you may be able to get a good price for it.">
<CONSTANT CHOICES211 <LTABLE "make your way north out of the city" "go south towards the forest">>

<ROOM STORY211
	(DESC "211")
	(STORY TEXT211)
	(PRECHOICE STORY211-PRECHOICE)
	(CHOICES CHOICES211)
	(DESTINATIONS <LTABLE STORY120 STORY165>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY211-PRECHOICE ()
	<COND (<AND ,RUN-ONCE <CHECK-ITEM ,MAIZE-CAKES> <NOT <CHECK-ITEM ,PARCEL-OF-SALT>>>
		<TELL CR "Exchange " T ,MAIZE-CAKES " with " T ,PARCEL-OF-SALT "?">
		<COND (<YES?>
			<LOSE-ITEM ,MAIZE-CAKES>
			<TAKE-ITEM ,PARCEL-OF-SALT>
		)>
	)>>

<CONSTANT TEXT212 "You open your mouth to speak and the jade bead rolls out. It falls, bounces off the rock and disappears into the water with a tiny splash.||In the same moment, the tenebrous image of the Rain God leaps into sharp focus. You see him as clearly now as if all the sun's light were focused just where he is standing. Everything else goes plunging into darkness. Your vision is filled with the blazing presence of the divinity.||His face is far from human; you can see that now. He opens his hand in the traditional beneficent gesture of royalty throughout the ages, inviting you to speak.||\"O supreme lord...\"||You falter. How can you address a god?||Then you hear his voice inside your head, telling you that he knows why you have been sent. He accepts the sacrifice. Your life will buy the heavy rains needed to irrigate the crops.||You try to open your mouth to tell him more -- about your quest to find your brother, about the thirst for truth and for vengeance on the sorcerer in the western desert. But you are too drowsy. The dazzling radiance of the Rain God's aura is veiled by a wave of darkness. You relax, strangely content.||In the gloom of the underworld, a monstrous serpent contentedly laps up the last of your blood and dives beneath the water.">

<ROOM STORY212
	(DESC "212")
	(STORY TEXT212)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT213 "With a wave of your wand and a muttered incantation, you animate the rope. Guiding it like a snake charmer, you impel it to rise up to the ledge above.">
<CONSTANT TEXT213-JADE-BEAD "Unfortunately, the jade bead rolls out of your mouth while you are speaking the spell and is lost in the water">
<CONSTANT TEXT213-HAMMER "A tug on the rope confirms that it is taut. You climb up to the ledge without any trouble. The doors of the tombs are massive slabs of stone, each with a bas-relief carving of the occupant. At first glance they look impregnable, but then you notice that there is one slab which has a crack running right across it. Even better, you discover a hammer lying on the ledge. You estimate that it would be about an hour's hard work to smash a way into the tomb">
<CONSTANT CHOICES213 <LTABLE "smash the tomb open" "use the" "decide against violating the tombs and return to the canoe, continuing on your way">>

<ROOM STORY213
	(DESC "213")
	(STORY TEXT213)
	(PRECHOICE STORY213-PRECHOICE)
	(CHOICES CHOICES213)
	(DESTINATIONS <LTABLE STORY329 STORY306 STORY167>)
	(REQUIREMENTS <LTABLE NONE MAN-OF-GOLD NONE>)
	(TYPES <LTABLE R-NONE R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY213-PRECHOICE ()
	<COND (,RUN-ONCE
		<COND (<CHECK-ITEM ,JADE-BEAD>
			<TELL ,TEXT213-JADE-BEAD ,PERIOD-CR>
			<LOSE-ITEM ,JADE-BEAD>
		)>
	)>
	<TELL ,TEXT213-HAMMER ,PERIOD-CR>
	<COND (<AND ,RUN-ONCE <NOT <CHECK-ITEM ,HAMMER>> <KEEP-ITEM ,HAMMER>>
		<KEEP-ITEM ,HAMMER>
	)>
	<COND (<CHECK-SKILL ,SKILL-ROGUERY> <STORY-JUMP ,STORY283>)>>

<CONSTANT TEXT214 "You try to paddle the canoe, but the current is too strong. You are borne helplessly on to an underground waterfall and flung out as the canoe goes plunging over the brink. Something strikes your head. There is a blaze of painful light, then darkness as you go under the surface. You drift down towards the river bed, dimly aware that your life ebbing away with the thin trickle of air bubbles rising from your slack jaw.">

<ROOM STORY214
	(DESC "214")
	(STORY TEXT214)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT215 "The ritual ball contest is of great importance to the nobility, who often wage enormous sums on the outcome. The priests value it just as highly because of its religious significance. As an expert exponent of the contest, you are greeted like an esteemed guest. A courtier bows and users you through into the palace, to the envy of those those waiting in vain to present their petitions to the King.">

<ROOM STORY215
	(DESC "215")
	(STORY TEXT215)
	(CONTINUE STORY192)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT216 "You spend a minute staring down into the rolling billows of gritty smoke. It ought to be a mercy that you cannot see the bottom of the canyon, but in fact the faint glare of those distant fires only evokes the worst fears of your imagination. You make several run-ups to the edge of the canyon, stopping short each time with a gasp of sudden panic. But at last, dredging up every drop of courage, you manage to force yourself to leap out towards the first spire of rock.||You misjudged your landing. For a long agonizing second you are left teetering on the brink. Then you slip, barely managing to catch hold of the spire in time to prevent yourself plunging down into the volcanic abyss. It is only when you wrap your limbs around the spire that you discover it is baking hot. You do not have the strength to pull yourself up, and the heat will soon force you to relinquish your grip.">
<CONSTANT TEXT216-END "You are left to morbidly consider your fate in the last minutes before your strength gives out">

<ROOM STORY216
	(DESC "216")
	(STORY TEXT216)
	(PRECHOICE STORY216-PRECHOICE)
	(CONTINUE STORY239)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY216-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-ZOTZ>
		<PREVENT-DEATH ,STORY216>
	)(ELSE
		<PUTP ,STORY216 ,P?DEATH T>
		<CRLF>
		<TELL ,TEXT216-END>
		<TELL ,PERIOD-CR>
	)>>

<CONSTANT TEXT217 "You pop a dart into your blowgun and start walking towards the monster. It shuffles eagerly from side to side on its strong stumpy legs. \"Why aren't you afraid, mortal?\" it asks. \"I'm going to swallow you up -- crunch your bones, drink your juices, and spit out the skin for my maggots to enjoy!\"||You keep on walking along the causeway, apparently unperturbed.||\"You haven't got a chance!\" snarls the monster, tensing its legs to spring on you.||\"Your only reply is to raise the blowgun and puff your dart straight into the monster's eye. It gives a howl of pain and stumbles off the causeway into the mass of maggots, while you go racing towards the jetty.">

<ROOM STORY217
	(DESC "217")
	(STORY TEXT217)
	(CONTINUE STORY020)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT218 "As evening drapes the city in long blue shadows, you take a stroll to the perimeter of the royal compound. A high white wall encloses the palace and the tomb-pyramids of the King's ancestors. At the gateway you see a group of burly warriors armed with jag-edged swords. Their lacquered shields and resplendent feather cloaks mark them out as elite soldiers of the royal guard -- too dangerous to risk a skirmish with, no matter what your skill at arms.">
<CONSTANT TEXT218-CONTINUED "You give up on your plan and decide what to do the next morning:">
<CONSTANT CHOICES218 <LTABLE "go west" "go north" "stay here for the festival">>

<ROOM STORY218
	(DESC "218")
	(STORY TEXT218)
	(PRECHOICE STORY218-PRECHOICE)
	(CHOICES CHOICES218)
	(DESTINATIONS <LTABLE STORY008 STORY030 STORY416>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY218-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-AGILITY>
		<STORY-JUMP ,STORY354>
	)(<CHECK-SKILL ,SKILL-ROGUERY>
		<STORY-JUMP ,STORY374>
	)(<CHECK-SKILL ,SKILL-SPELLS>
		<STORY-JUMP ,STORY396>
	)(ELSE
		<CRLF>
		<TELL ,TEXT218-CONTINUED>
		<CRLF>
		<COND (,RUN-ONCE <GAIN-LIFE 1>)>
	)>>

<CONSTANT TEXT219 "The road takes you into a dingy region devoid of any feature except for a sheer cliff that stretches across the horizon ahead. You see someone in the distance, shining like a jewel against the drab surrounds because of his feather cloak and turquoise head-dress. Though you call out, he is too far away to hear. As you hurry along the causeway, you see him reach the cliff and disappear into one of the two cave mouths.||You are so intent on reaching the cliff that you almost fail to notice a pitted stone idol beside the road. The skeletal jaw and blackened eyes mark it as an effigy of the Death God who rules this land. The stone bowl in front of the idol is bare of offerings, so obviously the figure in the feather cloak left nothing. On the other hand, you might consider it wise to donate some money of your own to secure the god's benison.">

<ROOM STORY219
	(DESC "219")
	(STORY TEXT219)
	(PRECHOICE STORY219-PRECHOICE)
	(CONTINUE STORY259)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY219-PRECHOICE ()
	<DONATE-CACAO>
	<COND (<CHECK-SKILL ,SKILL-FOLKLORE> <STORY-JUMP ,STORY379>)>>

<CONSTANT TEXT220 "The sun rises again, flooding the sands with the stifling heat of day. You realize that soon you must find shade, or the sun will bake you alive. Stumbling wearily up to the top of the next dune, however, all such thoughts fly from your mind to be replaced by a feeling of exhilaration. You have found it! The wizard's palace lies just ahead across a stretch of brown-gold sand. The dawn light makes it seem to shimmer like a mirage in the deep blue shadows between the dunes, but you know it is real.||Double doors swing open in the wall as you approach. Confronting you are a horde of men in ragged animal skins. Their long thin faces and downcast smiles give them a canine appearance. All of them bear stone axes which they lift when you walk through the palace gates -- not a gesture of immediate attack, but just to warn you where you stand.||\"I have come,\" you say, \"to speak to Necklace of Skulls.\"||One of the men gives a bark of laughter. \"It is not as easy as that. Do you think our master sees every stray mongrel who wanders to his door? First you will have to pass five nights among us, his faithful courtiers.\"||You decide to change tack. \"What of my brother, Morning Star?\" you ask.||\"He's been here. Perhaps you'll get to meet him -- later.\"">

<ROOM STORY220
	(DESC "220")
	(STORY TEXT220)
	(PRECHOICE STORY220-PRECHOICE)
	(CONTINUE STORY292)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY220-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-ANGEL> <STORY-JUMP ,STORY269>)>>

<CONSTANT TEXT221 "The noble gives a cry of alarm as he watches you dive off the ledge into the river of blood. Though the current is strong, you are a good swimmer and you have the added advantage of a determined heart. Your powerful strokes carry you safely through the charnel foam to the far bank, where you wring your clothes out with a grimace at how they will smell once the blood dries.">

<ROOM STORY221
	(DESC "221")
	(STORY TEXT221)
	(CONTINUE STORY036)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT222 "The hydra rolls its massive coils across the sand towards you. It moves slowly, but its heads can strike out with lightning speed. You will need to keep your wits about you if you are to survive this battle.">
<CONSTANT CHOICES222 <LTABLE "try dodging away from its attack" "rush straight in towards it" "stand your ground and make ready to parry">>

<ROOM STORY222
	(DESC "222")
	(STORY TEXT222)
	(CHOICES CHOICES222)
	(DESTINATIONS <LTABLE STORY245 STORY268 STORY291>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT223 "Seeing you have no water of your own, Stooping Eagle says, \"You have not come well prepared into this desert, my friend.\"||\"It seems not.\" You wipe a dusty trickle off your sunburnt brow.||He hands you the waterskin. \"We are both nobles -- even though from different cities and of different races. It would be churlish of me not to share my rations, since we share a thirst for vengeance.\"||You are careful to take only a little of the water. It is warm and tastes stale. There is not much left anyway, but you may be glad of the last drop before you reach the palace of Necklace of Skulls.">

<ROOM STORY223
	(DESC "223")
	(STORY TEXT223)
	(CONTINUE STORY220)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT224 "The corbels of the roof produce a heart-stopping groan of cracking masonry. Cracks spread across the stone with terrifying speed. You throw yourself forward just as it gives way completely, pelting you with falling rubble.">
<CONSTANT TEXT224-CONTINUED "You stagger out into the open in a suffocating cloud of rock dust. You are badly bruised and you are bleeding from several deep cuts. You cough the dust out of your lungs and take a look back along the tunnel. It is now buried under tons of fallen masonry. Another second's hesitation and you'd be buried too.||The courtiers join you. \"That was nothing,\" sneers their chief. \"We have much more entertaining challenges lined up for you.\"">

<ROOM STORY224
	(DESC "224")
	(STORY TEXT224)
	(PRECHOICE STORY224-PRECHOICE)
	(CONTINUE STORY431)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY224-PRECHOICE ()
	<TEST-IMMORTALITY 3 ,DIED-FROM-INJURIES ,STORY224>
	<IF-ALIVE TEXT224-CONTINUED>>

<CONSTANT TEXT225 "You spend the day crouched in the meagre shade afforded by the walls of the courtyard. At sunset, the courtiers lead you to the second of the five windowless buildings. When they open the door, you can see nothing but blackness inside. A waft of acrid air touches your face as you step inside. You get the impression of a high-ceilinged hall whose dark recesses are filled by rustling and high-pitched squeaks. Something like dust brushes your face. You put up your fingers and run them through your hair, then grimace when you see what is falling from the roof: lice.||\"The bats are our master's second favourite pets, after ourselves. They are vampire bats, of course,\" says the chief courtier. He peers in and calls up to the rafters: \"Supper time, gentlemen!\" Then he leaves and the door is slammed shut, blotting out all light.">

<ROOM STORY225
	(DESC "225")
	(STORY TEXT225)
	(PRECHOICE STORY225-PRECHOICE)
	(CONTINUE STORY017)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY225-PRECHOICE ()
	<COND (<CHECK-ITEM ,OWL>
		<STORY-JUMP ,STORY421>
	)(<CHECK-CODEWORD ,CODEWORD-ZOTZ>
		<STORY-JUMP ,STORY432>
	)>>

<CONSTANT TEXT226 "Now it is the opposing team's turn to serve. They send the ball skidding along the side wall in a long arc, and the enemy offensive player comes towards you.">
<CONSTANT CHOICES226 <LTABLE "move aside and let him pass" "make a tackle" "retreat ahead of him">>

<ROOM STORY226
	(DESC "226")
	(STORY TEXT226)
	(CHOICES CHOICES226)
	(DESTINATIONS <LTABLE STORY249 STORY272 STORY295>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT227 "You raise your wand and stand ready to do battle with Necklace of Skulls. The first exchange of spells is cautious, as each of you probes the other's psychic defences. Then you become bolder, casting crackling fireballs and shuddering bolts of plasma across the intervening space.||The air itself darkens with the presence of magic. Shapes become warped in the wake of each reality-twisting conjuration. Your foe is visible only as a glimmering speck, like an insect trapped in amber, calling energy up out of the depths of his black soul to hurl at you. A spell cuts through your guard, searing you to the core. You retaliate with a spray of lightning that makes your foe shudder, and he counters by sending a cloud of choking gas towards you.">

<ROOM STORY227
	(DESC "227")
	(STORY TEXT227)
	(PRECHOICE STORY227-PRECHOICE)
	(CONTINUE STORY342)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY227-PRECHOICE ("AUX" (DAMAGE 8))
	<COND (<CHECK-SKILL ,SKILL-CHARMS> <SET DAMAGE 4>)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY227>
	<COND (<AND <IS-ALIVE> <CHECK-CODEWORD ,CODEWORD-VENUS>> <STORY-JUMP ,STORY442>)>>

<CONSTANT TEXT228 "Following the sweep of the coastline, you press on into the north-west. You subsist on fruit and fish for a week or so until finally you arrive at the great port of Tahil. The streets are crowded with refugees, all pouring towards the quayside in the hope of finding passage on a ship going east.||You make your way through the press of frightened people and past the great temples and townhouses which now lie deserted. The causeway to the west is empty apart from a few forlorn stragglers and those who have fallen crippled by the wayside.||\"Turn back!\" cautions a starving beggar as he passes you on the causeway. \"Monsters are coming out of the western desert to slay us all!\"||\"No,\" you reply without looking back, \"I'm going to slay them.\"">

<ROOM STORY228
	(DESC "228")
	(STORY TEXT228)
	(CONTINUE STORY085)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT229 "Spittle flies from the hound's jaw and fury fills its pink eyes as it leaps forward eagerly to fight you. It is keen to chomp your bones and drink the marrow from them.">
<CONSTANT TEXT229-CONTINUED "After a short exchange you are forced back, bleeding, to the mouth of the passage. The hound crouches ready to renew its attack.">
<CONSTANT CHOICES229 <LTABLE "entice it out under the colonnade" "give up and choose another route -- either the pit of coals" "the tunnel blocked by wooden beams" "the ominously unguarded passage">>

<ROOM STORY229
	(DESC "229")
	(STORY TEXT229)
	(PRECHOICE STORY229-PRECHOICE)
	(CHOICES CHOICES229)
	(DESTINATIONS <LTABLE STORY362 STORY338 STORY361 STORY382>)
	(TYPES FOUR-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY229-PRECHOICE ("AUX" (DAMAGE 3))
	<COND (,RUN-ONCE
		<COND (<CHECK-SKILL ,SKILL-SWORDPLAY>
			<SET DAMAGE 1>
		)(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
			<SET DAMAGE 2>
		)>
		<TEST-IMMORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY229>
	)>
	<IF-ALIVE TEXT229-CONTINUED>>

<CONSTANT TEXT230 "The spiky-leafed bush is a mescal plant. You can get water from it by biting the tips off the leaves and sucking the moisture out of them. You know that eating any of these plants would only increase your thirst. It is water you need now, not food.">

<ROOM STORY230
	(DESC "230")
	(STORY TEXT230)
	(PRECHOICE STORY230-PRECHOICE)
	(CONTINUE STORY152)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY230-PRECHOICE ()
	<TEST-IMMORTALITY 1 ,DIED-OF-THIRST ,STORY230>>

<CONSTANT TEXT231 "The high priest of the War God is a grizzled old soldier, sturdy in spite of his years. You find him at the arena practising the ball contest which is both a sport and a sacred ritual for your people. Clad in heavy protective padding, he swipes at the rubber ball with his forearms and knees, now and again running up along the slanting walls of the arena to drive the ball towards the goal: a stone ring set high up off the arena floor. You watch for a while, marvelling at his strength and grace. Each impact of the ball costs him an effort which can be heard in his grunts and gasps, but he plays on despite the heat of the afternoon, which has sent many a younger man off to a siesta.||At last he concludes his practice. Pulling off his protective helmet, he wipes back his sweat-soaked greying hair and walks towards you. \"So you're Evening Star,\" he says, clasping your hand. \"Going after your brother, are you? Good, I admire that! Sort that damned sorcerer out, eh?\"||It is not the custom of your people to be so direct, and is manner leaves you discomposed. \"Um... your ball practice was very impressive,\" you say lamely.||\"For someone of my age, you were going to say?\" He laughs heartily. \"Well, I prefer a bit of killing, if the truth be told, but Koba's not at war with anyone at the moment. Now, as to this quest of yours -- I take it you'll be going by the land route? Take the causeway as far as Yashuna, then turn south and head cross-country of Nachan. There's fine deer to be had in the forest, I can tell you. You are taking all this in, aren't you?\"||\"Er, yes.\"||\"Good. Now, watch out for the stabai when you're in the forest. They're sort of magical nymphs -- can be mischievous, or downright nasty. After Nachan you'll head up through the mountains to the western desert. Make sure you've got a waterskin, by the way, or you won't survive two days in the desert. Do you want to make an offering to the god?||An offering might bring you good fortune on your journey.">

<ROOM STORY231
	(DESC "231")
	(STORY TEXT231)
	(PRECHOICE DONATE-CACAO)
	(CONTINUE STORY301)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT232 "\"Wait!\" You take a step towards the mysterious girl. She barely glances GO-BACK but hurls a peal of laughter over her shoulder and skips away through a sparse bank of ferns. Quickening your pace, you plunge through the undergrowth after her. Her own gait is as light as a dancer's, but even though you break into a run you find yourself unable to catch her.||Stumbling into a thickset of thorns, you give a gasp of pain and annoyance as the sharp spines rip your clothing and your flesh.">
<CONSTANT TEXT232-CONTINUED "When you manage to struggle free, the girl is still lingering a little way ahead, hovering luminously in the emerald twilight. Now she turns her shining face and gives you a bolder smile, but along with curiosity you feel a stirring of superstitious dread. This chase is leading you far off your route and into the darker depths of the forest. The image of the shimmering jewel-like figure outlined against the shadows between the trees awakens a disquieting comparison. She reminds you of the bright pattern of a spider hanging in its web.">
<CONSTANT CHOICES232 <LTABLE "continue the chase" "give up and retrace your steps to find your original route">>

<ROOM STORY232
	(DESC "232")
	(STORY TEXT232)
	(PRECHOICE STORY232-PRECHOICE)
	(CHOICES CHOICES232)
	(DESTINATIONS <LTABLE STORY278 STORY160>)
	(TYPES TWO-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY232-PRECHOICE ()
	<COND (,RUN-ONCE <TEST-IMMORTALITY 1 ,DIED-FROM-INJURIES ,STORY232>)>
	<IF-ALIVE TEXT232-CONTINUED>>

<CONSTANT TEXT233 "Crouching hidden behind a bank of ferns, you wait patiently until a rabbit comes hopping past. It squats with ears pricked up and nose twitching, barely arm's length from your hiding place. You lob a stone over to the far side of the clearing, and the sudden noise startles the rabbit so that it rushes straight into your clutches. A quick twist ends its struggles, and soon you are roasting your catch over a fire. As you chew at the rangey meat, you reflect on how your artful ways are not only of use in the city.">

<ROOM STORY233
	(DESC "233")
	(STORY TEXT233)
	(CONTINUE STORY279)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT234 "A young man and woman are brought forward by the priests and led to a shrine at the western edge of the hole. A steep flight of steps descends from the shrine towards a platform covered with sacred glyphs. As golden pectorals are placed over the couple's shoulders, it becomes clear that they are going to be sacrificed. They have chosen to jump into the sinkhole, carrying the people's prayers to the Rain God who dwells under the world.">

<ROOM STORY234
	(DESC "234")
	(STORY TEXT234)
	(PRECHOICE STORY234-PRECHOICE)
	(CONTINUE STORY127)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY234-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-CENOTE>
		<DELETE-CODEWORD ,CODEWORD-CENOTE>
		<STORY-JUMP ,STORY103>
	)>>

<CONSTANT TEXT235 "You steel your nerves and leap from the lip of the sinkhole.||The water rushes up to meet you, enfolding you in a silent icy embrace. Shock drives the air out of your lungs and you flail wildly. Instantly disoriented, you have no idea which way to swim to reach the surface. Bloody darkness thunders through your brain. You feel yourself drifting, and you know that by now you should have had a glimpse of the sunlit surface of the water. You are not in the bottom of the well anymore. You have plunged into the fabled river that leads between the world of the living and the dead">

<ROOM STORY235
	(DESC "235")
	(PRECHOICE STORY235-PRECHOICE)
	(CONTINUE STORY119)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY235-PRECHOICE ()
	<COND (<CHECK-ITEM ,JADE-BEAD>
		<CRLF>
		<TELL "You slip " T ,JADE-BEAD " under your tongue as you were told to do">
		<TELL ,PERIOD-CR>
	)>
	<CRLF>
	<TELL ,TEXT235>
	<TELL ,PERIOD-CR>
	<TEST-IMMORTALITY 3 ,DIED-GREW-WEAKER ,STORY235>>

<CONSTANT TEXT236 "A gust of wind carrying a rotting miasmal stench tells you that you are approaching the end of the tunnel. The demons steer along a side passage towards a patch of grey daylight, emerging under a sky the colour of wet limestone. This tributary of the river is barely more than a muddy trickle. The rank smell hangs over a dreary expanse of marshland which stretches off into the distance. No matter which way you look, all you can see is a landscape of sour white clay covered with scum-covered ponds and grey tufts of reeds.||You put in at a rotting wooden jetty and the demons wait for you to disembark. \"Hope you enjoyed the voyage,\" cackles one.||\"It's customary to show your appreciation,\" says the other as you clamber onto the jetty.||\"That's right!\" says the first as though it has only just occurred to him. \"Got a jade bead you could let us have?\"">

<ROOM STORY236
	(DESC "236")
	(STORY TEXT236)
	(PRECHOICE STORY236-PRECHOICE)
	(CONTINUE STORY053)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY236-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-FOLKLORE>
		<STORY-JUMP ,STORY031>
	)(<CHECK-ITEM ,JADE-BEAD>
		<CRLF>
		<TELL "Give them " T ,JADE-BEAD "?">
		<COND (<YES?> <LOSE-ITEM ,JADE-BEAD>)>
	)>>

<CONSTANT TEXT237-JADE-BEAD "The jade bead rolls out from under your tongue when you speak and it falls into the water">
<CONSTANT TEXT237 "\"There's no other way,\" replies the demon with the jaguar-skin skullcap.\"||\"Not if you want to reach the Deathlands alive,\" adds his accomplice, and they rock with immoderate joy like two senile old men">

<ROOM STORY237
	(DESC "237")
	(PRECHOICE STORY237-PRECHOICE)
	(CONTINUE STORY261)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY237-PRECHOICE ()
	<COND (<CHECK-ITEM ,JADE-BEAD>
		<CRLF>
		<TELL ,TEXT237-JADE-BEAD>
		<TELL ,PERIOD-CR>
		<LOSE-ITEM ,JADE-BEAD>
	)>
	<CRLF>
	<TELL ,TEXT237>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT238 "You join the queue of people waiting outside the palace in the hope of being granted an audience. When it comes to your turn, a snooty courtier soon makes it plain that you will have to bribe him if you want your gift taken to the King.">
<CONSTANT CHOICES238 <LTABLE "bribe him" "an audience with the King is not worth it">>

<ROOM STORY238
	(DESC "238")
	(STORY TEXT238)
	(CHOICES CHOICES238)
	(DESTINATIONS <LTABLE STORY285 STORY262>)
	(REQUIREMENTS <LTABLE 3 NONE>)
	(TYPES <LTABLE R-MONEY R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT239 "Something passes overhead with a heavy flapping noise, then descends to alight on the spire where you are clinging. You look up to see the familiar face of the dwarf you helped earlier. Ugly as he is, you could not imagine a more joyous sight -- for you now see that his long ares are not clothed in a black mantle as you had supposed, but are actually bat-like wings.||\"Grab hold of my feet,\" he says.||You do not need to be told twice. Once you have a firm grip, he sweeps out his wings and flies you across the canyon. It is a breathtaking ride, swooping with giddying speed high above the billowing lava-mist as the far edge of the canyon comes rushing nearer. You are not sorry when Zotz finally spirals down and your feet touch solid ground again.||\"There, I said I'd repay my debt,\" says Zotz with a grotesque grin. \"Take care, now!\" And he leaps off the edge, gliding back until he is swallowed by the rising veils of steam.">

<ROOM STORY239
	(DESC "239")
	(STORY TEXT239)
	(PRECHOICE STORY239-PRECHOICE)
	(CONTINUE STORY263)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY239-PRECHOICE ()
	<DELETE-CODEWORD ,CODEWORD-ZOTZ>>

<CONSTANT TEXT240 "Necklace of Skulls towers over you, his huge face looming like a grotesque white mushroom against the indigo blue of the sky. His sword descends in a murderous arc. You throw yourself to one side and it clashes against a block masonry, scattering chips of broken stone. And physical strength is not his only weapon -- he also unleashes sorcery, spewing out torrents of acrid smoke from his mouth. His screams of fury are so charged with magic that they awaken the skulls hanging at his chest. Chittering with malevolence, they strain on their cords to snap at you.||It is an impressive display of sheer power. Others might even find it terrifying, but you have come too far and faced too many perils to fail now. You stand side by side with your brother and slowly force the wizard back. Just as his fury takes tangible form, so his desperation shows as sparks of cindery light. He stabs out with his sword a final time, wounding Morning Star, then emits a bleak cry like a dying vulture and topples back into the pit leading to the interior of the pyramid.||As your foe dies, the whole palace begins to shudder. You help Morning Star to his feet, relieved to see that his wound is not a fatal one. He will always carry a scar to remind him of Necklace of Skulls' final sword-strike, but at least he will live.||\"I think we ought to get out of here,\" you say to him as a nearby building caves in.||\"I think you're right,\" he says.">

<ROOM STORY240
	(DESC "240")
	(STORY TEXT240)
	(CONTINUE STORY442)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT241 "The Man of Gold draws life from your body warmth. Dropping to the causeway, he goes running towards the monster. It stares down wide-eyed at his approach, unable to believe that a tiny metal manikin could present much of a threat. Snorting with unhuman laughter, it strides forward and tries to kick the Man of Gold aside.||That is a mistake. Bodily uprooting a chunk of stone from the causeway, the Man of Gold brings it crashing down a surprised yelp as he lifts its huge bulk clear of the ground and sends it hurtling off to land in the maggot-infested mire surrounding the causeway.||With a gesture of farewell, the Man of Gold runs on to the jetty. By the time you catch up, he has plunged without a trace into the gelid green waters.">

<ROOM STORY241
	(DESC "241")
	(STORY TEXT241)
	(PRECHOICE STORY241-PRECHOICE)
	(CONTINUE STORY020)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY241-PRECHOICE ()
	<LOSE-ITEM ,MAN-OF-GOLD>>

<CONSTANT TEXT242 "You duck to one side as the monster comes rushing forward. It stumbles past, but throws out its arm and catches you a powerful blow. You wince as you hear one of your ribs crack, and the pain sends you staggering back out from under the trees into the hot afternoon sunshine.">
<CONSTANT TEXT242-AGILITY "You turn away from the brunt of the blow">

<ROOM STORY242
	(DESC "242")
	(STORY TEXT242)
	(PRECHOICE STORY242-PRECHOICE)
	(CONTINUE STORY265)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY242-PRECHOICE ("AUX" (DAMAGE 2))
	<COND (<CHECK-SKILL ,SKILL-AGILITY>
		<CRLF>
		<TELL ,TEXT242-AGILITY>
		<TELL ,PERIOD-CR>
		<SET DAMAGE 1>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-FROM-INJURIES ,STORY242>>

<CONSTANT TEXT243 "The road leads you through a hazy realm. You pass by ranks of tall stately figures with bald elongated heads and cross-eyed expressions that make them seem introspective and wistful. You try to speak to them, to ask where you are, but they recede into the distance whenever you approach.||You cannot tell how long has passed when you find yourself back at the crossroads. Your memory is cloudy, and you realize that you have lost some of your expertise, along with other recollections.">
<CONSTANT TEXT243-CONTINUED "One of the other paths must be the correct one.">
<CONSTANT CHOICES243 <LTABLE "follow the red road" "the black road" "the yellow road">>

<ROOM STORY243
	(DESC "243")
	(STORY TEXT243)
	(PRECHOICE STORY243-PRECHOICE)
	(CHOICES CHOICES243)
	(DESTINATIONS <LTABLE STORY196 STORY219 STORY266>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY243-PRECHOICE ()
	<COND (,RUN-ONCE
		<DELETE-CODEWORD ,CODEWORD-POKTAPOK>
		<LOSE-SKILLS 1>
	)>>

<CONSTANT TEXT244 "\"I'll help you find out their names,\" says a familiar high-pitched voice in your ear.||Startled you look around but there is no one there. Then a flicker of motion in the corner of your eye draws your attention to a tiny hovering shape. It flits down to alight on your hand.||Squinting at it, you are astonished to find it is the tiny wizened fellow with the long nose whom you helped when you first arrived in the underworld. Viewed at this size, he looks as much like a mosquito as a man.||Zaz goes flying off down the passage. \"Ouch!\" says the first sentinel after a moment.||\"What is it, Grandfather of Darkness?\" enquires the next sentinel.||\"Something bit me, Thunderbolt Laughter.\" He leans out of his alcove and calls to the third sentinel, \"Can you see a mosquito flying around, Lord Blood?\"||Lord Blood's reply is interrupted by a yelp of pain from the last sentinel. He turns and asks: \"Did it bite you, Lord Skull?\"||While the sentinels start grumbling about the mosquito, you make your way along the tunnel. You address each of them by the names that Zaz cunningly tricked them into revealing, and so you are allowed to pass unmolested to the exit.">

<ROOM STORY244
	(DESC "244")
	(STORY TEXT244)
	(PRECHOICE STORY244-PRECHOICE)
	(CONTINUE STORY336)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY244-PRECHOICE ()
	<DELETE-CODEWORD ,CODEWORD-ZAZ>>

<CONSTANT TEXT245 "Three of its heads stab forward and the fourth sways aloft, surveying your every move. You barely evade the gnashing fangs as hot venom splashes into the sand where you were standing.">
<CONSTANT CHOICES245 <LTABLE "continue to dodge back" "you think that now is the right moment to charge in and attack">>

<ROOM STORY245
	(DESC "245")
	(STORY TEXT245)
	(CHOICES CHOICES245)
	(DESTINATIONS <LTABLE STORY314 STORY337>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT246 "You cannot keep a look of covetous disappointment off your face when Stooping Eagle replaces the stopper without offering you a drink. \"You came ill-prepared for a desert crossing, it seems,\" he says as he replaces the waterskin at his belt.||You can only nod. Your tongue is too dry to waste words. You wipe a dusty trickle of sweat off your sunburnt brow and smear the salty moisture across your lips.||Stooping Eagle adopts a look of regret. \"If only you were a nobleman like myself, I would be happy to share my rations with you, meagre as they are. But there are certain standards we must maintain even in the face of death. A noble does not drink from the same flask as a commoner.\"||\"Our skeletons won't look much different when they've both been bleached by the sun's rays,\" you reply sullenly.||You would argue the point further, but if the two of you came to blows here and now it would just waste your last reserves of strength. The only victor in such a struggle would be the merciless sun and the uncaring sands.">

<ROOM STORY246
	(DESC "246")
	(STORY TEXT246)
	(PRECHOICE STORY246-PRECHOICE)
	(CONTINUE STORY220)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY246-PRECHOICE ("AUX" (HARDY F) (DAMAGE 2))
	<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
		<SET HARDY T>
		<SET DAMAGE 1>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-OF-THIRST ,STORY246>
	<COND (<AND <IS-ALIVE> .HARDY>
		<CRLF>
		<TELL ,NATURAL-HARDINESS>
		<TELL ,PERIOD-CR>
	)>>

<CONSTANT TEXT247 "You once heard a folktale about an albino hound that guarded a dead king's treasure. The hero of the story defeated the hound by luring it into the open, where its weak eyes were blinded by sunlight. You glance back over your shoulder. Outside the colonnade, the sun is so bright that it makes your eyes hurt. You would have a definite advantage over the hound if you got it to follow you out there. On the other hand, looking at the hound, maybe 'less of a disadvantage' would be a more accurate phrase. You reckon it to be about a hundred kilograms of bad-tempered bone and muscle.">
<CONSTANT CHOICES247 <LTABLE "fight it" "use" "use a blowgun" "a">>

<ROOM STORY247
	(DESC "247")
	(STORY TEXT247)
	(CHOICES CHOICES247)
	(DESTINATIONS <LTABLE STORY362 STORY270 STORY316 STORY383>)
	(REQUIREMENTS <LTABLE NONE SKILL-CUNNING SKILL-TARGETING HYDRA-BLOOD-BALL>)
	(TYPES <LTABLE R-NONE R-SKILL R-SKILL R-ITEM>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT248 "You feel as though you are about to be sick. You are surprised and ashamed. You have felt fear before, but you have always borne it bravely. Chattering teeth, quaking limbs and nausea might be excusable in a small child, but not in a proud Maya warrior.||With an uncontrollable belch, your stomach suddenly ejects something up into your throat. You feel it squirming. It's alive! Your mouth drops open in amazement and a firefly buzzes out.||The firefly circles the candle just as a gust of air extinguishes the flame. For a moment you are plunged into darkness, and your skin crawls with primordial fear as you imagine the spirits of the dead rising from their grave-mounds. But then the firefly settles on the wick and gives off a glow that makes it seem that the candle is still burning.||The courtiers are openly dumbfounded when you emerge from the House of Gloom at dawn showing every sign of having spent a peaceful night. \"Were you not afflicted by ghastly nightmares, visitations, hauntings and mind-shattering terrors?\" asks the chief courtier.||\"Not at all. Here's your candle back,\" you reply.||He stares at it. \"It hasn't even burned down!\"||\"You didn't leave me anything to read,\" you say with a shrug, \"so I just blew it out and got some sleep.\"||You pretend not to notice his expression of astonishment as you retrieve your pack of belongings.">

<ROOM STORY248
	(DESC "248")
	(STORY TEXT248)
	(PRECHOICE STORY248-PRECHOICE)
	(CONTINUE STORY040)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY248-PRECHOICE ()
	<GAIN-LIFE 1>>

<CONSTANT TEXT249 "He advances past you and presses on into your own team's defensive zone.">
<CONSTANT CHOICES249 <LTABLE "chase after him" "run towards the enemy defence" "stay in mid-arena">>

<ROOM STORY249
	(DESC "249")
	(STORY TEXT249)
	(CHOICES CHOICES249)
	(DESTINATIONS <LTABLE STORY341 STORY318 STORY364>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT250 "You do not even get a dozen paces. Contemptuously, Necklace of Skulls raises one of his many-jointed limbs and brings a gout of celestial darkness streaming down from the cobalt sky. You are engulfed in icy shadow, and can only writhe in silent horror as the spell sucks you out of this world and carries you down through the ground towards the abode ghosts. You have failed.">

<ROOM STORY250
	(DESC "250")
	(STORY TEXT250)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT251 "You find a trader who will shortly be sailing up the coast to Tahil.||He offers a free passage if you will help defend the boat against pirates. If not, he will charge you 6 cacao passage.">
<CONSTANT CHOICES251 <LTABLE "travel with him and help with the defence" "pay for your passage" "travel overland instead">>

<ROOM STORY251
	(DESC "251")
	(STORY TEXT251)
	(CHOICES CHOICES251)
	(DESTINATIONS <LTABLE STORY300 STORY300 STORY228>)
	(REQUIREMENTS <LTABLE <LTABLE SWORD BLOWGUN> 6 NONE>)
	(TYPES <LTABLE R-ALL R-MONEY R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT252 "It is an arduous climb in the dry noon heat. You reach the city exhausted, and are grateful for the goblet of water that is put into your hands by a smiling priest. He beckons to a throng of richly attired warriors whose red face-paint and black helmet feathers make their welcoming smiles look rather fierce. \"We're glad to greet such an esteemed guest,\" says one.||\"You are just the sort of person we're looking for these days,\" mutters another, hand resting casually on his sword-hilt.||\"Why not come this way and spruce yourself up?\" says another, resting his strong arm across your weary shoulders.||You are led to the altar platform on top of the city's main pyramid, where more smiling priests await you. And if you feel like a turkey who's being invited to a feast, you are not far wrong.">

<ROOM STORY252
	(DESC "252")
	(STORY TEXT252)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT253 "You slice off the top of one of the cacti and drink its sap. The taste is unpleasantly bitter. You manage to resist the urge to vomit, knowing that to do so now would mean your death. Resting until your stomach stops gurgling, you head on across the barren sun-bleached land.">

<ROOM STORY253
	(DESC "253")
	(STORY TEXT253)
	(PRECHOICE STORY253-PRECHOICE)
	(CONTINUE STORY152)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY253-PRECHOICE ()
	<TEST-IMMORTALITY 3 ,DIED-OF-THIRST ,STORY253>>

<CONSTANT TEXT254 "The Moon Goddess has a small shrine off the northern edge of the temple plaza. You look up the pyramid steps to where the high priest awaits you, and he beckons for you to ascend. You compress your lips in annoyance; you had hoped he would come down to you. Even a small temple involves a steep climb.||As you make your way up the steps, you see stone effigies that depict the Nine Lords of the Night bearing the full moon up towards the shrine at the summit of the pyramid. The effigies are painted in the simple cream-gold hue of moonlight, with none of the bright daubings favoured by the other temples.||The high priest, too, has a manner quite unlike the priests of other gods. He wears a plain white robe, and a thin silver chain hangs around his waist. His smile of welcome seems modest and unaffected, but you sense a slight air of smugness behind the diffidently averted eyes. \"Good afternoon,\" he says. \"You must be Evening Star.\"||\"Let me get my breath back,\" you say, stooping as you reach the top of the steps. The baking sun on your back sends rivulets of sweat trickling off your brow. You glance down at the plaza twenty metres below. \"That's quite a climb.\"||The high priest smiles. \"You are out of condition.\"||You give him a wry look and sweep out your arm to indicate the flat landscape of fields and savannah surrounding the city. \"In these parts, only the holy get plenty of climbing practice. I've come to you for advice on my quest into the western desert.\"||\"Buy a waterskin.\"||You're unsure how to take that remark. You watch him, but the only trace that he might be joking is a sly curl of the lips. \"Is that all you have to suggest?\" you ask.||He glances at the shrine behind him. \"See this stucco? Flaking away, I'm afraid. The whole outer facade needs repairs.\"||In his roundabout way, he's asking for a donation.">
<CONSTANT CHOICES254 <LTABLE "pay 1 cacao" "pay 2 cacao" "you are not prepared to make any donation and you need to hurry over to the market and spend your money on supplies instead">>

<ROOM STORY254
	(DESC "254")
	(STORY TEXT254)
	(CHOICES CHOICES254)
	(DESTINATIONS <LTABLE STORY424 STORY002 STORY093>)
	(REQUIREMENTS <LTABLE 1 2 NONE>)
	(TYPES <LTABLE R-MONEY R-MONEY R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT255 "The stabai are inconstant creatures. Their perspective is like that of the forest itself, where the promises and threats of mankind mean nothing beside the endless cycle of death, decay and rebirth. The only way you will get anything form them is by keeping a tight grip on the shawl. As long as you hold the stabai's precious property, you have some power over them. Relinquish it, and you immediately lay yourself open to their most noxious tricks.">

<ROOM STORY255
	(DESC "255")
	(STORY TEXT255)
	(CONTINUE STORY369)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT256 "The rumbling in your belly grows more insistent. You must find something to eat or you risk starving here in the forest's depths.">
<CONSTANT TEXT256-NOTHING "... But you have nothing to eat">

<ROOM STORY256
	(DESC "256")
	(STORY TEXT256)
	(PRECHOICE STORY256-PRECHOICE)
	(CONTINUE STORY004)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY256-PRECHOICE ()
	<EAT-PROVISIONS 1 ,STORY256 F ,STORY279>>

<CONSTANT TEXT257 "The priest sees your bracelet and turns to look at you with new interest. You do not entire like the expression of alert scrutiny on his face. He reminds you of an eagle studying a mouse. \"Ah, I see you are one of the chosen,\" he says, calling to a group of priestly warriors near by.||\"The chosen what?\" you ask.||He gives you a puzzled look. \"Why, one of those chosen to carry our petition to the Rain God,\" he replies.||The guards close in at your shoulders. The priest gestures towards the sunken lake, and suddenly the truth dawns. They mean to cat you into the pit as a living sacrifice to the gods.">
<CONSTANT CHOICES257 <LTABLE "struggle to resist the fate they have in store for you" "cast a protective enchantment" "agree to being thrown into the pit">>

<ROOM STORY257
	(DESC "257")
	(STORY TEXT257)
	(CHOICES CHOICES257)
	(DESTINATIONS <LTABLE STORY281 STORY304 STORY327>)
	(REQUIREMENTS <LTABLE NONE SKILL-SPELLS NONE>)
	(TYPES <LTABLE R-NONE R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT258 "The strange pair guide their canoe into a tunnel leading off the side of the cavern. As you proceed, the roof of the tunnel gets lower until finally you have to crouch down to avoid bumping your head. The tunnel is so narrow by now that the sides of the canoe are scraping against the rock walls. You begin to worry that you will get wedged in the tunnel, unable either to go on or turn back, but the two unhuman oarsmen are entirely unconcerned. Pressed into the bottom of the boat, you can hear them sniggering to themselves.||\"The water level's higher than the last time,\" calls back the one in front.||\"It's a tight squeeze,\" agrees the other. \"We might have to go under.\"||Go under? Do they mean submerge?">
<CONSTANT CHOICES258 <LTABLE "tell them to take you back to the cave and find another route" "let them row on">>

<ROOM STORY258
	(DESC "258")
	(STORY TEXT258)
	(CHOICES CHOICES258)
	(DESTINATIONS <LTABLE STORY237 STORY261>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT259 "You reach the cliff. It is a solid wall of smooth grey stone receding off towards the horizon to left and right, and bounded above by the shimmering surface of the water hanging overhead. There are two doorways into the cliff, each sealed by a gate of stout wooden bars held shut by an elaborate knot of rope as thick as your wrist.">

<ROOM STORY259
	(DESC "259")
	(STORY TEXT259)
	(PRECHOICE STORY259-PRECHOICE)
	(CONTINUE STORY358)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY259-PRECHOICE ()
	<COND (<G? ,MONEY 0> <STORY-JUMP ,STORY414>)>>

<CONSTANT TEXT260 "You walk along the shore as dusk gathers and the stars slowly emerge against the curtain of night. Ahead of you, nestling at the base of the cliffs, you see a massive round head that seems to be carved out of smooth black stone. It is taller than a man. As you get closer, it becomes possible to make out the features: a strong face with wide aristocratic nose, thick lips compressed in stern deliberation, heavy brows above eyes which stare impassively out to sea.||Then you realize you can hear muttering. A low quiet sound at the very limit of audibility. It sounds like someone counting: \"Seventeen million and sixty-two, seventeen million and sixty-three...\"||You step up to the head and say, \"Excuse me.\"||The huge eyes roll in their sockets with a stony scraping. You find yourself fixed with a disconcerting stare. The eyes hold that blank expression which lies on the far side of outrage and disbelief.||After a moment, the head's gaze turns back to the starry sky. \"One,\" you hear it say distinctly. \"Two. Three...\"||You give a polite cough. \"There are one hundred thousand million and seven of them,\" you venture.||The huge eyes swivel back to study you again, this time filled with a look of cautious hope. \"You're sure? I thought mortal eyes could only see a few thousand stars.\"|| \"They can, but I was told the number by a magician.\"||He gives a gravelly sigh. \"I have been counting the stars since before the coming of man -- but they kept moving, and often the daytime made me lose count. See, I've been here so long I've been buried up to my neck.\"||You look at the sand and gravel, trying to imagine the huge body buried beneath it.">
<CONSTANT CHOICES260 <LTABLE "ask the giant for a favour" "you think it is time to get on with planning your journey to Tahil">>

<ROOM STORY260
	(DESC "260")
	(STORY TEXT260)
	(PRECHOICE STORY260-PRECHOICE)
	(CHOICES CHOICES260)
	(DESTINATIONS <LTABLE STORY023 STORY113>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY260-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-OLMEK> <DELETE-CODEWORD ,CODEWORD-OLMEK>)>>

<CONSTANT TEXT261 "Just when it seems certain that the canoe will get stuck in the passage, immuring you below the earth for ever, you realize that the gap is widening. The canoe drifts on into a vast tunnel through which runs a wide underground river. Misty blue light sparkles on the water and trickles across the glistening rock. It appears to emanate from veins of glassy stone which you can see running through the walls of the tunnel.||The demons manoeuvre their craft between a forest of stalagmites which protrude from the water like thin fangs. Once on the open river they begin to ply their oars with vigour, propelling the canoe amid whoops of crazed glee.||You gaze in awe at the wondrous sight surrounding you. The tunnel is far wider than any stream to be found in the dry countryside around Koba, with walls rising almost vertically to a shadow-filled roof a hundred metres above your head. The air here is hot and musty and has a vile taste that makes you cough, but other than that you could almost imagine you are being steered along a canyon in the open air.||Rounding a bend in the river, you notice a series of stone doors set off a ledge high up in the right-hand wall of the tunnel. \"The cave tombs of the first ancestors,\" says the demon in the back of the boat when he sees where you are looking.||\"I expect you'll want to take a closer look,\" says the other demon and, without waiting for a reply, they row over to the side of the river and steady the canoe below the ledge.">
<CONSTANT CHOICES261 <LTABLE "climb up to the tombs" "use magic to get up there" "you do not want to explore the tombs">>

<ROOM STORY261
	(DESC "261")
	(STORY TEXT261)
	(CHOICES CHOICES261)
	(DESTINATIONS <LTABLE STORY190 STORY213 STORY236>)
	(REQUIREMENTS <LTABLE SKILL-AGILITY <LTABLE SKILL-SPELLS ROPE> NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT CHOICES262 <LTABLE "try one of your devious schemes" "pay for lodging if you have some money" "continue on westwards" "follow the river northwards">>

<ROOM STORY262
	(DESC "262")
	(CHOICES CHOICES262)
	(DESTINATIONS <LTABLE STORY308 STORY101 STORY008 STORY030>)
	(REQUIREMENTS <LTABLE SKILL-CUNNING 0 NONE NONE>)
	(TYPES <LTABLE R-SKILL R-MONEY R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT263 "You trudge on through terrain consisting of bare bleached rocks swathed in stream rising from fissures in the ground. Wet gravel crunches underfoot. Sweat soaks your clothes, and the air is so hot that you can hardly breathe.||You see someone sprawled atop a boulder. He is a gangling figure with a weather beaten face and lazy heavy-lidded eyes. Your first impression is that he is asleep, but then he calls out in a sibilant voice, saying, \"You are Evening Star, are you not? I might know a secret or two that could help you find your brother, if you can give me an answer to this riddle. \"I'm a narrow fellow and I live in narrow spaces between the rocks. Born from a pebble, I'm as hard to catch as a flicker of lightning when my blood's up, but in the cool of night I'm as sedentary as a stalactite.\"||What answer will you give?">
<CONSTANT CHOICES263 <LTABLE "answer 'A lizard.'" "'A dragonfly.'" "'Water.'" "none of the above">>

<ROOM STORY263
	(DESC "263")
	(STORY TEXT263)
	(CHOICES CHOICES263)
	(DESTINATIONS <LTABLE STORY376 STORY397 STORY010 STORY060>)
	(TYPES FOUR-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT264 "You fall in with others who are travelling in a group for safety. Since the collapse of the great city there has been a wave of refugees from the north-west, many of them impoverished and desperate. It is no longer wise to travel the back roads unaccompanied.||Some of your companions make their farewells as they arrive at their homes, others join the group. You might be walking with up to a dozen other people at any one time, while on other stretches of the riverside path you travel alone. At such times you are keen for company, and when you see a peasant woman walking ahead you quicken your pace to catch up.||You soon begin to regret joining her, because there is something strange about her manner that gives you a feeling of disquiet despite the bright sunny morning. She peers constantly ahead of her with a dreamy expression, stumbling along as though half asleep. For the sake of conversation, you remark on the large clay pitcher she carries balanced upside-down on her shoulder. \"Isn't it easier to carry those on your head? That's what most peasants do.\"||Your question takes a while to sink in. When her answer comes it is a distracted murmur: \"Only if it's full... This isn't full...\"||You walk on for several minutes before saying, \"Why don't you switch it to your other shoulder? You'd find it less of a strain that way, I'm sure.\"||\"It's fine like this...\" She suddenly stops and turns to you with a drowsy smile. \"I think I'll rest in the shade of this tree. You'll wake until I wake up, won't you? It's too hot to walk in the middle of the day anyhow...\"||Before you can reply, she hunkers down by the side of the road -- still with the pitcher balanced carefully on her shoulder -- and her head slumps forward in sleep.">
<CONSTANT CHOICES264 <LTABLE "stay here as the woman asked you to" "sneak a look under a pitcher" "leave before she wakes up">>

<ROOM STORY264
	(DESC "264")
	(STORY TEXT264)
	(PRECHOICE STORY264-PRECHOICE)
	(CHOICES CHOICES264)
	(DESTINATIONS <LTABLE STORY100 STORY333 STORY356>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY264-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-FOLKLORE>
		<STORY-JUMP ,STORY287>
	)(<CHECK-CODEWORD ,CODEWORD-CALABASH>
		<STORY-JUMP ,STORY310>
	)>>

<CONSTANT TEXT265 "The monster rushes forward, realizing too late that it has been tricked. Once out of the shade of the tree where it was resting, it is dazzled by the bright sunlight and can only flail back blindly as you step in to finish it. Even so, its clumsy blows strike you with staggering force.">

<ROOM STORY265
	(DESC "265")
	(STORY TEXT265)
	(PRECHOICE STORY265-PRECHOICE)
	(CONTINUE STORY288)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY265-PRECHOICE ("AUX" (DAMAGE 4))
	<COND (<CHECK-SKILL ,SKILL-SWORDPLAY>
		<SET DAMAGE 1>
	)(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
		<SET DAMAGE 2>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY265>>

<CONSTANT TEXT266 "As you walk, you pass through bands of bright golden light interspersed by shadow. The flickering effect leaves you dazed and disoriented, so you are slow to react when something heavy slams into your back, forcing you down. You hear a deep resonant growl of a jaguar. Despite your fear, you struggle to rise. Hands -- or paws? -- fumble at your pack. You get to your feet in time to catch a fleeting glimpse of a large feline shape bounding off into the gloom.||You examine your possessions and find you have lost everything except for one item which you managed to hold on to. You have also been robbed of all your money.">
<CONSTANT TEXT266-CONTINUED "Angrily you retrace your steps to the crossroads and select a different route">
<CONSTANT CHOICES266 <LTABLE "follow the red path" "the white path" "the black path">>

<ROOM STORY266
	(DESC "266")
	(STORY TEXT266)
	(PRECHOICE STORY266-PRECHOICE)
	(CHOICES CHOICES266)
	(DESTINATIONS <LTABLE STORY196 STORY243 STORY219>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY266-PRECHOICE ()
	<COND (,RUN-ONCE
		<LOSE-STUFF ,PLAYER ,LOST-BAG "item" 1 RESET-POSSESSIONS>
		<SETG MONEY 0>
		<MOVE ,ALL-MONEY ,PLAYER>
		<UPDATE-STATUS-LINE>
	)>
	<CRLF>
	<TELL ,TEXT266-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT267 "According to legend, the hero-twins called Forethought and Afterthought once travelled west across the great desert in search of the tunnel leading to the underworld. There they had to pass these four sentinels. They addressed each with due deference, calling the first Lord Skull, the second Lord Blood, the third Thunderbolt Laughter, and the fourth Grandfather of Darkness. Thus they finally penetrated of the underworld.||Make you know the details of the legend.">

<ROOM STORY267
	(DESC "267")
	(STORY TEXT267)
	(CONTINUE STORY313)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT268 "The monster dips one of its necks close to the ground and swings it around behind your legs while another lunges towards your face.">
<CONSTANT TEXT268-AGILITY "You jump back over the neck that is trying to trip you while simultaneously ducking the attack of the other">
<CONSTANT TEXT268-CONTINUED "You caught a staggering blow and it is only by falling backwards that you avoid having your head torn off">

<ROOM STORY268
	(DESC "268")
	(STORY TEXT268)
	(PRECHOICE STORY268-PRECHOICE)
	(CONTINUE STORY222)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY268-PRECHOICE ()
	<CRLF>
	<COND (<CHECK-SKILL ,SKILL-AGILITY>
		<TELL ,TEXT268-AGILITY>
		<TELL ,PERIOD-CR>
		<PREVENT-DEATH ,STORY268>
		<STORY-JUMP ,STORY337>
	)(ELSE
		<TELL ,TEXT268-CONTINUED>
		<TELL ,PERIOD-CR>
		<TEST-IMMORTALITY 2 ,DIED-FROM-INJURIES ,STORY268>
	)>>

<CONSTANT TEXT269 "Stooping Eagle and his servant are led off across the courtyard towards a group of buildings. \"They will be our guests also, but in another part of the palace from you,\" says the chief of the courtiers, smiling to display a sharp set of teeth.||\"Do not worry, friend,\" Stooping Eagle calls back to you, \"we have only to persevere and our swords shall drink the fiend's blood eventually!\"||You would like to resists the courtiers, but there too many to fight in your weakened state. \"After five nights I will be taken to Necklace of Skulls?\" you ask. It occurs to you that five nights' rest will leave you all the fitter to deal with the wizard.||The chief courtier dips his head. \"Exactly. Our master lives in the inner precinct of the palace.\" He gestures with a thin hairy hand towards a pyramid that towers over the inner courtyard. The black colouring of the pyramid makes it look like a crack of the night sky that has lingered on after sunrise.||\"Take me to my quarters, then,\" you tell him.||The assembled courtiers give a high howling laugh at this. \"Not so fast,\" titters their chief when he has recovered himself. \"First you have to choose your route to our compound.\"">

<ROOM STORY269
	(DESC "269")
	(STORY TEXT269)
	(CONTINUE STORY315)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT270 "The albino hound leaps forward with a savage bark as it sees you approach. Suddenly jumping back, you lure it out of the passage and into the bright sunshine, where its weak eyes are blinded by the glare. Making sure to keep up a stream of taunts so that it can hear you, you double around and race back towards the unguarded tunnel.||The hound lopes after you, furiously intent on rending your flesh in its powerful jaws. Dazzled, it does not see you stop on one side of the tunnel entrance. You toss a pebble into the open tunnel and the hound, hearing this, bounds off along it thinking you are still in full flight.||The arch of the tunnel shudders and gives way, burying the hound under a mass of falling masonry. Once the dust clears there is no sign of it. You go along to the passage previously guarded by the hound and make your way through to the inner courtyard, where you find the courtiers already waiting for you.||\"Clever,\" remarks the chief courtier. \"You'll need more tricks like that if you're going to get through the real tests, though.\"">

<ROOM STORY270
	(DESC "270")
	(STORY TEXT270)
	(CONTINUE STORY431)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT271 "You scrape some clay out of the walls and spit into it, smearing it into a grey-white mixture which you apply to your eyelids. Once that has dried, you collect a little soot from the candle-flame and dab a black spot into the middle of each eyelid. You have no mirror in which to check the finished result, but it ought to now look as though your eyes are open even when you in fact have them screwed tight shut.||Settling down with your back to the wall, you pull your cloak across in front of you like blanket. After a few minutes, a gust of cool dry air blows out of the candle and you are left in darkness,. As if on cue, the ghosts come seeping up from their graves under the floor. You see flickers of luminosity sketching the outlines of skeletal bodies and grotesque dead faces against the darkness. As they draw near, you close your eyes.||\"Ah, we have a visitor among us,\" whispers a voice like wind sighing in a well. \"Watch, brothers, as I unleash my most terrifying visage.\"||There is a revolting wet sound a a blaze of grey-blue light that you see even through your closed eyelids. After a long pause, another ghostly voice says: \"That didn't work. Let me try: I'll send the mortal screaming to the rafters.\"||The ensuing sound is suggestive of maggots, shrieking torments and fluttering dead things. Fortunately you do not see the manifestation that caused it. As far as the ghosts can tell, you are looking on at their best efforts to haunt you without batting an eyelid.||\"Aren't you getting the least bit scared, mortal?\" asks a voice like a death-rattle.||\"No,\" you say in feigned innocence. \"I'm quite enjoying the show, actually. Do go on.\"||Having been fooled into thinking you aren't frightened by them, the ghosts lose interest and return grumbling to their graves. Even so, you find it difficult to get any sleep with the thought of their corpses lying just under the mounds of earth. At dawn you emerge gratefully from the House of Gloom and retrieve your pack of belongings, eager for the final stage of your quest to commence.">

<ROOM STORY271
	(DESC "271")
	(STORY TEXT271)
	(CONTINUE STORY040)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT272 "The onrushing figure looks just like a black rip in the air and makes no sound as he runs, but the impact when he hits you is like having a tree-branch swung into your midriff.">
<CONSTANT TEXT272-DEFLECT "You deflect the blow and was not wounded.">
<CONSTANT TEXT272-CONTINUED "While you stagger back recovering your balance, your opponent sends the ball sailing against the high-score zone">

<ROOM STORY272
	(DESC "272")
	(STORY TEXT272)
	(PRECHOICE STORY272-PRECHOICE)
	(CONTINUE STORY066)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY272-PRECHOICE ("AUX" (DAMAGE 2))
	<COND (<CHECK-SKILL ,SKILL-AGILITY> <SET DAMAGE 1>)>
	<COND (<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
		<PREVENT-DEATH ,STORY272>
		<EMPHASIZE TEXT272-DEFLECT>
	)(ELSE
		<TEST-IMMORTALITY .DAMAGE ,DIED-FROM-INJURIES ,STORY272>
	)>
	<COND (<IS-ALIVE>
		<CRLF>
		<TELL ,TEXT272-CONTINUED>
		<TELL ,PERIOD-CR>
		<SCORE-POINTS 2 ,FOES>
	)>>

<CONSTANT TEXT273 "As you race along the arena and up the steps of the pyramid, Necklace of Skulls conjures down a storm of blazing meteors.">
<CONSTANT TEXT273-AGILITY "You move too fast for him.">
<CONSTANT TEXT273-CONTINUED "You close with your foe for the final battle">

<ROOM STORY273
	(DESC "273")
	(STORY TEXT273)
	(PRECHOICE STORY273-PRECHOICE)
	(CONTINUE STORY296)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY273-PRECHOICE ("AUX" (AGILE F) (DAMAGE 3))
	<COND (<CHECK-SKILL ,SKILL-AGILITY>
		<SET DAMAGE 1>
		<SET AGILE T>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-FROM-INJURIES ,STORY273>
	<COND (<IS-ALIVE>
		<CRLF>
		<COND (.AGILE <TELL ,TEXT273-AGILITY>)>
		<TELL ,TEXT273-CONTINUED>
		<TELL ,PERIOD-CR>
		<COND (<CHECK-CODEWORD ,CODEWORD-VENUS> <STORY-JUMP ,STORY240>)>
	)>>

<CONSTANT TEXT274 "The water between the two ships seethes, the a vast fanged maw bursts to the surface and long tentacles slash towards the sky. The pirates stare in terror, then scramble over one another in their mad haste to change course. You watch with a smile as they recede into the distance.||The trader is crouching in the bottom of the hull.||\"A seas monster,\" he whimpers. \"It's come to kill us and seize all my goods!\"||The two boys are leaping up and down with whoops of joy, pulling faces at the fleeing pirates. One of them turns to his father. \"Oh, Dad,\" he says. \"It was just an illusion!\"">

<ROOM STORY274
	(DESC "274")
	(STORY TEXT274)
	(CONTINUE STORY343)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT275 "Apart from a few glowering looks, you are all but ignored by the people of Ashaka. Striding boldly up to a warrior in scarlet war paint, you ask directions to the market. He gives you a look like a bird studying a worm.||\"Market?\" he sneers. \"There is no time for trade these days. We're preparing for war.\"||\"War?\" you say naively. \"With whom?\"||\"With everyone! Now the Great City's gone, all the upstart cities will start vying for dominance in the region.\"||\"How sad and senseless,\" you sigh.||He spits into the dust. \"Don't be daft. Think about it. Now there'll have to be a new Great City. That's going to be us.\"||Shaking your head, you make your way through the streets until you find a furtive stallholder who is prepared to sell you a strip of salted meat for 1 cacao.">
<CONSTANT CHOICES275 <LTABLE "head directly towards Shakalla" "detour to the coast and make your way via Tahil">>

<ROOM STORY275
	(DESC "275")
	(STORY TEXT275)
	(PRECHOICE STORY275-PRECHOICE)
	(CHOICES CHOICES275)
	(DESTINATIONS <LTABLE STORY298 STORY228>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY275-PRECHOICE ()
	<COND (<AND ,RUN-ONCE <G? ,MONEY 0> <NOT <CHECK-ITEM ,SALTED-MEAT>>>
		<CRLF>
		<TELL "Buy " T ,SALTED-MEAT "?">
		<COND (<YES?>
			<CHARGE-MONEY 1>
			<TAKE-ITEM ,SALTED-MEAT>
		)>
	)>>

<CONSTANT TEXT276 "You get water from the bush by biting the tips off the hard sharp-tipped leaves and sucking the moisture out of them. It is barely enough to slake your thirst. You head on a cross the barren and blistered rocks, knowing that your ordeal will continue for many gruelling days yet.">

<ROOM STORY276
	(DESC "276")
	(STORY TEXT276)
	(PRECHOICE STORY276-PRECHOICE)
	(CONTINUE STORY152)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY276-PRECHOICE ()
	<TEST-IMMORTALITY 2 ,DIED-OF-THIRST ,STORY276>>

<CONSTANT TEXT277 "The high priest of the Death God is a portly short-sighted man wrapped in a black kilt. White paint is daubed in streaks around his belly as if to represent the fleshless ribcage of a corpse -- though you cannot help smiling as you reflect how his own ribs are so well covered. His head-dress is a rather intimidating effigy of a skull without its lower jaw, with long earpieces of jointed fingerbones hanging on neither side of his rotund face, but the priest removes this as soon as you are both seated in the shade of the outer shrine.||\"I have come to you for advice,\" you begin by saying, \"I must undertake a journey to the west in search of my brother, Morning Star\"||He wipes a slick of sweat off his brow with one plump hand. \"I have heard the story. Only one man has entered the great desert and left it alive -- the veteran who accompanied your brother. What makes you think you will fare better?\"||\"One man survived. Why shouldn't I\"||The priest shakes his head. \"He was one man from an expedition of thirty. Did you not hear his account of the perils of the desert -- the devil-driven sands, the monstrous serpents?\"||\"Then you counsel me to stay here in Koba? To abandon my quest?\"||He casts a quick gaze towards the shadowy archway leading to the inner shrine. \"The advice of the god is not so easily obtained. Are you willing to make an offering?\"">
<CONSTANT CHOICES277 <LTABLE "pay him" "you cannot spare the money and must bid the priest farewell and see about getting supplies for the trip">>

<ROOM STORY277
	(DESC "277")
	(STORY TEXT277)
	(CHOICES CHOICES277)
	(DESTINATIONS <LTABLE STORY408 STORY093>)
	(REQUIREMENTS <LTABLE 5 NONE>)
	(TYPES <LTABLE R-MONEY R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT278 "On and on through the forest, the glowing figure leads you a madcap chase until your heart is pounding and your breath comes in raw sobs. Creepers hang across your path, but you dash them aside and race on. Sweat plasters your clothes to your skin. You catch your foot on a root and stumble, only to leap up again and stagger after your elusive quarry.||At last you emerge into a clearing beside a stream where you give a breathless cry of triumph. The girl has stopped at the bank of the stream. She stands with her back to you, shawl drawn around her golden body, her head bowed as if in passive acceptance that she can go no further.||A final burst of effort carries you across the clearing, even though your legs feel like clay. The girl turns and favours you with a sweet smile. Then she breaks apart into hundreds of motes of dazzling light. Gasping for breath, you accidentally inhale one of the motes of light and feel an insectoid buzzing as you swallow it. A firefly. The 'girl' you were chasing was just a swarm of fireflies!||Spluttering violently in a vain attempt to cough up the firefly you've just breathed in, you flail about and by blind luck your fingers close on the shawl. You feel someone is trying to tug it out of your hand, but the convulsive coughing makes you cling on tight.">

<ROOM STORY278
	(DESC "278")
	(STORY TEXT278)
	(PRECHOICE STORY278-PRECHOICE)
	(CONTINUE STORY324)
	(CODEWORD CODEWORD-IGNIS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY278-PRECHOICE ()
	<KEEP-ITEM ,SHAWL ,STORY302>>

<CONSTANT TEXT279 "You must have wandered far to the south of your original route. But which way is north? The leaf canopy virtually covers the sky, giving you few clues about which way you should go.">
<CONSTANT CHOICES279 <LTABLE "use" "or" "otherwise">>

<ROOM STORY279
	(DESC "279")
	(STORY TEXT279)
	(CHOICES CHOICES279)
	(DESTINATIONS <LTABLE STORY441 STORY075 STORY326>)
	(REQUIREMENTS <LTABLE SKILL-WILDERNESS-LORE SKILL-CHARMS NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT280 "You set out in the early morning. A cool wind whips spindrift in your face and fills the taut white wing of the sail. The trader calls to his two young sons, who scramble along the vessel like monkeys making adjustments to the course. Soon the prow is chopping the sea aside as you steer out of sight of land with the sun at your backs.||\"Shouldn't we keep the coast in sight?\" you ask.||\"Not a bit of it!\" bellows the trader over the crash of the surf. \"The sun is enough to guide our way, for any seafarer with a pinch of salt in his blood.\"||\"Father...\" says one of the sons, tugging the hem of his kilt.||\"Not now, lad,\" mutters his father, scanning the western horizon as he moves the tiller.||\"But, Father...\" insists the other boy.||You turn to see what they are looking at. A longship filled with fierce warriors is bearing down at you out of the north-east. As they get nearer, you see their black tunics and the turquoise beads that blaze at their wrists and throats. White face-paint gives them the appearance of hungry ghosts, and the raised spears make their intentions clear. Pirates!">
<CONSTANT CHOICES280 <LTABLE "use" "or" "otherwise">>

<ROOM STORY280
	(DESC "280")
	(STORY TEXT280)
	(CHOICES CHOICES280)
	(DESTINATIONS <LTABLE STORY274 STORY297 STORY320>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS SKILL-TARGETING NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT281 "You are surrounded by guards and any attempt to fight must be hampered by the throng of people crowding around the pit. As you lash out, the obsidian teeth of a guard's sword bit deeply into the flesh of your side.||\"Be careful!\" commands the high priest. \"The Rain God will be angered if we damage his sacrifice!\"||Shoving one of the guards aside, you manage to struggle to the brink of the pit. The high priest steps back nervously as he sees the look of desperation in your eyes, raising his ritual knife to defend himself. The guards have regrouped and are spreading out to capture you.||You are losing blood from the wound you have taken.">
<CONSTANT CHOICES281 <LTABLE "surrender" "fight on" "leap into the sacred well">>

<ROOM STORY281
	(DESC "281")
	(STORY TEXT281)
	(PRECHOICE STORY281-PRECHOICE)
	(CHOICES CHOICES281)
	(DESTINATIONS <LTABLE STORY327 STORY051 STORY235>)
	(TYPES THREE-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY281-PRECHOICE ()
	<COND (,RUN-ONCE <TEST-IMMORTALITY 3 ,DIED-FROM-INJURIES ,STORY281>)>>

<CONSTANT TEXT282 "Your talent for stealth seems heightened in this otherworldly realm. You creep forward as noiselessly as a shadow. Gruesome slime coats the rough stone walls and the smell is almost unbearable, but you reach the chamber and stoop to inspect the item that caught your eye. It is a bowl of polished stone bearing the insignia of the Creator God, who gave life to all things, and you need no special senses to recognize the aura of divine magic. This can only be the fabled Chalice of Life in which the gods mixed the brew that spawned mankind.||You slip quietly back to the boat and gesture for the demons to convey you on.">

<ROOM STORY282
	(DESC "282")
	(STORY TEXT282)
	(CONTINUE STORY258)
	(ITEM CHALICE-OF-LIFE)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT283 "Circular marks are scored into the stone of the ledge. To anyone else they would mean nothing, but you realize that the slabs must be built to swivel on a central axis. Searching, your deft fingers soon find a concealed catch which unlocks the slab. With a grinding noise it revolves to reveal the darkened interior of the tomb.||Something moves within it. At first a sense of dread stirs the hairs on the nape of your neck, but it is no horrific walking corpse that emerges from the hole -- just a snake. You are almost relieved; at least this is a natural foe, although a deadly one. But then you see it is no ordinary snake. Its hood is enlarged to form translucent oval wings which flap slowly, carrying it on the warm updraught with a sinister gliding motion. Its iridescent scales make it resemble an obsidian idol, but there is no mistaking the living menace in those beady eyes and thin flickering tongue.">
<CONSTANT CHOICES283 <LTABLE "try closing with the snake to fight it using either" "or" "shoot it" "cast a protective enchantment" "use the" "give up any hope of looting the tomb and climb back down to the canoe while you still can">>

<ROOM STORY283
	(DESC "283")
	(STORY TEXT283)
	(CHOICES CHOICES283)
	(DESTINATIONS <LTABLE STORY375 STORY375 STORY352 STORY394 STORY413 STORY167>)
	(REQUIREMENTS <LTABLE SKILL-SWORDPLAY SKILL-UNARMED-COMBAT SKILL-TARGETING SKILL-CHARMS MAN-OF-GOLD NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-SKILL R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT284 "You bring some water back in your cupped hands. It is green with pond scum and smells like bile, so you are not surprised when the little fellow turns his long nose up at it. But then he clasps your arm and explains in a weak voice. \"It's not water I need, friend, but nice warm blood. Will you let me have drop or two of yours? If not, I fear I'm doomed to end my days here in this cold ditch.\"">
<CONSTANT CHOICES284 <LTABLE "let him drink some of your blood" "shake free of his grip and continue on your way">>

<ROOM STORY284
	(DESC "284")
	(STORY TEXT284)
	(CHOICES CHOICES284)
	(DESTINATIONS <LTABLE STORY395 STORY307>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT285 "You must select an item from your possessions to give.">

<ROOM STORY285
	(DESC "285")
	(STORY TEXT285)
	(PRECHOICE STORY285-PRECHOICE)
	(CONTINUE STORY078)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY285-PRECHOICE ("AUX" (GIVE-LIST NONE) (RESULT 0) (ITEMS 0) (GIFT NONE))
	<SET GIVE-LIST <LTABLE NONE NONE NONE NONE NONE NONE NONE NONE>>
	<SET ITEMS <COUNT-CONTAINER ,PLAYER>>
	<COND (<G? .ITEMS 0>
		<PREVENT-DEATH ,STORY285>
		<DO (I 1 .ITEMS)
			<PUT .GIVE-LIST .I <GET-ITEM .I ,PLAYER>>
		>
		<PUT .GIVE-LIST 0 .ITEMS>
		<REPEAT ()
			<SET RESULT <GIVE-FROM-LIST .GIVE-LIST UNABLE-TO-PART UNWILLING-TO-PART 1 NONE ,PLAYER>>
			<COND (<EQUAL? .RESULT GIVE-GIVEN> <RETURN>)>
			<EMPHASIZE "The King will insist on a gift!">
		>
		<SET GIFT <FIRST? ,GIVEBAG>>
		<COND (<EQUAL? .GIFT ,MAN-OF-GOLD ,JADE-SWORD ,GOLD-DIADEM> <STORY-JUMP ,STORY192>)>
		<COND (<EQUAL? .GIFT ,OWL> <STORY-JUMP ,STORY055>)>
	)(ELSE
		<CRLF>
		<TELL "Having nothing to give, you are forced to abandon your quest" ,PERIOD-CR>
	)>>

<CONSTANT TEXT286 "This is the so-called Death Canyon which prevents spirits returning form the deathlands by means of the underworld. The story goes that even the hero Jewelled Bird nearly fell when he tried jumping between the spires of rock, so you guess that such a feat would demand great agility. Dredging deeper into your memory you recall a legend of the dragon Kawak, a serpentine monster with a head at each end who is said to span this canyon, lying with one head on each side. The hero-twins Forethought and Afterthought returned from the Deathlands by walking into the open jaws of the dragon and making their way through its bowels. It goes without saying that such a route might not be so easy in reality as it was for such heroes of long ago. Kawak might just devour you!">
<CONSTANT CHOICES286 <LTABLE "search for the two-headed dragon" "use a blowgun to get across" "try jumping between the spires of rock">>

<ROOM STORY286
	(DESC "286")
	(STORY TEXT286)
	(CHOICES CHOICES286)
	(DESTINATIONS <LTABLE STORY309 STORY170 STORY147>)
	(REQUIREMENTS <LTABLE NONE BLOWGUN NONE>)
	(TYPES <LTABLE R-NONE R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT287 "All signs are that the woman is a victim of one of the parasitical monsters that people call nightcrawlers. These are disembodied heads that latch onto a human host, sinking tendrils deep into the flesh that allow them to control their victim like a puppet. By day they prefer to shield themselves from the sun, which no doubt explains the overturned pitcher on the woman's shoulder. After nightfall they detach from the host and go gliding about in search of blood to feed on.||You know that salt prevents the night-crawler from fixing onto its prey.">

<ROOM STORY287
	(DESC "287")
	(STORY TEXT287)
	(PRECHOICE STORY287-PRECHOICE)
	(CONTINUE STORY057)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY287-PRECHOICE ()
	<COND (<CHECK-ITEM ,PARCEL-OF-SALT> <STORY-JUMP ,STORY034>)>>

<CONSTANT TEXT288 "You stand over the fallen body. The eyes in the creature's ghastly face fix you with a last glare of fury, then roll up in their sockets. There is a dying rattle from the inhuman throat as it detaches itself from its host and rolls away, rotting like an overripe fruit the moment it enters the sunlight. You cover your nose with a gasp of disgust as you catch a whiff of the moulder stench that drifts up from it.||You kneel beside the poor woman who was forced to act as host to the disembodied head. Her neck was broken in the struggle. There is nothing you can do except give her a decent burial before heading grimly onwards.">

<ROOM STORY288
	(DESC "288")
	(STORY TEXT288)
	(CONTINUE STORY417)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT289 "In the mythology of your people, each of the cardinal points is associate with a colour. White is the colour of the north, the colour of mankind's ancient ancestors, a palace of lost memories. Red is the east, denoting birth and a return to fresh beginnings. Yellow is the southern route of misfortune and loss. And black is the west, where the Deathlands lie. That is the route you must follow.">

<ROOM STORY289
	(DESC "289")
	(STORY TEXT289)
	(CONTINUE STORY219)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT290 "You press yourself into the angle where the floor meets the wall and slither forward like a snake. You pass right under the alcove where the first sentinel sits, but he never notices a thing. As you go past the second, he sniff the air suspiciously but says nothing. Beneath the alcove of the third, you accidentally scuff the stone flagging; the sentinel pricks up his ears and looks left and right along the passage, but he does not think to look down.||You are almost past the fourth alcove when your luck runs out. A speck of dust wafts up your nose and you give a loud sneeze. Instantly you are on your feet and running, but just as quickly the last sentinel makes a grab for you. He snatches away something you were carrying.">
<CONSTANT TEXT290-FLESH "It was a strip of flesh that he ripped off">

<ROOM STORY290
	(DESC "290")
	(STORY TEXT290)
	(PRECHOICE STORY290-PRECHOICE)
	(CONTINUE STORY336)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY290-PRECHOICE ("AUX" COUNT)
	<SET COUNT <COUNT-POSSESSIONS>>
	<COND (<G? .COUNT 0>
		<PREVENT-DEATH ,STORY290>
		<COND (<G? .COUNT 1>
			<LOSE-STUFF ,PLAYER ,LOST-BAG "item" <- .COUNT 1> RESET-POSSESSIONS>
		)(ELSE
			<EMPHASIZE ,ALL-POSSESSIONS>
			<RESET-CONTAINER ,PLAYER>
			<MOVE ,ALL-MONEY ,PLAYER>
		)>
	)(ELSE
		<TEST-IMMORTALITY 1 ,DIED-FROM-INJURIES ,STORY290>
		<COND (<IS-ALIVE> <EMPHASIZE TEXT290-FLESH>)>
	)>>

<CONSTANT TEXT291 "Two of the monster's head lash out together. You give a cry of pain as long curved fangs scythe a chunk out of your flesh.">
<CONSTANT TEXT291-BLOCK "You blocked one of the attacks">
<CONSTANT CHOICES291 <LTABLE "dodge back away from it" "make a headlong assault" "attempt to distract it with a feint">>

<ROOM STORY291
	(DESC "291")
	(STORY TEXT291)
	(PRECHOICE STORY291-PRECHOICE)
	(CHOICES CHOICES291)
	(DESTINATIONS <LTABLE STORY245 STORY268 STORY419>)
	(TYPES THREE-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY291-PRECHOICE ("AUX" (BLOCKED F) (DAMAGE 3))
	<COND (,RUN-ONCE
		<COND (<OR <CHECK-SKILL ,SKILL-SWORDPLAY> <CHECK-SKILL ,SKILL-UNARMED-COMBAT>>
			<SET BLOCKED T>
			<SET DAMAGE 2>
		)>
		<TEST-IMMORTALITY .DAMAGE ,DIED-FROM-INJURIES ,STORY291>
		<COND (<AND <IS-ALIVE> .BLOCKED>
			<CRLF>
			<TELL ,TEXT291-BLOCK>
			<TELL ,PERIOD-CR>
		)>
	)>>

<CONSTANT TEXT292 "Your companion is led off across the courtyard towards a group of buildings. He looks back at you with sudden alarm, only to be jostled by the throng of dog-like courtiers surrounding him. \"Do not be afraid,\" you call after him. \"Courage and determination will win us through the trials to come.\"||The chief courtier picks at his teeth and murmurs in a mocking tone. \"By the look of him, he doesn't share your sterling qualities. Timidity and wretchedness seem more his mark.\"||You watch until the poor man is bustled inside, then round on the chief courtier. \"I demand to be taken to Necklace of Skulls.\"||\"In good time,\" he chortles. \"Have I not invited you to be our guest first? After five nights you will be admitted to the sanctum of our master.\" He points a long hairy finger towards the pyramid that towers over the inner courtyard. The black colouring of the building makes it look like a sliver of night that remains to defy the daytime.||\"Take me to my quarters, then,\" you tell him.||The assembled courtiers give a high howling laugh at this. \"Not so fast,\" titters the chief when he has recovered himself. \"First you have to choose your route to our compound.\"">

<ROOM STORY292
	(DESC "292")
	(STORY TEXT292)
	(CONTINUE STORY315)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT293 "You lick your lips nervously and venture another step closer to the burly hound. Its snarl becomes a roar as it throws itself at your throat.">
<CONSTANT CHOICES293 <LTABLE "stand your ground and fight" "retreat to the colonnade at the mouth of the passage">>

<ROOM STORY293
	(DESC "293")
	(STORY TEXT293)
	(CHOICES CHOICES293)
	(DESTINATIONS <LTABLE STORY229 STORY362>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT294 "The candle looks as though it will last for about an hour. Just as you are thinking this, a draft of cold air suddenly blows it out, plunging you into darkness.||Silence hangs like a waiting presence in the air. The darkness dances in front of your eyes, causing your imagination to paint pictures of horror on the back of your mind. Your flesh creeps with unidentifiable fears.||You hear a noise that sets your heart pounding and every nerve shrieking. It was the sound of something dragging itself across the dry earthen floor. It stops beside you and you feel it reach out to stroke your leg: a thin dry hand with no flesh on it...||And then you scream.||All through the night you are beset by gibbering phantoms that come prancing out of the darkness, running their unseen hands over your skin and whispering horrible things in your ears.">
<CONSTANT TEXT294-CONTINUED "When the dawn arrives you stagger out on shaking legs to retrieve your pack of belongings. No matter what dangers you have to face now, you cannot conceive of anything more unpleasant than another night in the House of Gloom.">

<ROOM STORY294
	(DESC "294")
	(STORY TEXT294)
	(PRECHOICE STORY294-PRECHOICE)
	(CONTINUE STORY040)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY294-PRECHOICE ()
	<TEST-IMMORTALITY 1 "You died from the harrowing experience" ,STORY294>
	<IF-ALIVE TEXT294-CONTINUED>>

<CONSTANT TEXT295 "With a breathtaking lunge he catches up with the ball and strikes it a sweeping blow which sends it thudding up against the scoring zone.">
<CONSTANT TEXT295-CHARMS "You are unlucky and it catches you a hard blow on the side of the head">

<ROOM STORY295
	(DESC "295")
	(STORY TEXT295)
	(PRECHOICE STORY295-PRECHOICE)
	(CONTINUE STORY066)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY295-PRECHOICE ()
	<SCORE-POINTS 1 ,FOES>
	<COND (<NOT <CHECK-SKILL ,SKILL-CHARMS>>
		<CRLF>
		<TELL ,TEXT295-CHARMS>
		<TELL ,PERIOD-CR>
		<TEST-IMMORTALITY 1 ,DIED-FROM-INJURIES ,STORY295>
	)(ELSE
		<PREVENT-DEATH ,STORY295>
	)>>

<CONSTANT TEXT296 "Necklace of Skulls towers over you, his grotesque head looming like a pallid mushroom against the deep blue bowl of the heavens. His sword descends in a jagged sweep, and you throw yourself to one side. You hear it clash against the stone steps. At the same time as fighting you physically, he also uses his magic -- unleashing tendrils of poisonous gas from his throat and enchanting the skulls hanging at his chest so that they strain on their cords to snap at.">

<ROOM STORY296
	(DESC "296")
	(STORY TEXT296)
	(PRECHOICE STORY296-PRECHOICE)
	(CONTINUE STORY342)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY296-PRECHOICE ("AUX" (DAMAGE 9))
	<COND (<CHECK-SKILL ,SKILL-SWORDPLAY> <SET DAMAGE <- .DAMAGE 2>>)>
	<COND (<CHECK-SKILL ,SKILL-CHARMS> <SET DAMAGE <- .DAMAGE 2>>)>
	<COND (<CHECK-SKILL ,SKILL-UNARMED-COMBAT> <SET DAMAGE <- .DAMAGE 2>>)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY296>>

<CONSTANT TEXT297 "Your first dart hits a pirate right between his white-rimmed eyes and he slumps over the side with a groan. The others react to this with screeches of rage, paddling furiously to catch up with your own vessel. By the time the gap has been closed to ten paces, you have slain two more of them with your blowgun and they are beginning to have second thoughts. When they see you slide another dart into the blowgun, they throw up their hands in a gesture of surrender and go veering off towards the horizon -- no doubt in search of easier pickings.">

<ROOM STORY297
	(DESC "297")
	(STORY TEXT297)
	(CONTINUE STORY343)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT298 "All along your route you find deserted cottages where people have abandoned their homes and farms for safer regions. You pass refugees on the mountain roads. Some tell you they are fleeing from brigands. Others fear the devils and werewolves that they believe will be unleashed from the western desert now the Great City has fallen.||Food is hard to come by in the arid sierra.">
<CONSTANT TEXT298-TRAVEL "Travelling off the main paths to avoid the groups of marauding brigands, you are forced ">
<CONSTANT TEXT298-HUNT "back on your own skills to find sustenance">
<CONSTANT TEXT298-EAT "to eat from your provisions">
<CONSTANT TEXT298-CONTINUED "Days turn to weeks. At last you catch sight of the town of Shakalla in the distance. Beyond it lies the great stony rim of the desert, crouching like a baleful predator at the edge of the world">

<ROOM STORY298
	(DESC "298")
	(STORY TEXT298)
	(PRECHOICE STORY298-PRECHOICE)
	(CONTINUE STORY321)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY298-PRECHOICE ()
	<CRLF>
	<TELL ,TEXT298-TRAVEL>
	<COND (<OR <CHECK-SKILL ,SKILL-TARGETING> <CHECK-SKILL ,SKILL-WILDERNESS-LORE>>
		<TELL ,TEXT298-HUNT>
		<TELL ,PERIOD-CR>
		<EMPHASIZE "You were able to hunt for food.">
		<PREVENT-DEATH ,STORY298>
	)(ELSE
		<TELL ,TEXT298-EAT>
		<TELL ,PERIOD-CR>
		<EAT-PROVISIONS 2 STORY298 T>
	)>
	<COND (<IS-ALIVE>
		<CRLF>
		<TELL ,TEXT298-CONTINUED>
		<TELL ,PERIOD-CR>
	)>>

<CONSTANT TEXT299 "You break the stem of the cactus and it oozes a clear sweet-smelling fluid. You taste a little, then suck at it until you have drained all you can. It is barely enough. You stumble on across the lifeless wilderness of stone and sand, thirst burning a throbbing gulf in your throat.">

<ROOM STORY299
	(DESC "299")
	(STORY TEXT299)
	(PRECHOICE STORY299-PRECHOICE)
	(CONTINUE STORY152)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY299-PRECHOICE ()
	<TEST-IMMORTALITY 4 ,DIED-OF-THIRST ,STORY299>>

<CONSTANT TEXT300 "Two days' sailing brings you to Tahil, a busy trading settlement on the far coast. The others squint warily as they bring the vessel in to the harbour. You can see at once there is trouble here. Instead of the stacks of trade goods that would normally be piled up along the quayside at a port like this, there are milling crowds of refugees carrying everything they own on their backs.||As you tie up at the quay, a man whose elegant clothing marks him as a lord of the Great City comes striding towards you. \"I am commandeering your vessel,\" he says in a tone that brooks no disagreement.||Without waiting for a reply, he turns and beckons his wife and children to join him. A couple of servants scurry along behind them, struggling under the weight of the family's possessions.">
<CONSTANT CHOICES300 <LTABLE "prevent his appropriation of the vessel by employing" "using" "a sword" "you are not bothered about him taking the vessel, you can just set out towards Shakalla">>

<ROOM STORY300
	(DESC "300")
	(STORY TEXT300)
	(CHOICES CHOICES300)
	(DESTINATIONS <LTABLE STORY159 STORY183 STORY206 STORY085>)
	(REQUIREMENTS <LTABLE SKILL-ETIQUETTE SKILL-CUNNING SKILL-SWORDPLAY NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<ROOM STORY301
	(DESC "301")
	(EVENTS STORY301-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY301-EVENTS ()
	<COND (<G? ,DONATION 4> <RETURN ,STORY323>)>
	<RETURN ,STORY346>>

<CONSTANT TEXT302 "The effort of trying to regurgitate the firefly leaves your eyes watering, but to no avail. Before you can blink away the tears, you realize someone is trying to pull the shawl out of your grip. You have the impression of someone very tall and unbelievably thin, like a human stick insect. The face is as pale as sap, and the naked skin exudes a sweet smell like tree bark and honey.||You wipe your eyes and look again. At first you think the figure is gone, but then there is a flicker of movement at the edge of your vision. Whirling, you catch a brief glimpse of two or three thin creatures. They dart away like pale green fishes to hang just behind your line of sight. By standing still you get an uncertain and unfocused view of them out of the corner of your eye. It dawns on you that there are many of them clustered noiselessly around the clearing, transient as sunbeams. They are the stabai -- the creatures of the wooded dells, who ply their magic to the discomfort of lone travellers like yourself.||\"You have our shawl,\" buzzes a soft forlorn voice in your ear. \"Won't you return it?\"">
<CONSTANT CHOICES302 <LTABLE "use" "if not, decide whether to return the shawl to them" "keep it">>

<ROOM STORY302
	(DESC "302")
	(STORY TEXT302)
	(CHOICES CHOICES302)
	(DESTINATIONS <LTABLE STORY255 STORY347 STORY369>)
	(REQUIREMENTS <LTABLE SKILL-FOLKLORE NONE NONE>)
	(TYPES <LTABLE R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT303 "The sun rises again, flooding the sands with red-gold light. You are contemplating the need for shelter when, cresting a dune, you catch sight of it at long last -- the wizard's palace. Double ramparts surround a central courtyard where a high black pyramid rises like a blotch of midnight. The palace lies just ahead across a stretch of brown-gold sand. The dawn light makes it seem to shimmer like a mirage in the deep blue shadows between the dunes, but you know it is real.||Double doors swing open in the wall as you approach. Confronting you is a horde of men in ragged animal skins. Their long thin faces and downcast smiles give them a canine appearance. All of them bear stone axes which they lift when you walk through the palace gate -- not a gesture of impending violence, but just to warn you where you stand.||\"I have come,\" you say, \"to see Necklace of Skulls.\"||One of the men gives a bark of laughter. \"It's not as easy as that. Do you think our master sees every stray mongrel who wanders to his door? First you will have to pass five nights among us, his faithful courtiers. And before that you'll face another test: deciding which route to take to the inner courtyard.\"">

<ROOM STORY303
	(DESC "303")
	(STORY TEXT303)
	(CONTINUE STORY315)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT304 "From what your friend the old soothsayer told you, it is unwise to speak once you enter the underworld. You had better cast your spells now, while you still can.||\"Allow me a moment to compose myself,\" you say to the high priest.||\"It is irregular...\"||\"I am about to meet a god,\" you point out.||Stepping away a few paces, you murmur the words of an incantation which renders your body as buoyant as wood. You gaze down into the depths of the well. At least now you can be sure of not drowning -- but if this is truly the entrance to the underworld, there will be other dangers which you cannot yet even guess at.||You turn to the assembled crowd and announce, \"I am ready.\"||You are led to a shrine at the western edge of the hole. From here, a steep flight of steps descends towards a platform covered with the hieratic glyphs of the afterlife. A vest of golden plaques is fastened across your chest and the high priest places a tall helmet of gold and copper on your head. The burden of so much metal makes you stoop. These artifacts are beyond price, since gold is not found in this part of the world. It is a lavish offering to the Rain God, but it also serves a secondary purpose: the great weight ensures you will be carried deep under the water.||Several junior priests come forward with dishes of blue dye, which they use to paint spirals across your face and limbs. \"Thus you are consecrated to the Rain God,\" they explain. \"Go now into the other world, and carry our plea for rain to refresh the arid fields.\"">
<CONSTANT TEXT304-CONTINUED "Then you descend to the platform overlooking the well and prepare yourself for the most uncanny voyage anyone could every attempt: a leap into the underworld">

<ROOM STORY304
	(DESC "304")
	(STORY TEXT304)
	(PRECHOICE STORY304-PRECHOICE)
	(CONTINUE STORY411)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY304-PRECHOICE ()
	<CRLF>
	<COND (<CHECK-ITEM ,JADE-BEAD>
		<TELL ,TEXT-BEAD>
		<TELL ,PERIOD-CR>
		<CRLF>
	)>
	<TELL ,TEXT304-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT305 "Which of these will you use:">
<CONSTANT CHOICES305 <LTABLE "use The" "a" "a" "otherwise you will have to fight">>

<ROOM STORY305
	(DESC "305")
	(STORY TEXT305)
	(CHOICES CHOICES305)
	(DESTINATIONS <LTABLE STORY351 STORY372 STORY393 STORY328>)
	(REQUIREMENTS <LTABLE MAN-OF-GOLD PARCEL-OF-SALT FIREBRAND NONE>)
	(TYPES <LTABLE R-ITEM R-ITEM R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT306 "The Man of Gold comes to life in the warmth of your hands. You set him down on the ledge and he surveys the sealed tomb with a smile on his tiny sculpted features. You have no need to tell him what you want him to do. Striding forward, he batters at the slab with thunderous blows. You are amazed to see chips of stone fly away as he gradually tunnels a hole large enough for you to squeeze through. Then, his task completed, he turns and dives off into the river below.">
<CONSTANT TEXT306-CONTINUED "A movement from inside the tomb makes you jump. Out of the hole slithers a cobra. It is no ordinary cobra: its hood is vastly extended to form translucent oval wings which beat slowly, carrying it through the air with a sinister gliding motion. With its iridescent scales it seems like a polished stone idol, but there is no mistaking the living menace in the glittering eyes and forked tongue">
<CONSTANT CHOICES306 <LTABLE "retreat back down to the canoe" "close with the snake and fight it using either a sword" "or" "shoot it" "cast a protective enchantment">>

<ROOM STORY306
	(DESC "306")
	(STORY TEXT306)
	(PRECHOICE STORY306-PRECHOICE)
	(CHOICES CHOICES306)
	(DESTINATIONS <LTABLE STORY167 STORY375 STORY375 STORY352 STORY394>)
	(REQUIREMENTS <LTABLE NONE SKILL-SWORDPLAY SKILL-UNARMED-COMBAT SKILL-TARGETING SKILL-CHARMS>)
	(TYPES <LTABLE R-NONE R-SKILL R-SKILL R-SKILL R-SKILL>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY306-PRECHOICE ()
	<COND (<AND ,RUN-ONCE <CHECK-ITEM ,MAN-OF-GOLD>> <LOSE-ITEM ,MAN-OF-GOLD>)>
	<CRLF>
	<TELL ,TEXT306-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT307 "A bundle lies across the path ahead. Quickening your pace, you are startled when the 'bundle' suddenly raises its head. It is a dwarf with withered legs but very broad shoulders wrapped in a long black mantle. His large ears and upturned nose give him a grotesque appearance, and you are on the point of hurrying past when he raises a long imploring arm.||\"Please help me,\" he begs. \"I'm too weak to go on, and I'm terribly thirsty...\"">
<CONSTANT CHOICES307 <LTABLE "go back to the river to fetch him some water" "gash your hand and let him drink some of your blood" "step over him and continue along the path without stopping">>

<ROOM STORY307
	(DESC "307")
	(STORY TEXT307)
	(CHOICES CHOICES307)
	(DESTINATIONS <LTABLE STORY330 STORY353 STORY373>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT308 "You discover that King Cloud Jaguar is sitting with his courtiers in the steam bath at the rear of the palace. Leaving your clothes and belongings in a bundle behind a wall, you mingle in among the servants and pick up a jar of water. Clad in only loin-cloth, there is nothing to draw attention to you when you enter the bath-house with downcast eyes and pour water onto the sizzling stones of the hearth.||The King and the nobles of his court sit naked on the benches of the bath-house, sweltering in the wreathes of herb-scented steam. \"Will you be communing with your late father tonight, your Majesty?\" you hear one of the nobles asking.||\"Of course!\" says the King gruffly. \"I must discover the import of recent events. The collapse of the Great City will have far-reaching consequences.\"||\"The astrologers have read the signs,\" puts in the King's vizier. \"The most auspicious time is the hour just before dawn. We shall ascend the pyramid and speak our questions into the spirit tube which leads to King Sky Shield's tomb. Perhaps you would like to accompany us, Lord Smoke Shell?\"||The noble who spoke first looks up with sudden alarm. \"Ah... er, that's most gracious, but I need my sleep if I'm to cope with all the excitement tomorrow. I'm not as young as I once was.\"||\"Nor as brave,\" says the King pointedly, provoking a gust of laughter at Smoke Shell's expense. You leave the bath-house and retrieve your belongings.">
<CONSTANT CHOICES308 <LTABLE "seek lodging if you have some money" "continue on your journey either westwards" "north to the coast">>

<ROOM STORY308
	(DESC "308")
	(STORY TEXT308)
	(CHOICES CHOICES308)
	(DESTINATIONS <LTABLE STORY101 STORY008 STORY030>)
	(REQUIREMENTS <LTABLE 0 NONE NONE>)
	(TYPES <LTABLE R-MONEY R-NONE R-NONE>)
	(CODEWORD CODEWORD-PSYCHODUCT)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT309 "You walk along the side of the canyon in search of the dragon Kawak. The sky slowly acquires a sullen red glare like the inside of a kiln. Through the clouds of gritty yellow vapour rising out of the depths, you begin to discern a rock outcropping just ahead. Then you take a step or two closer and you realize it is not a pile of boulders that you see resting at the lip of the chasm. It is a gigantic head.||Kawak's snout reminds you of the temple pyramids of your homeland, with its size and bright patterning of carmine and bone-white. His mouth stands open like an ominous gateway, tongue leading up like a temple's stairway to where his eyes burn darkly under brows like shields of stone. You can see the immense curve of his body, as broad as a city plaza, arcing off into the distance towards the other side of the canyon. His claws resemble the prows of ocean-going canoes hanging over the edge of the precipice.||\"You wish to cross. To enter my mouth and pass into the world beyond.\" His voice is the sound of birth and death, the dull titanic roar that is more felt than heard. \"You must pay for your passage with a jade bead.">
<CONSTANT CHOICES309 <LTABLE "let Kawak have the" "employ the" "or a" "try crossing via the line of stepping-stones formed by the tips of the rock spires">>

<ROOM STORY309
	(DESC "309")
	(STORY TEXT309)
	(CHOICES CHOICES309)
	(DESTINATIONS <LTABLE STORY033 STORY079 STORY170 STORY147>)
	(REQUIREMENTS <LTABLE JADE-BEAD MAN-OF-GOLD BLOWGUN NONE>)
	(TYPES <LTABLE R-LOSE-ITEM R-ITEM R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT310 "This situation reminds you unpleasantly of what the fenman told you about nightcrawlers. You find that you cannot even consider what might be hidden under the overturned pitcher without a shudder of horror. The fenman also said that salt will stop a nightcrawler from attaching itself to a victim.">

<ROOM STORY310
	(DESC "310")
	(STORY TEXT310)
	(PRECHOICE STORY310-PRECHOICE)
	(CONTINUE STORY057)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY310-PRECHOICE ()
	<DELETE-CODEWORD ,CODEWORD-CALABASH>
	<COND (<CHECK-ITEM ,PARCEL-OF-SALT> <STORY-JUMP ,STORY034>)>>

<CONSTANT TEXT311 "You roll forward, carrying yourself and your hideous foe to the ground. It emits a gurgle of vaunting glee as it presses the stump of its neck against your shoulder, trying to drive its vampiric tendrils into your flesh and make you its willing host.">
<CONSTANT TEXT311-END "You have no defence against the creature's malign magic and you are doomed to become its next victim">

<ROOM STORY311
	(DESC "311")
	(STORY TEXT311)
	(PRECHOICE STORY311-PRECHOICE)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY311-PRECHOICE ()
	<COND (<OR <CHECK-SKILL ,SKILL-CHARMS> <CHECK-CODEWORD ,CODEWORD-SALVATION>>
		<PREVENT-DEATH ,STORY311>
		<STORY-JUMP ,STORY357>
	)(ELSE
		<PUTP ,STORY311 ,P?DEATH T>
		<CRLF>
		<TELL ,TEXT311-END>
		<TELL ,PERIOD-CR>
	)>>

<CONSTANT TEXT312 "You set your wand down on the ground in the middle of the crossroads and spin it, meanwhile uttering the words of a divining spell. It comes to rest pointing along the black path. That is the route you must take to reach the Deathlands.">

<ROOM STORY312
	(DESC "312")
	(STORY TEXT312)
	(CONTINUE STORY219)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT313 "You approach the first of the sentinels. Seeing you, he leans forward on his granite throne and taps your shoulder with a sceptre carved from a human thighbone. \"Where are your manners?\" he thunders. His voice sounds like a shriek of an eagle in the instant of seizing its prey.||What name will you greet him by?">
<CONSTANT CHOICES313 <LTABLE "answer \"Lord Blood\"" "\"Thunderbolt Laughter\"" "\"Grandfather of Darkness\"" "\"Lord Skull\"">>

<ROOM STORY313
	(DESC "313")
	(STORY TEXT313)
	(CHOICES CHOICES313)
	(DESTINATIONS <LTABLE STORY401 STORY380 STORY359 STORY014>)
	(TYPES FOUR-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT314 "Again you avoid the monster's bites by a hair's breadth. Spitting with fury at its failure to trap you, it slithers forward with all four necks extended.||Decide your next move.">
<CONSTANT CHOICES314 <LTABLE "continue to jump away from the hydra" "rush in to strike a blow" "try a feint">>

<ROOM STORY314
	(DESC "314")
	(STORY TEXT314)
	(CHOICES CHOICES314)
	(DESTINATIONS <LTABLE STORY360 STORY381 STORY419>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT315 "You are taken to the back wall of the courtyard, where colonnade gives respite from the intense sun. Beneath a frieze patterned like a rattlesnake's skin, four archways lead on from here to the next courtyard of the palace. The courtiers give you wide grins and invite you to make a choice.||You look into the first archway. A short flight of steps leads up to the edge of a pit about two metres across. The purpose of the steps is apparently to ensure that you cannot take a running jump. The bottom of the pit is filled with smoking coals.||Beyond the next archway is a tunnel blocked by an artful tangle of wooden beams, some of which seem to be shoring up the walls. \"The trick there is to remove the right combination of beams in the right order,\" says the chief courtier, leaning over your shoulder. \"You want to clear enough space to get past without causing the tunnel to collapse.\"||The third route is a passage with no obstacles -- just a triangular vault leading through to the next courtyard. then you notice the sigils inscribed along the corbels of the vault: sigils indicating calamity and catastrophe. Is the vault designed to cave in when someone walks along it?||The passage beyond the last archway is guarded by a large pallid hound with narrow pink eyes. It greets you with a threatening growl as you poke your head around the corner, but makes no move to attack. \"My second cousin twice removed,\" says the chief courtier in your ear. \"Nasty temper. His bite's worse than his bark, of course.\"||It is time for you to decide.">
<CONSTANT CHOICES315 <LTABLE "cross the pit" "attempt to clear the blocked tunnel" "walk along the unguarded tunnel" "brave the albino hound">>

<ROOM STORY315
	(DESC "315")
	(STORY TEXT315)
	(CHOICES CHOICES315)
	(DESTINATIONS <LTABLE STORY338 STORY361 STORY382 STORY420>)
	(TYPES FOUR-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT316 "Your dart tears into the hound's flank, leaving a raw bloody gash. It whines and shrinks back, only to leap forward without warning when you move to get past it along the tunnel. You feel a stab of pain as its teeth tear a hunk of flesh out of your thigh, but you stagger on regardless.">
<CONSTANT TEXT316-CONTINUED "You emerge into the inner courtyard to find the courtiers already there waiting for you. \"You're a blowgunner, eh?\" says the chief courtier. \"Well, I'm afraid you'll find the creatures who serve Necklace of Skulls are less easy to intimidate than your average deer.\"">

<ROOM STORY316
	(DESC "316")
	(STORY TEXT316)
	(PRECHOICE STORY316-PRECHOICE)
	(CONTINUE STORY431)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY316-PRECHOICE ()
	<TEST-IMMORTALITY 1 ,DIED-FROM-INJURIES ,STORY316>
	<IF-ALIVE TEXT316-CONTINUED>>

<CONSTANT TEXT317 "You squint in the shimmering glare of the sun, but your eyes cannot make out any shape within the black void of the shrine entrance. The soot-coloured pillars give its darkened interior the look of a fleshless mouth. Again Necklace of Skull's voice rolls along the avenue, each syllable driving like a grave-cool gust of wind through the blistering desert heat. \"Your brother came here before you.\"||Red rage seethes in your heart. \"That's right, you --\"||The sorcerer's words continue, unperturbed by your outburst. \"He played the ritual ball contest and he lost. His life was forfeit. Now you will play for the same stakes. Behold your antagonists.\" Two long rivulets of shadow flow out of the shrine and down the pyramid steps, looking like spreading pools of black blood against the ebon stone. Reaching the bottom, they rise up in obscenely palpitating columns which gradually take solid form. Human form. Confronting you now are your opponents in the ball contest: two creatures of living shadow fashioned by the sorcerer's magic.">

<ROOM STORY317
	(DESC "317")
	(STORY TEXT317)
	(PRECHOICE STORY317-PRECHOICE)
	(CONTINUE STORY384)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY317-PRECHOICE ()
	<START-RITUAL-BALL>
	<COND (<CHECK-ITEM ,BROTHERS-SKULL>
		<STORY-JUMP ,STORY340>
	)(<CHECK-CODEWORD ,CODEWORD-ANGEL>
		<STORY-JUMP ,STORY363>
	)>>

<CONSTANT TEXT318 "You bear down on the enemy defensive player. Glancing back you see that the far shadow man has reached the far end of the arena, where your partner has managed to intercept the ball and get possession. You shout for him to bounce it along the wall towards you.">

<ROOM STORY318
	(DESC "318")
	(STORY TEXT318)
	(PRECHOICE STORY318-PRECHOICE)
	(CONTINUE STORY405)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY318-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-SHADE> <STORY-JUMP ,STORY385>)>>

<CONSTANT TEXT319 "You manage to get the firebrand alight. It gives a little warmth, but not much. You spend a miserable night shivering in the icy draughts blowing through the House of Cold.">

<ROOM STORY319
	(DESC "319")
	(STORY TEXT319)
	(PRECHOICE STORY319-PRECHOICE)
	(CONTINUE STORY212)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY319-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
		<PREVENT-DEATH ,STORY319>
		<EMPHASIZE ,NATURAL-HARDINESS>
	)(ELSE
		<TEST-IMMORTALITY 1 ,DIED-GREW-WEAKER ,STORY319>
	)>
	<IF-ALIVE "In the morning, you stumble gratefully out into the hot sunshine.">>

<CONSTANT TEXT320 "The pirates' vessel bumps against yours and they come swarming over the side like ants. You cannot understand their yammering war-cries, for they are not of your people but come from a land beyond the northern sea. Their white-rimmed eyes hold a look that means the same in any language, though. It is the look of fury and hate.||You fight with desperate strength knowing that you are fighting not just for your own life but also for the trader and his young sons.">
<CONSTANT TEXT320-CONTINUED "You finally force the pirates to retreat to their own vessel and sail off.">

<ROOM STORY320
	(DESC "320")
	(STORY TEXT320)
	(PRECHOICE STORY320-PRECHOICE)
	(CONTINUE STORY343)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY320-PRECHOICE ("AUX" (DAMAGE 9))
	<COND (<CHECK-SKILL ,SKILL-SWORDPLAY>
		<SET DAMAGE 3>
	)(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
		<SET DAMAGE 5>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY320>
	<IF-ALIVE TEXT320-CONTINUED>>

<CONSTANT TEXT321 "Shakalla is a walled town whose hard sun-baked streets are the colour of hot ash. At this time of day, the place is deserted. Those who have not fled in fear have retreated to the cool interiors of their houses, seeking refuge from the midday sun. You see a few faces peering from the narrow doorways as you go past. A dog lies stretched in the shade of a shop's awning, panting with the heat.">
<CONSTANT CHOICES321 <LTABLE "enter the shop" "carry on to the west gate of the town">>

<ROOM STORY321
	(DESC "321")
	(STORY TEXT321)
	(CHOICES CHOICES321)
	(DESTINATIONS <LTABLE STORY344 STORY325>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT322 "You become weaker and weaker. Finally you collapse and lie stretched out on the hard sun-blistered ground, too weak to rise. You feel like one who has been chosen for sacrifice to the gods, spread-eagled and helpless. Your eyes are stinging. You stare up at the sky, which first blackens until it is like ink, then explodes in a hazy burst of light. Now you are weightless, dropping down an endless tunnel that leads into the bowels of the earth...||And so you die, far out in the cruel desert with only the vultures to witness your last agonized moments. Perhaps you will be reunited with your brother in the afterlife -- but only the gods can say.">

<ROOM STORY322
	(DESC "322")
	(STORY TEXT322)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT323 "\"A generous donation.\" The high priest puts the money into his belt-pouch. \"I shall see that a ritual of benediction is performed for you at the temple tomorrow morning. You will carry the blessing of the god.">
<CONSTANT TEXT323-BLESS "The blessing of the War God means that you can ignore any one injury taken at any point of your choice during the adventure. Remember that it only works once.">
<CONSTANT TEXT323-CONTINUED "How about a spot of ball practice?\" suggests the high priest">
<CONSTANT CHOICES323 <LTABLE "join him for a practice bout in the arena" "you had better get on with the rest of your preparations for the journey">>

<ROOM STORY323
	(DESC "323")
	(STORY TEXT323)
	(PRECHOICE STORY323-PRECHOICE)
	(CHOICES CHOICES323)
	(DESTINATIONS <LTABLE STORY368 STORY093>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY323-PRECHOICE ()
	<COND (,RUN-ONCE <SETG BLESSING-WAR-GOD T>)>
	<EMPHASIZE TEXT323-BLESS>
	<CRLF>
	<TELL ,TEXT323-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT324 "You gaze around. All directions present you with the same vista: trees stand like stone sentinels draped in moss-coloured gloom. Great nets of creepers are strung between their heavy boughs. There are not even any sounds of wildlife to disturb the hoary solitude of the ancient woods. You are thoroughly lost.">

<ROOM STORY324
	(DESC "324")
	(STORY TEXT324)
	(PRECHOICE STORY324-PRECHOICE)
	(CONTINUE STORY118)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY324-PRECHOICE ()
	<COND (<CHECK-ITEM ,MAGIC-POTION> <DRINK-POTION>)>
	<COND (<L? ,LIFE-POINTS ,MAX-LIFE-POINTS>
		<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
			<STORY-JUMP ,STORY072>
		)(ELSE
			<STORY-JUMP ,STORY095>
		)>
	)>>

<CONSTANT TEXT325 "A low tunnel in the wall around the town forms the west gate. Crouching as you make your way along the tunnel, you notice rough scrawlings in the stone. One shows a man with the tail and claws of a scorpion: another is a four-headed dragon.||Two guards armed with spear stand at the far end of the tunnel, staring nervously out across the desert. As they hear you come up, they glance at you and one says, \"Here's a traveller who isn't afraid to take the Gate of Exiles!\"||Beyond, in the bright sunshine, lies the desert you must cross. The bleak stony landscape of crags and dusty gullies stretches off into a haze of heat along the horizon. A path leads from the gate, but it peters out beside a large boulder ten paces away.">
<CONSTANT CHOICES325 <LTABLE "question the guards about the markings on the tunnel walls" "or the nearby boulder" "you can simply set out in the desert">>

<ROOM STORY325
	(DESC "325")
	(STORY TEXT325)
	(CHOICES CHOICES325)
	(DESTINATIONS <LTABLE STORY367 STORY388 STORY407>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT326 "You follow a game trail that forks beside a high moss-caked boulder. Sunlight slants down through chinks in the foliage, teasing you with inadequate clues as to your bearing.">
<CONSTANT CHOICES326 <LTABLE "go left" "take the right-hand fork">>

<ROOM STORY326
	(DESC "326")
	(STORY TEXT326)
	(CHOICES CHOICES326)
	(DESTINATIONS <LTABLE STORY412 STORY348>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT327 "You are led to a shrine at the western edge of the hole. From here, a steep flight of steps descends towards a platform covered with the hieratic glyphs of the afterlife. You will soon walk down those steps and, after reaching the platform, plunge far down into the dark waters below.||A vest of golden plaques is fastened across your chest and the high priest places a tall helmet of gold and copper on your head. The burden of so much metal makes you stoop. These artifacts are beyond price since gold is not found in this part of the world. It is a lavish offering to the Rain God, but it also serves a secondary purpose: the great weight ensures you will be carried deep under the water.||Several junior priests come forward with dishes of blue dye, which they use to paint spirals across your face and limbs. \"Thus you are consecrated to the Rain God,\" they explain. \"Go now into the other world, and carry our plea for rain to refresh the arid fields!\"">
<CONSTANT TEXT327-CONTINUED "Then you descend to the platform overlooking the well and prepare yourself for the most uncanny voyage anyone could ever attempt: a leap into the underworld">
<CONSTANT CHOICES327 <LTABLE "use a wand" "or an amulet" "employ" "or use" "or" "otherwise">>

<ROOM STORY327
	(DESC "327")
	(STORY TEXT327)
	(PRECHOICE STORY327-PRECHOICE)
	(CHOICES CHOICES327)
	(DESTINATIONS <LTABLE STORY411 STORY189 STORY371 STORY392 STORY005 STORY028>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS SKILL-CHARMS SKILL-CUNNING SKILL-SEAFARING BLOWGUN NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-SKILL R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY327-PRECHOICE ()
	<CRLF>
	<COND (<CHECK-ITEM ,JADE-BEAD> <TELL ,TEXT-BEAD> <TELL ,PERIOD-CR> <CRLF>)>
	<TELL ,TEXT327-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT328 "You cannot suppress a scream as their wet stubby fingers clutch at you. It is like a scene from your worst nightmares. Striking out blindly, you stumble along the tunnel. You feel their shells crack under your frantic blows, but then a slimy hand presses over your face and you reel under a hail of punches. Ichor spurts into your eyes as you drive a deep blow hard into your eyes as you drive a deep blow hard into one of the creatures, and its eerie keening wail evokes a feeling of unendurable horror.">

<ROOM STORY328
	(DESC "328")
	(STORY TEXT328)
	(PRECHOICE STORY328-PRECHOICE)
	(CONTINUE STORY258)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY328-PRECHOICE ("AUX" (DAMAGE 0))
	<COND (<CHECK-SKILL ,SKILL-SWORDPLAY>
		<SET DAMAGE 3>
	)(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
		<SET DAMAGE 4>
	)(ELSE
		<EMPHASIZE "There is nothing you can do to prevent yourself being overwhelmed and slain.">
		<RETURN>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-FROM-INJURIES ,STORY328>>

<CONSTANT TEXT329 "You were optimistic. It takes you nearly two hours to smash a hole large enough to squeeze through. As you stand on the ledge, panting with exhaustion and with sweat pouring off your body, there is a movement from inside the tomb.||Out of the hole slithers a flying cobra. Its hood is vastly extended to form translucent oval wings which beat slowly, carrying the snake forward through the air with venatic precision. Its iridescent scales and hood make it seem like a polished stone effigy, but there is no mistaking the living menace in its glittering golden eyes and flickering forked tongue.||After the hours spent pounding away at the slab, your shoulders are aching and you can barely lift your arms. There is no way you could climb back down to the canoe right now. The cobra swoops higher, arching its head as it hovers just above you. You must think of something quickly, or you will fall prey to its lethal bite.">
<CONSTANT CHOICES329 <LTABLE "cast a protective enchantment" "use" "use" "otherwise">>

<ROOM STORY329
	(DESC "329")
	(STORY TEXT329)
	(CHOICES CHOICES329)
	(DESTINATIONS <LTABLE STORY394 STORY191 STORY413 STORY145>)
	(REQUIREMENTS <LTABLE SKILL-CHARMS SKILL-UNARMED-COMBAT MAN-OF-GOLD NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT330 "By the time you return with a little of the river water cupped in your hands, the strange dwarfish man has disappeared. Presumably he has crawled off into the reeds. You scan the bleak landscape, straining your ears for the sound of someone sloshing through the wet mud, but to no avail. He looked so weak that he could not get far, but you are not keen to go wading off the path in search of him. At least you know that you tried to help.">

<ROOM STORY330
	(DESC "330")
	(STORY TEXT330)
	(CONTINUE STORY373)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT331-SPEAK "Speak to the dead king's spirit?">
<CONSTANT TEXT331-DECIDE "You decide what you will do the next morning:">
<CONSTANT CHOICES331 <LTABLE "go west towards Ashaka" "go north to the coast" "stay in Nachan for the festival">>

<ROOM STORY331
	(DESC "331")
	(PRECHOICE STORY331-PRECHOICE)
	(CHOICES CHOICES331)
	(DESTINATIONS <LTABLE STORY008 STORY030 STORY416>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY331-PRECHOICE ()
	<COND (,RUN-ONCE
		<CRLF>
		<TELL ,TEXT331-SPEAK>
		<COND (<YES?> <STORY-JUMP ,STORY218> <RETURN>)>
	)>
	<COND (,RUN-ONCE
		<GAIN-LIFE 1>
		<TELL CR "You recovered a bit of your vitality after a night's rest" ,PERIOD-CR>
	)>
	<CRLF>
	<TELL ,TEXT331-DECIDE>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT332 "\"I notice you suffer from a bad back,\" you say to the fenman. \"May I ask why you don't rig a sail on your boat to save yourself the effort of rowing?\"||\"Do you know nothing about boats?\" he grumbles as he picks up another heavy pot. \"A vessel made of reeds is to flimsy to support the weight of a mast.\"||\"Use a double mast, so that the sail straddles the boat,\" you suggest. \"This would distribute the load more evenly. Also, why not treat the reeds with oil, which would make the hull more watertight?\"||\"With the price of oil today?\" he cries incredulously. \"Reeds cost next to nothing.\"||\"Ah, but think of the time it takes yo to make a new boat for each river trip. A hull treated with oil would soon repay the initial cost.\"||He stops what he is doing and looks at you with new interest. \"Anything else?\" he asks.||\"Yes. I see you are loading empty pots aboard your boat, presumably for sale downriver. Mead is plentiful in Nachan but not in the fens, so why not fill the pots with mead? It would take up no more space, but your profits would be enlarged by at least one fifth.\"||\"A fine idea,\" he admits, \"but the pots are heavy enough for my poor back already.\"||\"Exactly why you need a passenger who's willing to chip in a help,\" you answer in a trice. Convinced you are worth having along, he agrees to take you downriver for free.">

<ROOM STORY332
	(DESC "332")
	(STORY TEXT332)
	(CONTINUE STORY355)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT333 "Lifting the pitcher, you are horrified to see a second head on the woman's shoulder. It has a long lank hair, white skin and ghastly black lips. As you stifle a gasp of horror, its eyes snap open and it gives a chilling screech. The woman's arms lash out like a sleepwalker's dashing you backwards with astonishing strength.">

<ROOM STORY333
	(DESC "333")
	(STORY TEXT333)
	(PRECHOICE STORY333-PRECHOICE)
	(CONTINUE STORY104)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY333-PRECHOICE ()
	<TEST-IMMORTALITY 1 ,DIED-FROM-INJURIES ,STORY333>>

<CONSTANT TEXT334 "The monster is impervious to your blows. More strands of long black hair wrap themselves around you. It is like fighting an octopus. You can do nothing to prevent it dragging itself closer until finally its jaws close on your windpipe. You feel yourself weakening, and then there is a crunching of cartilage and a pink spray of blood. Your blood.">

<ROOM STORY334
	(DESC "334")
	(STORY TEXT334)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT335 "\"You seek to enter the underworld,\" says the spirit. \"The way will not be easy. But I perceive your cause to be honourable, so I shall aid you.\"||You do not dare to answer. He goes on: \"You must place a jade bead under your tongue and keep it there until you reach the four paths, not speaking whatever the temptation. Once you are at the four paths, you may remove the bead from your mouth but you should retain it until you see a kapok tree. Before any of this you must cross Death Canyon, however. If you have no other option, seek the dragon Kawak who lies across the canyon with one of his two heads on either side. Others have passed through his jaws and emerged at the far end, and if you are dauntless you may be able to do this too.\"||There is deep silence after he finishes speaking. You wait with lowered gaze. It is not seemly to look upon even a living king unless invited to. Suddenly there is a flash and an immediate peal of thunder, followed by a deluge of heavy tropical rain.||You look up. King Sky Shield and the phantom snake have vanished, but the shrine is not as it was before. Now a pit has opened in the floor, revealing stairs down into the pyramid. It is your route to the underworld.">
<CONSTANT CHOICES335 <LTABLE "venture down the steps" "leave the shrine and wait until morning to resume your journey overland to Ashaka" "downriver to the coast">>

<ROOM STORY335
	(DESC "335")
	(STORY TEXT335)
	(CHOICES CHOICES335)
	(DESTINATIONS <LTABLE STORY009 STORY008 STORY030>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT336 "You reach the end of the tunnel and emerge into the open under a bright blue sky. The sun of the upper world blazes high in the heavens -- a welcome change from the grey glare permeating the Deathlands, although you know that too long an exposure to its blistering rays may eventually leave you weak with thirst. Waves of heat rise around you off the baking sands of the great desert. Dunes stretch like the tops of clouds as far as the eye can see.||Near by, you see various items poking up out of the sand. They may be the grave goods of spirits who descended here to the Deathlands. A closer inspection uncovers a sword, a waterskin, and a copper-tipped spear.">

<ROOM STORY336
	(DESC "336")
	(STORY TEXT336)
	(PRECHOICE STORY336-PRECHOICE)
	(CONTINUE STORY152)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY336-PRECHOICE ()
	<SELECT-FROM-LIST <LTABLE SWORD WATERSKIN SPEAR> 3 3>>

<ROOM STORY337
	(DESC "337")
	(EVENTS STORY337-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY337-EVENTS ()
	<COND (<CHECK-ITEM ,SPEAR>
		<RETURN ,STORY429>
	)(<CHECK-SKILL ,SKILL-AGILITY>
		<RETURN ,STORY222>
	)>
	<RETURN ,STORY402>>

<CONSTANT TEXT338 "You step up to the edge of the pit. The smoke rising off the coals at the bottom is thick and choking. You can feel the waves of heat simmering up on the still air. The pit is not deep, but even so you would not relish falling in!">
<CONSTANT CHOICES338 <LTABLE "use" "a" "or a" "otherwise">>

<ROOM STORY338
	(DESC "338")
	(STORY TEXT338)
	(CHOICES CHOICES338)
	(DESTINATIONS <LTABLE STORY016 STORY039 STORY039 STORY063>)
	(REQUIREMENTS <LTABLE SKILL-AGILITY BLOWGUN SPEAR NONE>)
	(TYPES <LTABLE R-SKILL R-LOSE-ITEM R-LOSE-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT339 "You find yourself in a narrow chamber. The air of the tomb is thick with the smell of old incense. In the faint light shining in from outside, you see an upright sarcophagus set against the far wall. Stylized features moulded into the sarcophagus lid suggest a woman in the raiment of a priestess. Then you notice that in her arms she carries two newborn children.||Curiosity gets the better of you. Dislodging the lid, you strain with all your strength and finally succeed in dragging it open. For an instant the face of a beautiful woman stares out at you, and you give a startled cry. She has two little children in her arms. All three seem only asleep, but then the air you have allowed into the sarcophagus unlocks the closed gates of time. The bodies cave in and crumble to dust in front of your eyes.">
<CONSTANT CHOICES339 <LTABLE "loot the contents of the sarcophagus" "you had better climb back down to the canoe before the two demons get fed up with waiting">>

<ROOM STORY339
	(DESC "339")
	(STORY TEXT339)
	(CHOICES CHOICES339)
	(DESTINATIONS <LTABLE STORY427 STORY167>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT CHOICES340 <LTABLE "use a" "or the" "a wand" "otherwise">>

<ROOM STORY340
	(DESC "340")
	(PRECHOICE STORY340-PRECHOICE)
	(CHOICES CHOICES340)
	(DESTINATIONS <LTABLE STORY404 STORY422 STORY018 STORY384>)
	(REQUIREMENTS <LTABLE GOLD-DIADEM CHALICE-OF-LIFE SKILL-SPELLS NONE>)
	(TYPES <LTABLE R-ITEM R-ITEM R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY340-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-ANGEL>
		<SET-DESTINATION ,STORY340 4 ,STORY363>
	)(ELSE
		<SET-DESTINATION ,STORY340 4 ,STORY384>
	)>>

<CONSTANT TEXT341 "Without warning, the shadow creature suddenly stops dead and throws his leg out to trip you. You are taken by surprise, since no human opponent could act so fast.">
<CONSTANT TEXT341-AGILE "You jump over his leg and whirl around, managing to block his attempt at scoring">
<CONSTANT TEXT341-SCORE "He deflects the ball into the low-score zone">

<ROOM STORY341
	(DESC "341")
	(STORY TEXT341)
	(PRECHOICE STORY341-PRECHOICE)
	(CONTINUE STORY066)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY341-PRECHOICE ()
	<CRLF>
	<COND (<CHECK-SKILL ,SKILL-AGILITY>
		<TELL ,TEXT341-AGILE>
		<TELL ,PERIOD-CR>
	)(ELSE
		<TELL ,TEXT341-SCORE>
		<TELL ,PERIOD-CR>
		<SCORE-POINTS 1 ,FOES>
	)>>

<CONSTANT TEXT342 "You have defeated the sorcerer. His monstrous body topples onto the steps of his black pyramid and begins to seethe with putrid vapours. With the magic that sustained him unnaturally throughout the centuries now broken, Necklace of Skulls decomposes into dank grey dust.||The walls of the palace begin to stir. You can feel the ground trembling underfoot. You hurry back through the courtyard and out of the gates. After a dozen pace you cannot resist the urge to look back. The pyramid and surrounding buildings are sinking into the sand. In minutes they have vanished entirely, and there is no sign to show that this was the spot where Necklace of Skulls once dwelt among his bestial courtiers. You look around for the courtiers, but see only a pack of malnourished dogs slinking off amid the dunes.||It is over. You turn your face to the east. You have a long journey back to civilization. If only you had been able to save your brother...||You dismiss such thoughts with a shrug. It is too late for regrets. At least you avenged Morning Star's death and rid the world of an evil monster.||One of the dogs gives a howl. You look round, into the glowering darkness along the western horizon that marks the boundary of the Deathlands. That is where your brother is now.||You look east, then west again. Civilization -- or further adventure? Only you can decide which way your destiny beckons. This quest is ended, but perhaps further adventures still await you? The only limit is your own imagination.">

<ROOM STORY342
	(DESC "342")
	(STORY TEXT342)
	(VICTORY T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT343 "You sail on until the sight of circling gulls tells you that land is near. You know that it cannot be mainland. As a green swathe of foliage appears in the distance you realize you have found the fabled Isle of the Iguana.||Getting closer, you find a coast of high cliffs which the sea has pounded into fanciful shapes. You sail under an arch of white rock and around a headland that reminds you of a serpent's mouth, arriving at last at a stretch of pebble-strewn beach.||\"We must be virtually due east of Tahil,\" you announce. \"Certainly by sailing with the rising sun at our back we'd soon reach the mainland.\" But even as you are saying this, your eyes are scanning the shore with avid curiosity.">
<CONSTANT CHOICES343 <LTABLE "put in at the island" "sail on to Tahil">>

<ROOM STORY343
	(DESC "343")
	(STORY TEXT343)
	(CHOICES CHOICES343)
	(DESTINATIONS <LTABLE STORY366 STORY300>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT344 "Cool shade embraces you as you step into the shop's interior. Your eyes adjust to the darkness. You call for service. A man rouses himself from his siesta and comes forward, blinking sleepily at you where you stand in the sunlit doorway as though you were a spirit that had emerged from the afterlife.||\"I am journeying into the desert,\" you announce, to his obvious amazement. \"I'll need supplies.\"||He shows you the few items he has for sale in this impoverished town.">

<ROOM STORY344
	(DESC "344")
	(STORY TEXT344)
	(PRECHOICE STORY344-PRECHOICE)
	(CONTINUE STORY325)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY344-PRECHOICE ()
	<MERCHANT <LTABLE WATERSKIN MAGIC-WAND FLINT-KNIFE BLOWGUN BLANKET> <LTABLE 4 16 1 3 2>>>

<CONSTANT TEXT345 "The invisible demons of the desert are known to harness whirlwinds, which they ride pell-mell across the sand. It is said that on nights of the full moon they can even be seen crouched atop their captive whirlwinds -- translucent unhuman figures with their faces raised shrieking to the sky.||The moon is not full tonight, and you are glad. You have no wish to see these monsters. Your only desire is to get rid of them, and to do that you must exploit their one weakness: once in full pursuit of a victim, they cannot veer quickly off a straight line.">

<ROOM STORY345
	(DESC "345")
	(STORY TEXT345)
	(CONTINUE STORY137)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT346 "The high priest looks disappointed, but seems to understand when you explain that you have barely enough to purchase the supplies you will need for the journey.||\"A coil of rope might not be a bad idea,\" he suggests. \"I've often found the rope to come in handy. Oh, and a decent sword of course -- assuming you know how to use one.\" He juggles the heavy rubber ball he's carrying from one hand to the other. \"What about a practice session in the arena before you head off?\"">
<CONSTANT CHOICES346 <LTABLE "practice the ball contest with him" "get on with preparations for your journey">>

<ROOM STORY346
	(DESC "346")
	(STORY TEXT346)
	(CHOICES CHOICES346)
	(DESTINATIONS <LTABLE STORY368 STORY093>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT347 "No sooner have you released your tight grip on the shawl than it is snatched away. There is a whispered cry of exultation from all around. You have your only clear view of the stabaie as they shoot off into the distance like flickers of silent lightning, to be swallowed up by the gloom of the forest within moments. Silence fills the glade, and you realize you are alone in the heart of the wood.">

<ROOM STORY347
	(DESC "347")
	(STORY TEXT347)
	(PRECHOICE STORY347-PRECHOICE)
	(CONTINUE STORY324)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY347-PRECHOICE ()
	<LOSE-ITEM ,SHAWL>>

<CONSTANT TEXT348 "You come to a huge buttress which at first you mistake for a cliff. Only when you get closer do you see what it truly is, and the realization draws a gasp from your lips: \"A tree!\" A tree whose trunk is as thick and solid as a temple-pyramid. You look up. You cannot see the upper branches. It stretches right through the forest canopy, dwarfing even the biggest trees, seeming to reach right up through the clouds.||You know what it is. It can only be the World Tree, which according to fable supports the heavens. Awestruck, you reach out and touch it, discovering that the bark is tingling. It is alive with the rhythms of life throughout the world.||You rest under the World Tree for a while. It fills you with a sense of joy to be so close to the roots of all existence, stronger and more confident than before. Now there is no peril that seems too daunting for you to face.">

<ROOM STORY348
	(DESC "348")
	(STORY TEXT348)
	(PRECHOICE STORY348-PRECHOICE)
	(CONTINUE STORY412)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY348-PRECHOICE ()
	<RESTORE-VITALITY>>

<CONSTANT TEXT349 "Lord Skull rocks his bulbous head and gives a groan of distress at being greeted incorrectly. Etiquette is obviously very important to these demons, because he also clouts you hard across the eyes as punishment. You reel back stunned, waiting for your vision to clear. It does so only partially: you can still sea, but not so clearly as before.||You retreat sullenly out of the sentinel's presence. The curse he has laid on you makes no difference. You have sworn to avenge your brother, and nothing short of death will stop you.">

<ROOM STORY349
	(DESC "349")
	(STORY TEXT349)
	(PRECHOICE STORY349-PRECHOICE)
	(CONTINUE STORY336)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY349-PRECHOICE ()
	<LOSE-SKILL ,SKILL-TARGETING>
	<DELETE-CODEWORD ,CODEWORD-POKTAPOK>>

<CONSTANT TEXT350 "You get your first glimpse of Yashuna on the afternoon of the following day. Like Koba, the tall temple pyramids of the city are visible for miles across the rolling countryside. As you approach the poorer dwellings at the outskirts of the city, you notice a large number of people milling towards the raised central complex which houses the temples and the palaces of the rich.||It seems to be market day.">
<CONSTANT CHOICES350 <LTABLE "pay a visit to the market" "head north out of the city" "take the southern road towards the forest">>

<ROOM STORY350
	(DESC "350")
	(STORY TEXT350)
	(CHOICES CHOICES350)
	(DESTINATIONS <LTABLE STORY142 STORY120 STORY165>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT351 "The Man of Gold comes to life in your hands and jumps down to the ground. You have no need to explain your needs -- after one glance at the small-creatures, the little golden manikin leaps to the attack. His sharp blows crack their shells with ease and soon a path is cleared along the tunnel for you to dash back to the waiting canoe.">

<ROOM STORY351
	(DESC "351")
	(STORY TEXT351)
	(PRECHOICE STORY351-PRECHOICE)
	(CONTINUE STORY258)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY351-PRECHOICE ()
	<LOSE-ITEM ,MAN-OF-GOLD>>

<CONSTANT TEXT352 "You drop low as the cobra comes sailing through the air. It passes over your head, jaw snapping just inches from your flesh. Instinct warns you that the slightest scratch from those long curved fangs would spell your death. You pivot on your heel as the cobra swings gracefully to hover out off the ledge, readying itself for another attack.||A single short puff sends a lethal dart deep into the cobra's head. You watch it drop into the river below. The demons in the canoe, seeing it fall, nod up at you with witless grins of encouragement.">
<CONSTANT TEXT352-LOST "You realize that you have lost the jade bead. You check the blowgun but it is not there. You must have blown it out along with the dart!">
<CONSTANT TEXT352-CONTINUED "The tomb yawns open beside you. Having so nearly died at the fangs of its guardian, you decide you might as well take a look inside. Perhaps there will be some treasures worth taking">

<ROOM STORY352
	(DESC "352")
	(STORY TEXT352)
	(PRECHOICE STORY352-PRECHOICE)
	(CONTINUE STORY339)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY352-PRECHOICE ()
	<CRLF>
	<COND (<CHECK-ITEM ,JADE-BEAD>
		<TELL ,TEXT352-LOST>
		<TELL ,PERIOD-CR>
		<LOSE-ITEM ,JADE-BEAD>
		<CRLF>
	)>
	<TELL ,TEXT352-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT353 "He opens a vein in the back of your hand using his long sharp fingernails, then laps eagerly at the blood. His tongue is rough and rasping at first, but soon the discomfort and the stinging of the wound begin to fade. You guess that there is something in his saliva that has a numbing effect.">
<CONSTANT TEXT353-CONTINUED "The dwarf wipes his mouth fastidiously and gets to his feet. Once he is standing up he looks even more peculiar. Because of his stunted legs, his arms trail right down to the ground. \"You are most charitable,\" he says, grinning to reveal a snagged array of sharp little teeth. \"Rest assured that I'm not one to forget my obligations. Until we meet again, farewell!\"||So saying, he spreads his arms wide and executes a remarkable leap that carries him right over your head. His cloak flutters like a sail in the wind. Whirling around, you seen no sign of him in any direction. When you gaze up, there is just a distant black shape flying off into the grey sky.">

<ROOM STORY353
	(DESC "353")
	(STORY TEXT353)
	(PRECHOICE STORY353-PRECHOICE)
	(CONTINUE STORY373)
	(CODEWORD CODEWORD-ZOTZ)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY353-PRECHOICE ()
	<TEST-IMMORTALITY 1 ,DIED-GREW-WEAKER ,STORY353>
	<IF-ALIVE TEXT353-CONTINUED>>

<CONSTANT TEXT354 "The wall around the royal precinct is constructed of closely fitted blocks of smooth limestone. The builders even bowed it out slightly to make it more difficult to climb. You loiter casually at a corner until there is no one in sight, then brace yourself around the bend in the wall and pull yourself up.||The top of the wall tapers to a wedge which is rimmed with spikes of sharp obsidian, provoking a grin of admiration from you for the ingenuity of the royal architects. But none of these measures is enough to deter you. Swinging into a cartwheel, you vault over the top of the wall without touching the razor-edge of obsidian, dropping lightly to your feet on the other side.||A glance towards the gate confirms that the guards heard nothing: they are still gazing stolidly into the street outside. You slink away in the twilight and climb the steps of the pyramid.">

<ROOM STORY354
	(DESC "354")
	(STORY TEXT354)
	(CONTINUE STORY415)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT355 "You spend a couple of pleasant days on the river, with nothing to do but watch the green banks slide past while you trail your fingers in the water and swap stories with the fenman. Like most people who travel widely, he has a fund of folktales with which to regale you.||\"I have enjoyed having you along,\" he says as he ties up his boat at a village, \"but now we have arrived at my home. The coast is only a few days' walk -- just follow the road which leads along the riverbank, and may the God of the Pole Star guide you safely on your quest.\"||\"Thank you,\" you reply, \"and may the God of the River see that you find good fortune in your business.\"||You have gone only a short distance when he calls out after you. \"Incidentally I should warn you that the fens are infested with nightcrawlers. I take it you know how to deal with such creatures?\"">
<CONSTANT CHOICES355 <LTABLE "assure him that you are wise to such magical menaces" "perhaps you had better ask him to explain further">>

<ROOM STORY355
	(DESC "355")
	(STORY TEXT355)
	(CHOICES CHOICES355)
	(DESTINATIONS <LTABLE STORY264 STORY172>)
	(REQUIREMENTS <LTABLE SKILL-FOLKLORE NONE>)
	(TYPES <LTABLE R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT356 "You walk on until overtaken by nightfall and exhaustion. Sitting down under the spreading foliage of a calabash tree, you consider looking for a more comfortable place to spend the night. You have passed a few peasant huts among the canals lining your route, but at the moment you cannot see any glimmers of lamplight to indicate habitation. Since it is a warm and sultry night, you decide to sleep out in the open.||You are woken by something heavy falling on your shoulder. It is pitch dark. Your heart is thudding, your nerves taught with unreasoning fear. You hear a slurping sound and turn your head. A horrible inhuman face is pressed up close to yours. Its lips are slick with your blood, but that is not the worst of it. You see that the monstrous head is sprouting from your own shoulder, and then you start to scream.||You have come to a grisly end.">

<ROOM STORY356
	(DESC "356")
	(STORY TEXT356)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT357 "The head is unable to take control of you. Repulsed, it falls back with a snarl of icy rage. The enmeshing strands of hair go slack, but at best you have only a moment's respite before it resumes its attack.">
<CONSTANT CHOICES357 <LTABLE "strike it with your fist" "dash it against the trunk of the nearest tree">>

<ROOM STORY357
	(DESC "357")
	(STORY TEXT357)
	(CHOICES CHOICES357)
	(DESTINATIONS <LTABLE STORY334 STORY378>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT358 "A knot unties itself and one of the gates swing open. No sooner have you gone through than it closes behind you. You proceed along a short tunnel to a chamber which is open on the far side, giving onto a ledge overlooking a river of foaming blood. You step out onto the ledge and look downriver. There is another ledge corresponding to the other doorway, and there you see the feather-robed noble who got here before you.||He points to two obsidian beams spanning the river to the far bank. At first you think they are bridges, but then you notice the shape. They are wedge-shaped, coming to a sharp edge on the upper surface. \"It would be difficult to keep one's balance on that,\" you call out to him.||\"That isn't the intention,\" says the noble. He holds up a pole with a hook on the end. \"I found this here on the ledge. Notice that there is a similar pole next to you.\"||You glance down. A pole like the one the noble is holding rests against the wall, and you pick it up.||\"You have a plan?\" you ask him.||He nods. \"If we extend our arms, we'll be able to hook the poles together. Then, leaning away from each other with our feet on the sloping outer surfaces of the obsidian beams, we'll be able to cross together.\"||The plan is ingenious. You agree to put it to the test, and by this means you are both able to get across the river of the blood to the far bank.">

<ROOM STORY358
	(DESC "358")
	(STORY TEXT358)
	(PRECHOICE STORY358-PRECHOICE)
	(CONTINUE STORY399)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY358-PRECHOICE ()
	<COND (<NOT <KEEP-ITEM ,POLE>> <LOSE-ITEM ,POLE>)>>

<CONSTANT TEXT359 "He listens to your greeting and gives a curt regal nod before waving you on towards the next sentinel. This one rubs his jaw as he looks at you. Then you notice with a shudder that his lower jaw is a bare of skin -- just a raw glistening mass of sinew and tendon. His eyes are like the gulf of stars on a cloudless night. How will you address him:">
<CONSTANT CHOICES359 <LTABLE "address him: as Lord Thunderbolt Laughter" "Lord Blood" "Lord Skull">>

<ROOM STORY359
	(DESC "359")
	(STORY TEXT359)
	(CHOICES CHOICES359)
	(DESTINATIONS <LTABLE STORY037 STORY061 STORY107>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT360 "You reach the slope of the dune and stumble as you try to retreat up it. The hydra's nearest head gives a triumphant hiss and lances down towards you as you lie helpless.">
<CONSTANT TEXT360-CHARMS "You are lucky enough to have got a handful of sand which you throw in its face buying you the time to scrabble away unscathed">
<CONSTANT TEXT360-BITE "Its bite inflicts some damage">
<CONSTANT TEXT360-CONTINUED "You have no recourse but to attack now">

<ROOM STORY360
	(DESC "360")
	(STORY TEXT360)
	(PRECHOICE STORY360-PRECHOICE)
	(CONTINUE STORY402)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY360-PRECHOICE ()
	<CRLF>
	<COND (<CHECK-SKILL ,SKILL-CHARMS>
		<TELL ,TEXT360-CHARMS>
		<TELL ,PERIOD-CR>
		<PREVENT-DEATH ,STORY360>
	)(ELSE
		<TELL ,TEXT360-BITE>
		<TELL ,PERIOD-CR>
		<TEST-IMMORTALITY 2 ,DIED-GREW-WEAKER ,STORY360>
	)>
	<COND (<IS-ALIVE>
		<CRLF>
		<TELL ,TEXT360-CONTINUED>
		<TELL ,PERIOD-CR>
		<COND (<OR <CHECK-SKILL ,SKILL-SWORDPLAY> <CHECK-ITEM ,FLINT-KNIFE> <CHECK-ITEM ,SPEAR>> <STORY-JUMP ,STORY429>)>
	)>>

<CONSTANT TEXT361 "You advance into the passage and start to examine the perplexing structure of wooden beams. The trick is to clear enough of them out of the way so as to be able to get past, but without bringing the whole passage down on top of you. It is like a child's puzzle, only this is a puzzle with a deadly twist.||You select one of the beams and dislodge it. As you haul it out of position, there is a crack and a thin trickle of plaster dust sifts down from the roof of the passage. You look up in alarm, heart skipping a beat, but the roof holds. This time">
<CONSTANT CHOICES361 <LTABLE "use" "a wand" "perhaps you could try using the" "otherwise">>

<ROOM STORY361
	(DESC "361")
	(STORY TEXT361)
	(CHOICES CHOICES361)
	(DESTINATIONS <LTABLE STORY086 STORY109 STORY131 STORY154>)
	(REQUIREMENTS <LTABLE SKILL-ROGUERY SKILL-SPELLS MAN-OF-GOLD NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT362 "The albino hound is so intent on reaching you and closing its jaws on your windpipe that it does not realize you are luring it back into the open. The moment it rushes out under the colonnade, the sunshine forces it to screw up its weak eyes. When you see it is dazzled, you feel more confident about closing in to do battle.">
<CONSTANT TEXT362-CONTINUED "You finally manage to force the hound down with your foot on its throat and administer the death-blow. Then you make your way along the passage it was guarding to the inner courtyard, where you find the courtiers already waiting for you. The chief courtier looks at you with a surprise, as though he did not expect you to win through.||\"About your cousin --\"||\"Yes?\" he says, peering back along the tunnel with a puzzled frown.||\"He's dog meat.\"">

<ROOM STORY362
	(DESC "362")
	(STORY TEXT362)
	(PRECHOICE STORY362-PRECHOICE)
	(CONTINUE STORY431)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY362-PRECHOICE ("AUX" (DAMAGE 3))
	<COND (<CHECK-SKILL ,SKILL-SWORDPLAY>
		<SET DAMAGE 1>
	)(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
		<SET DAMAGE 2>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY362>
	<IF-ALIVE TEXT362-CONTINUED>>

<CONSTANT TEXT363 "The ball contest requires two participants on each side. \"Am I to face this challenge alone?\" you cry out angrily.||Necklace of Skulls' voice rustles from the depths of his shrine. It sounds like a whisper, but is loud enough to carry right along the arena. \"The man you befriended on the journey here. He shall fight beside you.\"||Hearing a footstep behind you, you glance back to see Stooping Eagle approaching through the skeletal gate. \"Evening Star!\" he says, glad to see that you too have survived the ordeals set by the courtiers. He touches his sword. \"Where is the wizard? I am eager to see if his blood is red and clean like other men's, or flows like foul sewage!\"||You gesture to the pyramid at the far end of the arena. \"He awaits us there. But first we must prove ourselves in the contest.\"||He nods and leans closer to whisper in your ear. \"I know something of the strategy of the ball contest. Begin boldly so as to unsettle your opponents, then allow their leading player past you and drive deep towards the enemy defence.\"||\"Well,\" you say with a shrug, \"it's as good a plan as any.\"">

<ROOM STORY363
	(DESC "363")
	(STORY TEXT363)
	(CONTINUE STORY042)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT364 "Your partner darts forward and succeeds in intercepting the ball. You see that he cannot keep possession for long with the enemy attacking player dogging his every move. \"Send it over here!\" you yell at him.">

<ROOM STORY364
	(DESC "364")
	(STORY TEXT364)
	(PRECHOICE STORY364-PRECHOICE)
	(CONTINUE STORY423)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY364-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-SHADE>
		<STORY-JUMP ,STORY385>
	)(<CHECK-CODEWORD ,CODEWORD-ANGEL>
		<STORY-JUMP ,STORY405>
	)>>

<CONSTANT TEXT365 "Leaving the battle behind, you hurry on until the stars begin to drown in the limpid haze heralding a new day. As the sun's heat grows stifling, you find shelter beneath a sand-blasted spar of rock where you rest until night comes again. Then you gather your belongings and set out again by moonlight. Your mouth feels as dry as the endless wastes surrounding you.">

<ROOM STORY365
	(DESC "365")
	(STORY TEXT365)
	(PRECHOICE STORY365-PRECHOICE)
	(CONTINUE STORY438)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY365-PRECHOICE ()
	<COND (<CHECK-ITEM ,WATERSKIN> <STORY-JUMP ,STORY303>)>>

<CONSTANT TEXT366 "Cowering under the trees at the back of the beach you find a very old man. His clothing is ragged, but the few scraps of adornment that he retains indicate a person of wealth and prestige. This impression is confirmed when he opens his mouth, saying, \"If you have come to kill me, I pray that you do so quickly, at least.\"||\"We haven't come to kill you,\" you reply, extending your hand in friendship.||He returns a hopeful smile. \"I am Jade Thunder, once a great wizard. A contest with my arch-rival brought me to this desolate spot, and here we fought our last battle. I slew him, but with his dying breath he sealed my wand within a barrier of fire and now I cannot use my magic to return home.\"||You go with him to a spot further up the beach. Great magic has obviously been at work here, impossibly warping the trees and leaving the coconuts with silent staring faces. The sand underfoot has a dozen colours. In the centre of the clearing, a circle of crackling green flame surrounds a wand.||To help Jade recover his wand:">
<CONSTANT CHOICES366 <LTABLE "try" "cast spells with your own wand" "use the" "just walk boldly into the flames" "decide against helping him">>

<ROOM STORY366
	(DESC "366")
	(STORY TEXT366)
	(CHOICES CHOICES366)
	(DESTINATIONS <LTABLE STORY021 STORY435 STORY045 STORY068 STORY437>)
	(REQUIREMENTS <LTABLE SKILL-CUNNING SKILL-SPELLS MAN-OF-GOLD NONE NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-ITEM R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT367 "\"In times gone by, heretics and madmen were cast out from the town by this gate,\" says one of the guards. \"As they went, some would scratch pictures of what they expected to find in the far west.\"||\"That's why it's called the Gate of Exiles,\" says the other man. \"I reckon you must be one of the few people who've taken this route by choice.\"||\"I didn't have a choice,\" you say.||Taking up your pack, you walk out into the waiting desert.">

<ROOM STORY367
	(DESC "367")
	(STORY TEXT367)
	(CONTINUE STORY407)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT368 "He flings the the ball against the slanting wall of the arena and it bounces towards you.. Leaping up with all your strength, you manage to strike it a glancing blow with your arm. A moment of stinging pain is followed by numbness, and the ball thuds to the court at your feet.||\"No, no!\" says the priest, stepping forward to retrieve the ball. \"You have to judge the angle of impact perfectly, otherwise you end up bruised and the ball goes nowhere.\"||He demonstrates, swinging his hips for momentum a she slams his muscular forearm against the ball. It goes careering across the arena to ricochet off the side wall. This time you manage to intercept it, sending it skidding back along the slant of the wall towards the priest.||\"You've got the hang of it now,\" he says some time later, leaning on his knees to get his breath back. \"The object is to keep the ball from touching the ground. It represents the sun, you see, so it has to stay aloft or else it's 'eclipse', meaning you lose a point.\"||You toss the ball up and catch it, enjoying the contest now you know more about it. \"And what about the stone rings at the top of the wall?\"||\"Ah!\" says the priest. \"If you can get the ball through the ring then you've scored a 'sunrise' and you win outright. But it's not easy as it looks, believe me.\"||You stare up at the ring. It is tree man-heights off the ground and barely wider than the ball itself. \"But it doesn't look at all easy!\"||The priest grins. \"Precisely.\"||It is now getting late. Thanking the priest, you make your way back home. Tomorrow you will set out in search of your brother.">

<ROOM STORY368
	(DESC "368")
	(STORY TEXT368)
	(CONTINUE STORY389)
	(CODEWORD CODEWORD-POKTAPOK)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT369 "You make a great show of folding the shawl and tucking it tightly under your arm. \"You've lured me far off the beaten track and caused me to inhale an insect!\" you say aloud, feeling somewhat foolish since you cannot see the creatures you are addressing.||\"Merely a prank,\" says the eerie voice at your shoulder. \"Give us back our shawl, and we'll lead you back to the path without delay.\"||\"Better yet,\" offers another of the stabai, \"we know of a great treasure hidden near by. If we take you to it, will you return the shawl?\"||You know better than to hand the shawl back before they have completed their part of any bargain. Even then, it might be wise to retain it in case they try to cause you further trouble. You decide to make no firm promises for now.">
<CONSTANT CHOICES369 <LTABLE "ask them to show you the treasure" "insist on being led back to the trail you were following before">>

<ROOM STORY369
	(DESC "369")
	(STORY TEXT369)
	(CHOICES CHOICES369)
	(DESTINATIONS <LTABLE STORY409 STORY390>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT370 "Midnight Bloom proves to be a briskly efficient young woman with a vivacious smile. A jade necklace inlaid with flecks of gold sets off her deep coppery tan to good effect. She reads the letter given to you by the Matriarch and nods, saying, \"Many traders are reluctant to go as far as Tahil now, because the collapse of the Great City has left bands of brigands roaming unchecked in the region. But luckily I shall be sailing there in a week's time, to tie up some loose ends in the clan's business.\"||You spend a restful week in Balak at the house of your relatives here.">
<CONSTANT TEXT370-CONTINUED "At last Midnight Bloom comes to tell you that preparations are complete. Tomorrow you set sail for Tahil">

<ROOM STORY370
	(DESC "370")
	(STORY TEXT370)
	(PRECHOICE STORY370-PRECHOICE)
	(CONTINUE STORY182)
	(CODEWORD CODEWORD-SAKBE)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY370-PRECHOICE ()
	<RESTORE-VITALITY>
	<CRLF>
	<TELL ,TEXT370-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT371 "There is a gasp form the crowd as they watch you jump over the edge. You know you must act quickly. Pulling off the helmet as you tumble down, you hug it against you an instant before the lake surface comes rushing up, driving the air out of your lungs with its chilling embrace. You are surrounded by silence and watery gloom. The weight of gold drags you down, but you have managed to trap a pocket of air inside the helmet and you use this to breathe while unfastening the straps of the regalia. All the air is used up by the time you struggle free, and a red haze swims in front of your vision as you kick up towards the surface.||You reach fresh air to discover you are no longer at the bottom of the well. Instead of open sky, a cavern roof stretches overhead. A ghostly grey light emanates out of nowhere. Trudging up onto a a rocky ledge, you hear the sound of oars. A canoe is approaching. As it takes shape out of the shadows, you get a good look at the two occupants. They are like nothing you have ever seen outside your night-mares. Now you know you truly have plunged into the fabled river that leads between the world of the living and the world of the dead.">

<ROOM STORY371
	(DESC "371")
	(STORY TEXT371)
	(CONTINUE STORY097)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT372 "Ripping open the packet, you scatter a handful of salt into the face of the closes snail-creature. It emits a ghastly whining cry and pulls back into its shell as the salt stings its sensitive flesh like acid.||You advance, casting more salt at any of the creatures that are bold enough to try to stop you. It is hard going, for they are clustered thickly in the tunnel and you are shuddering with terror by now, but at last you reach the canoe. Scattering the last of the salt back to deter pursuers, you jump into the canoe and gesture for the demonic oarsmen to cast off.">

<ROOM STORY372
	(DESC "372")
	(STORY TEXT372)
	(PRECHOICE STORY372-PRECHOICE)
	(CONTINUE STORY258)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY372-PRECHOICE ()
	<LOSE-ITEM ,PARCEL-OF-SALT>>

<CONSTANT TEXT373 "You continue westwards, trudging beneath the living world on a journey that will carry you to the lower reaches of the Deathlands. Any attempt to contemplate your bizarre situation threatens to bring on an attack of claustrophobic panic, so you try to think only of your quest for Morning Star. You swear you'll give that wizard cause to rue the day he chose to work his wiles on your brother.||All the light drains out of the sky, leaving a hot sulphurous darkness. A flicker of red light shows as a haze on the horizon, like glowing coals against the blackness. You head towards it.">

<ROOM STORY373
	(DESC "373")
	(STORY TEXT373)
	(CONTINUE STORY080)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT374 "Not far away, down a backstreet close to the palace wall, you find a house with a plump young pig tethered outside. Listening at the window, you hear the occupants of the house rowdily enjoying a few cups of mead. You tiptoe back to the pig and, stifling its squeals, tuck it under your arms before returning to the palace gate. There, crouched out of sight around the corner of a building, you release the pig and give it a shove which carries it towards the guards.||The pig takes a few steps, gives a baffled grunt upon confronting the guards, then bolts past them. \"Grab it, lads!\" cries the guard in high spirits. \"What fine succulent feast it'll make tomorrow, eh?\"||Two or three of the guards go chasing off after the pig, and the others look on laughing at their comrades' antics. You sneak past while their backs are turned and make your way over to the pyramid of the dead king.">

<ROOM STORY374
	(DESC "374")
	(STORY TEXT374)
	(CONTINUE STORY415)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT375 "The cobra hovers in the air, head swaying from side to side with the beat of its strange wings. The wings are lit up by the luminous veins of glassy rock shining from behind it, displaying dark spots which on a normal cobra would be the patterning of its hood. They look like huge black eyes hanging in the gloom.">
<CONSTANT CHOICES375 <LTABLE "lunge forward and strike it at once" "wait until the cobra swoops in and then attempt a counterattack">>

<ROOM STORY375
	(DESC "375")
	(STORY TEXT375)
	(CHOICES CHOICES375)
	(DESTINATIONS <LTABLE STORY122 STORY145>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT376 "He receives your answer with a languid smile. You suddenly have a nasty feeling you have been tricked.">

<ROOM STORY376
	(DESC "376")
	(STORY TEXT376)
	(PRECHOICE STORY376-PRECHOICE)
	(CONTINUE STORY060)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY376-PRECHOICE ()
	<COND (<CHECK-ITEM ,JADE-BEAD> <STORY-JUMP ,STORY056>)>>

<CONSTANT TEXT377 "You hide behind some bushes and wait for the sun to set. As dusk descends, the pitcher tips over to reveal a second head perched on the sleeping woman's shoulder. It has long coiled hair, stark white flesh and a black slit of a mouth. Rolling its eyes, it gives vent to a thin shriek of annoyance at seeing no sign of you. Then its hair flicks out, twisting to form thin legs like a pond-skater's which it braces against the ground before pulling itself off its host's neck with a sucking noise.||You wait until it has gone loping off into the night in search of prey, then look along the river bank until you find what you need: a smooth rock about the size and shape of a head. Using mud to daub some facial features on this, you prop it on the sleeping woman's shoulder and drape it with reeds to resemble hair. Then you go back and hide in the bushes.||Hours pas before the monster returns, prancing out of the darkness on its thin stilt-like legs. On catching sight of another of its kind perched on its own host body, it gives a shriek like an enraged bird and hurls itself forward -- only to fall stunned when it bites hard on the 'interloper' and breaks its teeth. You rush out of cover, snatch up the creature, and stuff pebbles into its bloodied mouth. All it can do is writhe weakly and emit choking noises. You take it to the edge of the river and throw it in, where it sinks without a trace.">

<ROOM STORY377
	(DESC "377")
	(STORY TEXT377)
	(CONTINUE STORY398)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT378 "Grabbing a long hunk of hair, you bunch your muscles and swing the gibbering head around in a swift arc. It strikes the tree with a noise like a melon splitting, and a loathsome torrent of ichor spills out of its broken skull as it drops heavily to the ground. You watch in disgust as its eyes roll up and it gives a last fetid gasp. The twitching tresses shrivel before your eyes, and the head withers rapidly to a desiccated lifeless shell.">

<ROOM STORY378
	(DESC "378")
	(STORY TEXT378)
	(PRECHOICE STORY378-PRECHOICE)
	(CONTINUE STORY398)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY378-PRECHOICE ()
	<DELETE-CODEWORD ,CODEWORD-SALVATION>>

<CONSTANT TEXT379 "Legend states that a rich man can only enter the afterlife if led there by a poor man. Judging by his regalia, the figure you saw walking ahead of you was rich, and he evidently did not get rid of his money when he passed the idol or the bowl would not be empty. The sensible thing to do would therefore be to get rid of all your money at this point.">

<ROOM STORY379
	(DESC "379")
	(STORY TEXT379)
	(PRECHOICE STORY379-PRECHOICE)
	(CONTINUE STORY259)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY379-PRECHOICE ()
	<EMPHASIZE "You got rid of all your money">
	<SETG MONEY 0>>

<CONSTANT TEXT380 "No expression shows on the hard mask-like face as you make your genuflection. There is no roar of rage to show he is affronted, nor flash of sullen anger in his eye. He only raises his sceptre slowly, as though to emphasize a point he is about to make .Then, before you have a chance to move, he brings the sceptre swishing down to split your skull open like a melon. It ends suddenly and horribly for you.">

<ROOM STORY380
	(DESC "380")
	(STORY TEXT380)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY381
	(DESC "381")
	(EVENTS STORY381-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY381-EVENTS()
	<COND (<OR <CHECK-ITEM ,SWORD> <CHECK-ITEM ,HAMMER> <CHECK-ITEM ,FLINT-KNIFE>> <RETURN ,STORY429>)>
	<RETURN ,STORY402>>

<CONSTANT TEXT382 "You pause at the archway and look along the passage. It looks deceptively easy -- just half a dozen paces would take you to the far end, where you can see a dusty sun-bleached courtyard.||You take one cautious step. Another. Then there is an ominous creak from the lintel above, and a fine sift of rock dust falls from the passage roof...">

<ROOM STORY382
	(DESC "382")
	(STORY TEXT382)
	(PRECHOICE STORY382-PRECHOICE)
	(CONTINUE STORY224)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY382-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-CHARMS>
		<STORY-JUMP ,STORY177>
	)(<CHECK-SKILL ,SKILL-AGILITY>
		<STORY-JUMP ,STORY201>
	)>>

<CONSTANT TEXT383 "You toss the ball into the hound's open jaws. It immediately crouches down on the ground and starts gnawing at the ball wagging its tail contentedly, and you are able to slip past unchallenged.||The courtiers are waiting for you in the inner courtyard. \"Ah, you fool,\" says the chief with a yelp of crowing laughter. \"You just wasted your best weapon!\"||\"Then I'll just have to try that much harder from now on, won't I?\" you reply.">

<ROOM STORY383
	(DESC "383")
	(STORY TEXT383)
	(PRECHOICE STORY383-PRECHOICE)
	(CONTINUE STORY431)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY383-PRECHOICE ()
	<LOSE-ITEM ,HYDRA-BLOOD-BALL>>

<CONSTANT TEXT384 "The ball contest requires two participants on each side. \"Am I to face these shadow beings alone?\" you cry out angrily.||Necklace of Skulls' voice rushes from the depths of his shrine. It is like a whisper that is somehow loud enough to carry right along the arena. \"You came here seeking your brother. He shall fight beside you.\"||A chill settles in the hot air for an instant. A figure has appeared beside you. You turn, not recognizing him at first. It is Morning Star, but there is a ghastly pallor to his skin and his eyes have a hollow look. His arm is pressed to his forehead in the gesture of the denizens of the Deathlands, who must forever shield their eyes from the glare of the sun beneath the world.||\"Evening Star,\" he says forlornly. \"I am so cold. The grave has scant comforts.\"||You must fight beside the ghost of your brother in a contest to the death.">

<ROOM STORY384
	(DESC "384")
	(STORY TEXT384)
	(CONTINUE STORY042)
	(CODEWORD CODEWORD-SHADE)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT385 "Your brother makes the best shot he can, but he is off balance and the ball goes wide. The enemy defensive player sees a chance and comes rushing in, trying to beat you to the ball.">
<CONSTANT TEXT385-TICKS "You wrest possession from him and score a point.">
<CONSTANT TEXT385-CROSS "He beats you to the ball and scores.">

<ROOM STORY385
	(DESC "385")
	(STORY TEXT385)
	(PRECHOICE STORY385-PRECHOICE)
	(CONTINUE STORY066)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY385-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-POKTAPOK>
		<EMPHASIZE TEXT385-TICKS>
		<SCORE-POINTS 1 ,PLAYER>
	)(ELSE
		<EMPHASIZE TEXT385-CROSS>
		<SCORE-POINTS 1 ,FOES>
	)>>

<CONSTANT TEXT386 "Morning Star lobs the ball directly towards you. Timing your move perfectly, you hug it to your chest while substituting the blood ball.">
<CONSTANT CHOICES386 <LTABLE "go for a standard scoring shot" "else risk everything on putting the ball through the stone ring and winning an instant victory">>

<ROOM STORY386
	(DESC "386")
	(STORY TEXT386)
	(CHOICES CHOICES386)
	(DESTINATIONS <LTABLE STORY405 STORY043>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT387-REPAIR "You repair the boat and set sail">
<CONSTANT TEXT387-HELP "You are stranded unless you risk helping Jade Thunder">
<CONSTANT CHOICES387 <LTABLE "use a wand" "or" "or the" "otherwise">>

<ROOM STORY387
	(DESC "387")
	(PRECHOICE STORY387-PRECHOICE)
	(CHOICES CHOICES387)
	(DESTINATIONS <LTABLE STORY435 STORY021 STORY045 STORY068>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS SKILL-CUNNING MAN-OF-GOLD NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY387-PRECHOICE ()
	<CRLF>
	<COND (<CHECK-SKILL ,SKILL-SEAFARING>
		<TELL "Repair the boat?">
		<COND (<YES?>
			<CRLF>
			<TELL ,TEXT387-REPAIR>
			<TELL ,PERIOD-CR>
			<DELETE-CODEWORD ,CODEWORD-EB>
			<STORY-JUMP ,STORY300>
			<RETURN>
		)>
		<CRLF>
	)>
	<TELL ,TEXT387-HELP>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT388 "\"It is protection against the dust demons,\" explains one of the guards. \"They are invisible sprites who whip up whirlwinds and drive them like ravaging beasts onto those who travel in the desert.\"||You cast a brief glance at the boulder. \"Not much protection, surely? The demons could just steer their whirlwinds around it.\"||\"No,\" says the other man in a tone that suggests they tell this legend to every wayfarer, \"because dust demons can only travel in long straight paths. They can't turn easily.\"||\"Or so the priest Spitting Viper told us,\" chimes in the first man.||Bidding them farewell, you take up your pack and walk out into the waiting desert.">

<ROOM STORY388
	(DESC "388")
	(STORY TEXT388)
	(CONTINUE STORY407)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT389 "You decide to set out early the next morning, before sunrise. This will spare your family from farewells. By lantern light in the chill grey predawn, you stand in the antechamber of your family's house and check your belongings for the journey. You are attended by only one servant, who silently fastens the straps of your pack. Your aunts have left out a parcel of maize cakes for you to eat on the road.||There is a knock on the outer door and the servant darts off to open it. Outside you see your friend the old soothsayer standing in the early twilight. You go out and greet him: \"Good morning. You came just in time to catch me. I'm about to set out.\"||\"I know,\" he says. \"I came to wish you luck. And to give you this. He holds up a jade bead.||You take it with a quizzical smile. \"What's this for?\"||\"There are some who'll tell you that the quickest route to Necklace of Skulls lies through the underworld. It is true, but that way is also fraught with peril and you will need certain safeguards if you hope to pass through in safety. Now, beads such as this are placed under the tongue of deceased nobles for them to use as currency in the afterlife. If you should enter the underworld, be sure to place the bead under your tongue and to keep it there until you reach the crossroads. Got that?\"||\"I suppose so,\" you say, not really following his drift at all. But you pocket the jade bead. As you set out along the road, you pause and glance back, adding, \"You were wrong about the dream. It seems my brother was dead after all.\"||He shrugs. \"Right... wrong... The world isn't quite that simple, Evening Star.\"||Bidding him farewell, you set off towards the edge of the city. Even at this early hour, traders are already carrying their wares to market. Out in the fields, moving shadows in the smoky blue twilight show that the farmers are hard at work. It is strange to think that you might never again see this great city of Koba, which has been your home since childhood.||You turn your gaze to the west, putting such thoughts out of your head. From now on, you must think only of the success of your quest.">

<ROOM STORY389
	(DESC "389")
	(STORY TEXT389)
	(PRECHOICE STORY389-PRECHOICE)
	(CONTINUE STORY025)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY389-PRECHOICE ()
	<TAKE-ITEM ,MAIZE-CAKES>
	<TAKE-ITEM ,JADE-BEAD>>

<CONSTANT TEXT390 "The stabai flicker at the edges of your vision, thin elusive shards of paleness against the green-tinged shadows. They lead you on through silent glades surrounded by trees which stretch endlessly upwards as though supporting the sky. The moist heat of the jungle weighs upon you until you feel like a drowning man. Slogging on through the eerie silence, limbs aching with fatigue, you begin to suspect the stabai are not leading you to safety at all. What if their plan is to entice you deeper and deeper into the woods until you finally drop from hunger and exhaustion?">
<CONSTANT CHOICES390 <LTABLE "dismiss the stabai and try to find your own way back to the trail" "return the shawl in the hope of gaining the stabai's goodwill" "continue to let them guide you">>

<ROOM STORY390
	(DESC "390")
	(STORY TEXT390)
	(CHOICES CHOICES390)
	(DESTINATIONS <LTABLE STORY324 STORY347 STORY168>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT391 "You strike up a conversation with a trader whose boat looks impressively large and seaworthy. He is putting together a cargo of richly dyed cotton and woven feather head-dresses which he hopes to sell in Tahil.||\"Brigands and pirates abound since the fall of the Great City,\" he says. \"These are exciting times we live in. Many prefer to cower in safety close to home, but for a bold man there are fine profits to be made.\"||A few judicious remarks about the weather and the tides convince him that you would be a worthwhile person to have along on the voyage. He tells you to return in a week, when it will be time to set out.">

<ROOM STORY391
	(DESC "391")
	(STORY TEXT391)
	(CONTINUE STORY205)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT392 "You know that your first priority must be to get out of the encumbering golden regalia as soon as you hit the water, otherwise it will drag you down to your doom. Your fingers have already found the straps as you dive off the platform. You hear a moan of awe from the onlookers which is soon snatched away by the rush of wind as you fall. Then you hit the water, and suddenly you are sinking through silent darkness.||Another person might panic, losing precious seconds, but you have been in this kind of scrape before. You made sure to take a good breath of air before going under, and you make use of that now to sustain you while you struggle free of the regalia. Discarding it, you watch it go drifting down until the yellow glints of metal are lost in the murk. It is a priceless treasure, but the loss of it gladdens your heart as you strike up through the cold green water.||Your head breaks the surface and you suck gratefully at the stale air of an underground cavern. There is no flicker of daylight. The sinkhole has vanished, and the only light is now an eldritch grey glow seeping from an unknown source. You guess that you have been carried to the outer fringes of the underworld. Stumbling up onto a pebble-strewn shore, you gaze out into the gloom and see a canoe coming towards you. Your guess is confirmed when you see the oarsmen. They are like no creatures of the mortal realm.">

<ROOM STORY392
	(DESC "392")
	(STORY TEXT392)
	(CONTINUE STORY097)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT393 "You light the firebrand and thrust it straight into the face of the nearest of the creatures -- the one hanging on the rock directly above your head. It throws up its stubby arms with a sickening bleat of anguish and falls, dashing you to the ground and smothering the burning brand. Before you can struggle free and rise to your feet, the rest of the creatures have slithered forward and seized you in their slimy fingers. You try to fight, but there are too many of them. All you can do is scream in panic as they overwhelm you. You have come to a horrible end.">

<ROOM STORY393
	(DESC "393")
	(STORY TEXT393)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT394 "You complete the charm an instant before the cobra strikes. It comes sailing in and closes its jaws on your neck, but you feel barely more than a pinprick as the fangs glance harmlessly off your skin. The charm will keep you safe from its bite while you explore the tomb.">
<CONSTANT TEXT394-JADE "The jade bead fell out of your mouth when you spoke the charm. You are too late to stop it rolling off the ledge and being lost in the water below">

<ROOM STORY394
	(DESC "394")
	(STORY TEXT394)
	(PRECHOICE STORY394-PRECHOICE)
	(CONTINUE STORY339)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY394-PRECHOICE ()
	<COND (<CHECK-ITEM ,JADE-BEAD>
		<CRLF>
		<TELL ,TEXT394-JADE>
		<TELL ,PERIOD-CR>
		<LOSE-ITEM ,JADE-BEAD>
	)>>

<CONSTANT TEXT395 "The little man bites your wrist and sucks at it as though savouring the juice of a plum.">
<CONSTANT TEXT395-CONTINUED "After a short while he looks up. Under the hook of his extraordinary nose, his mouth is curled into a tight smile. \"That's a rare act of kindness for a stranger to do,\" he says in his thin voice, leaping to his tiny feet with miraculous vigour. \"I won't soon forget it, I assure you. Oh, and let me give you a word of advice. Get rid of any money you've got once you reach the crossroads.\"||With that he darts off and is soon lost to view among the rushes. You are left to ponder the meaning of this strange encounter as you continue on your way.">

<ROOM STORY395
	(DESC "395")
	(STORY TEXT395)
	(PRECHOICE STORY395-PRECHOICE)
	(CONTINUE STORY307)
	(CODEWORD CODEWORD-ZAZ)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY395-PRECHOICE ()
	<TEST-IMMORTALITY 1 ,DIED-GREW-WEAKER ,STORY395>
	<IF-ALIVE TEXT395-CONTINUED>>

<CONSTANT TEXT396 "You crouch behind some sacks of grain and wait an hour or so until the streets are completely deserted. A few lights show from the palace windows. Beside the gate, a brazier flares in the night breeze. Other than that it is completely dark. When the moon shows as a misty patch of silver beyond the wooded hills to the east, you put your plan into action.||\"Brr, it's cold suddenly,\" remarks one of the guards at the gate.||One of his companions nods. \"Did you hear something just then?\" He casts a nervous glance over his shoulder. The pyramid-tomb of the dead king looms darkly against the pale halo of moonlight.||\"Now you come to mention it...\" says another, also looking back. Suddenly he gasps, eyes popping out of his head. \"By all the gods!\"||A parade of ghosts descends the steps of the pyramid. Their dead faces are formed on mist and moonbeams, and they move without sound across the courtyard. The guards are brave enough to face any foe of flesh and blood, but the sight of this host of spectres sends icy terror through their veins. Dropping their weapons, they run off into the night.||You watch them go, then step out from your hiding-place. As you cancel your illusion spell, the 'ghosts' dissolve into the darkness. You hurry across to the pyramid before the guards recover enough nerve to come slinking back.">

<ROOM STORY396
	(DESC "396")
	(STORY TEXT396)
	(CONTINUE STORY415)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT397 "Your answer is greeted with a sneer and a hiss of laughter. It occurs to you that you may have been tricked.">

<ROOM STORY397
	(DESC "397")
	(STORY TEXT397)
	(PRECHOICE STORY397-PRECHOICE)
	(CONTINUE STORY060)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY397-PRECHOICE ()
	<COND (<CHECK-ITEM ,JADE-BEAD> <STORY-JUMP ,STORY056>)>>

<CONSTANT TEXT398 "The woman is in a deep trance, but you shake her until she comes out of it. She tells you that she is a sorceress who fell victim to the nightcrawler when she tried to exorcize it from the region. \"I can never repay my debt to you,\" she says, weeping with relief to be free of the noxious creature's control at last. \"When you get to the sea, follow the shore until you come to a giant stone idol which is buried up to its neck in the sand. This is the idol of an ancient god. Tell him the number of stars in the sky and he will speak to you.\"||\"How many stars are there?\"||She smiles. \"Tell him a hundred thousand million and seven. He wouldn't believe the true answer.\"||Bidding the woman farewell, you continue on your way.">

<ROOM STORY398
	(DESC "398")
	(STORY TEXT398)
	(CONTINUE STORY417)
	(CODEWORD CODEWORD-OLMEK)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT399 "The remorseless glare of the unearthly sun dazzles you both, forcing you to shield your eyes. Walking on, you come in sight of a kapok tree whose spreading branches poke up into the roof of water above the underworld. Several figures are resting in its shade.||As you press on towards the tree, you pass a well beside the road. Your companion pauses and fishes in his belt-pouch for a jade bead, which he casts into the well. There is a glint of golden light from the water, and the noble pauses to take a drink.">
<CONSTANT CHOICES399 <LTABLE "do the same" "not">>

<ROOM STORY399
	(DESC "399")
	(STORY TEXT399)
	(CHOICES CHOICES399)
	(DESTINATIONS <LTABLE STORY059 STORY083>)
	(REQUIREMENTS <LTABLE JADE-BEAD NONE>)
	(TYPES <LTABLE R-LOSE-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT400 "You lose your grip on the crumbling bark and go crashing down through the branches.">
<CONSTANT TEXT400-AGILITY "You manage to break your fall by catching a stout strangler root">
<CONSTANT TEXT400-CRASHED "The ground comes up to hit you with a crushing force">
<CONSTANT TEXT400-CONTINUED "Struggling to your feet, you limp away before the creature can descend from its arboreal lair to pursue you. The stabai have flitted away, terrified of the creature's wrath. When you are safely away from the tree, you clean the muck off the diadem and hold it up in a shaft of sunlight. It is a gold circlet of the sort that sometimes adorn the heads of great nobles. Sacred symbols are stamped into the metal and there is a jade inlay in the fourfold shape of the World Tree, the source of life itself in the mythology of your people.">

<ROOM STORY400
	(DESC "400")
	(STORY TEXT400)
	(PRECHOICE STORY400-PRECHOICE)
	(CONTINUE STORY324)
	(ITEM GOLD-DIADEM)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY400-PRECHOICE ("AUX" (DAMAGE 5))
	<CRLF>
	<COND (<CHECK-SKILL ,SKILL-AGILITY>
		<SET DAMAGE 1>
		<TELL ,TEXT400-AGILITY>
	)(ELSE
		<TELL ,TEXT400-CRASHED>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-FROM-INJURIES ,STORY400>
	<IF-ALIVE TEXT400-CONTINUED>>

<CONSTANT TEXT401 "You greet the sentinel by name. He receives your greeting with barely a change in expression. Only in a narrowing of those burning eyes and a drooping of the chiselled lips do you begin to sense your error.||His sceptre flashes out without warning, shattering your breast-bone and drinking through into your heart. Impaled, you give a last spasm before death congeals on your features. You have met your doom.">

<ROOM STORY401
	(DESC "401")
	(STORY TEXT401)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT402 "You have no weapon strong enough to penetrate the monster's scaly hide. Snarling at your impudence in attacking it, it envelops you in its four necks like a ma closing his fist on a gnat. Fangs sharper than flakes of obsidian sink deep into your flesh and it raises your bloody carcass aloft to the night sky with a great shriek of inhuman glee. You sold your life valiantly, but you failed.">

<ROOM STORY402
	(DESC "402")
	(STORY TEXT402)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT403 "The intense fire has burned down to a sullen cindery glow by daybreak. You are dimly aware of the door being swung open, and you begin to crawl feebly across the floor towards the flow of cool morning air. In doing so, your hand brushes against a large lump of charcoal which must have fallen out of the fire during the night. You also notice that one of the round stones which formed the sides of the fire-trough has worked itself loose. It is still warm to the touch, but not unbearably so.">
<CONSTANT TEXT403-CONTINUED "\"Come along,\" snaps the chief courtier impatiently. He sends in a couple of his men, who drag you outside. Staring down at you as your strength returns, he says nastily: \"Did you have a pleasant night?\"||\"Very comfortable,\" you mutter through parched lips. \"What's next?\"||\"Next,\" e says, \"is the House of Bats.\"">

<ROOM STORY403
	(DESC "403")
	(STORY TEXT403)
	(PRECHOICE STORY403-PRECHOICE)
	(CONTINUE STORY225)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY403-PRECHOICE ()
	<KEEP-ITEM ,LUMP-OF-CHARCOAL>
	<KEEP-ITEM ,STONE>
	<CRLF>
	<TELL ,TEXT403-CONTINUED>
	<CRLF>>

<CONSTANT TEXT404 "The symbol on the diadem represents the World Tree, the source of all birth and regeneration. Now you can feel it throbbing in your hand, its magical energy sending tingling sparks through your fingers. You carefully set your brother's skull on the dusty ground in front of you and place the diadem over its brow.||Sunlight splashes on the rim of the diadem, growing into a blinding cusp of unbearable intensity. The courtiers look away with a moan of awe, and the two shadow men shrink back against the flanks of their creator's pyramid. Narrowing your eyes, you peer into the heart of the glow and there you witness -- a miracle.||The glow fades. Your brother is standing before you, fully restored, grinning like a demigod with the diadem on his brow. It takes you a moment before the wave of dizzying joy passes enough for you to speak: \"Morning Star!\"||\"It is good to see you!\" says your brother, coming forward to hug you. As the two of you touch, there is a crackle of energy and you feel the injuries and fatigue of the last few weeks burned away by life-giving magic.||\"I feared you were lost for ever.\" You point towards the brooding shrine overlooking the ball contest arena. \"Now, brother, let's show that sorcerer our true mettle!\"">

<ROOM STORY404
	(DESC "404")
	(STORY TEXT404)
	(PRECHOICE STORY404-PRECHOICE)
	(CONTINUE STORY042)
	(CODEWORD CODEWORD-VENUS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY404-PRECHOICE ()
	<GAIN-LIFE 4>
	<DELETE-CODEWORD ,CODEWORD-ANGEL>>

<CONSTANT TEXT405 "You swing your elbow up in a perfectly judge blow that hits the ball high up against the scoring zone.">

<ROOM STORY405
	(DESC "405")
	(STORY TEXT405)
	(PRECHOICE STORY405-PRECHOICE)
	(CONTINUE STORY066)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY405-PRECHOICE ("AUX" (SCORE 1))
	<COND (<CHECK-CODEWORD ,CODEWORD-POKTAPOK> <SET SCORE 2>)>
	<SCORE-POINTS .SCORE ,PLAYER>>

<CONSTANT TEXT406 "The storm blows itself out towards dawn, leaving you all shaking with exhaustion. You look around. Unbroken sea surrounds you. The only clue to your course is the sun boiling its way through a bank of low cloud across the horizon, but the sight of circling gulls tells you that land is near. You know that it cannot be the mainland. As a green swathe of foliage appears in the distance, you realize you have found the fabled Isle of the Iguana.||Getting closer, you find a coast of high cliffs which the sea has pounded into fanciful shapes. You sail under an arch of white rock and around a headland that reminds you of a serpent's mouth, arriving at last at a stretch of pebble-strewn beach.||\"The ship was badly damaged in the storm,\" says one of the sailors, pointing to the water collecting in the bottom of the hull. \"We must put in here for repairs.\"">

<ROOM STORY406
	(DESC "406")
	(STORY TEXT406)
	(CONTINUE STORY366)
	(CODEWORD CODEWORD-EB)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT407 "The sun looks like a funnel of flame in the shimmering oven of the sky. Through the soles of your sandals, the rock and sand feel as hot as cinders. The air seems thick with dust, but at nightfall the temperature plummets and you are chilled by a strong breeze.">
<CONSTANT CHOICES407 <LTABLE "travel by day" "by night">>

<ROOM STORY407
	(DESC "407")
	(STORY TEXT407)
	(PRECHOICE STORY407-PRECHOICE)
	(CHOICES CHOICES407)
	(DESTINATIONS <LTABLE STORY022 STORY046>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY407-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE> <STORY-JUMP ,STORY434>)>>

<CONSTANT TEXT408 "The high priest winds a white cloth across your eyes and leads you through to the inner shrine. A deep chill abides here; the thick stone blocks of the Death God's temple walls are never warmed by the sun. The sweet tarry smell of incense hangs in the air. You feel a hand on your shoulder, guiding you to kneel.||A long period of utter silence ensues. You did not hear the high priest withdraw from the chamber, but you gradually become sure that he has left you here alone. You dare not remove the blindfold; to gaze directly on the holy of holies would drive you instantly insane.||A whispering slithers slowly out of the silence. At first you take it for a trick of your unsettle imagination, but by straining your ears you begin to make out words. \"The way to the west lies through the underworld,\" the whispering tells you. \"Go to the city of Yashuna. North of the city lies a sacred well which is the entrance to the underworld. Take this path, which is dangerous but swift, and you will emerge at the western rim of the world. From there it is but a short journey back through the desert to your goal.\"||The whispers fade, drowned out by the thudding of your heart. Frozen with terror at the words of the god, yo crouch motionless on the cold flagstones. The cloying scent of incense grows almost unbearable.||Suddenly a hand touches your shoulder. After the initial jolt of alarm, you allow yourself to be led out onto the portico of the temple, where the blindfold is removed. You blink in the dazzling sunlight. You feel as weak as a baby and the smell of incense clings to your clothes. After the cool of the shrine, the heat of the afternoon sun makes you feel slightly sick.||The podgy priest is looking up into your eyes. \"You head the voice of the god,\" he says simply.">

<ROOM STORY408
	(DESC "408")
	(STORY TEXT408)
	(CONTINUE STORY093)
	(CODEWORD CODEWORD-CENOTE)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT409 "The stabai guide you through the forest to a tall tree which has had the vitality leeched out of it by a strangler fig. The roots of the strangler enclose the decomposing trunk like a crusty scab. A barely glimpsed arm directs your attention to a hole some way up the side of the tree. \"There,\" announces the fluting voice of the stabai. \"The treasure is inside the dying tree-trunk.\"||The strangler's roots make it an easy climb. The stabai effortlessly keep pace with you. From somewhere amid the branches you hear them urging you to return the shawl. \"Not yet,\" you reply. \"First I'll take a look at this treasure.\"||\"But then you will return the shawl?\" they whine.||Your foot slips but you steady yourself in the crook of a branch. It is a long way to the ground. No doubt the stabai are hoping you will break your neck, and their distractions are not helping. \"I'm making no promises,\" you tell them irritably.||Pulling yourself up level with the hold, you peer inside. It looks dank and rotten. There is a smell like mushrooms -- sickly sweet, a heady aroma. But as your eyes penetrate the darkness, you see that the stabai did not lie. Just within reach glitters a solid gold diadem.">
<CONSTANT CHOICES409 <LTABLE "reach in and take the diadem" "else climb back down and get the stabai to lead you out of the woods">>

<ROOM STORY409
	(DESC "409")
	(STORY TEXT409)
	(PRECHOICE STORY409-PRECHOICE)
	(CHOICES CHOICES409)
	(DESTINATIONS <LTABLE STORY049 STORY390>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY409-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-ROGUERY> <STORY-JUMP ,STORY026>)>>

<CONSTANT TEXT410 "The lad is as good as his word, and takes you along an obscure track that leads towards the edge of the forest. As you walk, he tells you of his people, whose task is to guard the World Tree.||\"Who appointed you to this sacred duty?\" you ask, hiding a smile because you do not believe such an outrageous claim.||\"It was the God of Gods, who at the dawn of time created our ancestors from whom came all men,\" he says. His sing-song intonation suggests he is reciting the words of his tribal shaman. But what he says next makes you pause for thought: \"You're going to Nachan? My father went there once, in the time of the old king. I hear there is a passage into the underworld.\"||Interested, you ply him with questions but he knows nothing more. At last he points along a lightly wooded lane. \"Follow this path and you will soon reach the outside world,\" he says.||Thanking him, you say good-bye and set out along the lane.">

<ROOM STORY410
	(DESC "410")
	(STORY TEXT410)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT411 "The high priest watches the sun decline across the treetops to the west. \"The moment has arrived,\" he intones to the waiting crowd. \"This ambassador will bear our message to the Rain God.\"||You stare down. A gulf of dozen man-heights separates you from the grim watery gate of the afterlife. Even with your spell in force, you cannot suppress a qualm as you step out into space.||The gasp of the crowd is lost in the rush of wind as you go plummeting down. The white root-tangled walls of the sinkhole flicker past your vision. An instant later there is an icy impact and then darkness and eeriness surround you.||If not for your magic, the golden regalia you are wearing would bear you down to a watery grave. You struggle free of the fastenings and allow the vest of gold plaques to sink out of sight in the murk, but you keep the golden helmet tucked under your arm as you go shooting up towards the surface.">
<CONSTANT TEXT411-CONTINUED "You break the surface like a log bobbing up out of the depths. There is a weak glow here, but it is not daylight. You are no longer at the bottom of the sinkhole, but in a vast underground cavern. You stagger up onto a rocky shore before your spell can wear off.||The sound of oars reaches your ears. Approaching you across the lake comes a long canoe crewed by two weird figures that seem to have strayed out of a feverish dream">

<ROOM STORY411
	(DESC "411")
	(STORY TEXT411)
	(PRECHOICE STORY411-PRECHOICE)
	(CONTINUE STORY097)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY411-PRECHOICE ()
	<KEEP-ITEM ,GOLDEN-HELMET>
	<CRLF>
	<TELL ,TEXT411-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT412 "The path reaches a shallow brook. Midges cloud the damp gloomy air. In the branches high above, a macaw dips its long yellow beak to peer at you.">
<CONSTANT CHOICES412 <LTABLE "go straight across the brook" "go left along the bank" "go right">>

<ROOM STORY412
	(DESC "412")
	(STORY TEXT412)
	(CHOICES CHOICES412)
	(DESTINATIONS <LTABLE STORY029 STORY006 STORY052>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT413 "The warmth of your grip awakens the spark of life in the golden manikin. Dropping from your hand to the ledge, it takes in the situation with a single haughty glance. You wonder how anything so small could help against the flying cobra, but the Man of Gold was fashioned by a god and is far more powerful than you could imagine. As the cobra comes swooping to attack you, the Man of Gold leaps up and seizes its tail, dragging it down to the ledge. The struggle is brief. After casting the lifeless body into the river, the Man of Gold makes a gesture of farewell and then dives off the ledge itself. You hear it fall with a short heavy splash, and by the time you look over the edge it has sunk without a trace.||\"That was handy, having that little figurine,\" calls up one of the demonic oarsmen.||The other chimes in with: \"Too bad you couldn't keep it.\"||He is right.">

<ROOM STORY413
	(DESC "413")
	(STORY TEXT413)
	(PRECHOICE STORY413-PRECHOICE)
	(CONTINUE STORY339)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY413-PRECHOICE ()
	<LOSE-ITEM ,MAN-OF-GOLD>>

<CONSTANT TEXT414 "The knot on one of the gates unties itself. The gate swings open to let you enter, then closes behind you. At the end of a short tunnel you find a chamber which is open on the far side, giving onto a ledge overlooking a river of foaming blood. A man stands on the ledge, and you recognize him as the feather-robed noble you saw on the causeway outside.||He points to an obsidian beam spanning the river to the far bank. At first you think it is a bridge, but when you step out onto the ledge for a closer look you see that it is wedge-shaped, coming to a sharp edge on its upper surface. \"It would be difficult to keep one's balance on that,\" you remark drily.||\"That isn't the intention,\" says the noble. He holds up a pole with a hook on the end. \"I found this here on the ledge. Notice that there is a similar pole on the other ledge yonder.\"||You look upriver. There is indeed another ledge with an identical beam a few metres away, presumably where you would have come out if you had gone through the other doorway. A pole like the one the noble is holding rests there.||\"Eventually a poor man will arrive,\" he says. \"He will emerge on the other ledge, at which time he and I will reach out and hook our poles together. Then, leaning out and walking on the sloping surface of the obsidian beams, we will be able to cross together.\"||\"Ingenious!\" you say. But you are thinking about how you will get across.">
<CONSTANT CHOICES414 <LTABLE "use" "or" "or" "otherwise">>

<ROOM STORY414
	(DESC "414")
	(STORY TEXT414)
	(CHOICES CHOICES414)
	(DESTINATIONS <LTABLE STORY418 STORY430 STORY221 STORY013>)
	(REQUIREMENTS <LTABLE SKILL-AGILITY SKILL-ROGUERY SKILL-SEAFARING NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT415 "The shrine at the top of the pyramid is a small dark chamber fronted by a portico supported by strong square pillars. You can see the mouth of the spirit tube, fashioned in the shape of a slim snake. You know that the hollow tube extends all the way down through the interior of the pyramid to the tomb chamber deep in its heart. It is an eerie feeling to think that when you speak into the tube your words echo down into the ear of the dead king.||You keep a lone vigil long into the night. As the moon reaches its zenith, there is a soft soughing of wind up the spirit tube. Suddenly you realize you are unable to move. You will not admit to fear, but you are struck with awe to see a long curl of glowing green mist ooze out of the mouth of the tube. It hangs there in the shadows of the shrine, slowly curling in the air, gradually coming into focus in the form of a translucent snake. As you watch, the snake opens its jaws and the head of a man pushes into view, extruding from inside the snake's body until he has entirely emerged except for his left leg, which remains within its throat. He is a glistening red colour, as though covered in fresh blood, and as nude as a newborn baby.||You bow your head humbly to the cold flagstones, knowing that this is the spirit of King Sky Shield.">

<ROOM STORY415
	(DESC "415")
	(STORY TEXT415)
	(CONTINUE STORY335)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT416 "The festivities include ritual dance-dramas in which the participants mask themselves as beasts, gods and heroes from folklore. Accompanied by flutes and the throbbing beat of immense wooden drums, they swirl across the plaza in front of the temples, enacting the deeds of such mythic figures as the hero-twins Forethought and Afterthought.||At one point the twins take part in a ball contest and Afterthought succeeds in hurling the ball through the stone hoop on the side of the court. This provokes shouts of praise from spectators at the back of the crowd, but you are close to the front and can see that the apparently difficult shot was made with the help of string tied to the ball.||\"Huh!\" snorts a woman standing next to you. \"He'd never have made the shot otherwise. I've never seen it done for real in all the contests I've watched.\"||The woman's son tugs at her skirt. He wants to know why the act of scoring in the ball contest has given him victory over his foes, the Lords of Death. \"That's because it's more than a game,\" you hear her saying. \"It's also a sacred ritual. You'll understand when you're older.\"||The afternoon wears on with much feasting and jollity. By evening you are happy to lie down in the plaza and drift off to sleep as the sultry night unfolds its canopy of stars. Tomorrow you must decide:">
<CONSTANT CHOICES416 <LTABLE "continue overland to Ashaka" "go downriver to the coast">>

<ROOM STORY416
	(DESC "416")
	(STORY TEXT416)
	(CHOICES CHOICES416)
	(DESTINATIONS <LTABLE STORY008 STORY030>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT417 "You leave the fenlands and continue north. Arriving at last at the coast, you go to the edge of the sea and watch the setting sun gouge streaks of blood across a jade-grey sky.">
<CONSTANT CHOICES417 <LTABLE "set off walking along the coast towards Tahil" "try to get a passage on a ship">>

<ROOM STORY417
	(DESC "417")
	(STORY TEXT417)
	(PRECHOICE STORY417-PRECHOICE)
	(CHOICES CHOICES417)
	(DESTINATIONS <LTABLE STORY228 STORY251>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY417-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-OLMEK> <STORY-JUMP ,STORY260>)>>

<CONSTANT TEXT418 "\"You can wait for a poor man to show up if you like,\" you say to the noble, \"but I don't have the patience for that.\"||\"Wait!\" he cries as you step out onto the beam. \"You'll fall into the river and be drowned!\"||But he has reckoned without your extraordinary sense of balance. You run along the thin edge of the beam like a tightrope walker and leap off safely on the far bank. Glancing back, you wave to him, saying flippantly, \"I'm an expert. Don't try it yourself.\"">

<ROOM STORY418
	(DESC "418")
	(STORY TEXT418)
	(CONTINUE STORY036)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT419 "One of the heads flinches back as you fake a lunge towards it, but then you are caught a glancing blow by one of the others which sends you reeling off across the sand. Your blood drenches the ground underfoot.">

<ROOM STORY419
	(DESC "419")
	(STORY TEXT419)
	(PRECHOICE STORY419-PRECHOICE)
	(CONTINUE STORY222)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY419-PRECHOICE ("AUX" (DAMAGE 2))
	<COND (<OR <CHECK-SKILL ,SKILL-SWORDPLAY> <CHECK-SKILL ,SKILL-TARGETING> <CHECK-SKILL ,SKILL-UNARMED-COMBAT>> <SET DAMAGE 1>)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-FROM-INJURIES ,STORY419>>

<CONSTANT TEXT420 "The hound's hot glowering gaze burns in the brutal white wedge of its face. It looks as strong as a jaguar, but with the jaguar's easygoing disposition. As it sees you take a step into the passage, its jaws begin to slaver and it gives a rasping snarl.">
<CONSTANT CHOICES420 <LTABLE "use" "a blowgun" "rely on" "use" "fight the beast">>

<ROOM STORY420
	(DESC "420")
	(STORY TEXT420)
	(CHOICES CHOICES420)
	(DESTINATIONS <LTABLE STORY247 STORY316 STORY270 STORY383 STORY293>)
	(REQUIREMENTS <LTABLE SKILL-FOLKLORE SKILL-TARGETING SKILL-CUNNING HYDRA-BLOOD-BALL NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT421 "The owl is a natural predator of the bats. It perches on your shoulder and scans the dim vaults of the hall, its luminous eyes drinking up even the faintest glimmer of light. You feel reassured that, even through your own senses are helpless in the darkness, the owl remains alert and watchful. Any bat who dared to descend from its roost would meet a sticky end. They seem to know this, and despite the rank stench of the place you are able to get a restful night's sleep.">

<ROOM STORY421
	(DESC "421")
	(STORY TEXT421)
	(PRECHOICE STORY421-PRECHOICE)
	(CONTINUE STORY041)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY421-PRECHOICE ()
	<GAIN-LIFE 1>>

<CONSTANT TEXT422 "You take out the chalice and hold it reverentially in your hands. If it is indeed Chalice of Life, it is the same bowl in which the Supreme God gave birth to mankind. Praying that it still has some power to work miracles, you set the chalice on the ground and place your brother's skull within.||The sun's golden rays blaze down, catching in an incandescent cusp on the rim of the chalice. A stream of heavy vapour rapidly boils up, and within seconds you can no longer make out the skull within its pool of gold mist. The mist rises up into a swirling column about two metres high and hangs there above the chalice, shining with an inner core of light.||A brief gust of wind stirs and dissipates the mist. The last strands are blown away and you stare incredulously for a long moment before giving a great shout of joy. Your brother is standing there in front of you -- alive again!||\"Morning Star!\" As two of you embrace, there is a crackle of energy and you feel the injuries and fatigue of the last few weeks burned away by life-giving magic.||\"It is good to see you, Evening Star,\" says your brother, smiling as he hugs you to him.||\"And you.\" You point towards the brooding shrine overlooking the ball contest arena. \"Now, brother, let's show that sorcerer our true mettle!\"">

<ROOM STORY422
	(DESC "422")
	(STORY TEXT422)
	(PRECHOICE STORY422-PRECHOICE)
	(CONTINUE STORY042)
	(CODEWORD CODEWORD-VENUS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY422-PRECHOICE ()
	<DELETE-CODEWORD ,CODEWORD-ANGEL>
	<GAIN-LIFE 4>>

<ROOM STORY423
	(DESC "423")
	(EVENTS STORY423-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY423-EVENTS ()
	<COND (<CHECK-ITEM ,HYDRA-BLOOD-BALL> <RETURN ,STORY386>)>
	<RETURN ,STORY405>>

<CONSTANT TEXT424 "\"The goddess oversees the tides,\" says the priest, accepting your gift with a heavy-lidded smile. \"Betake yourself to the town of Balak. Do not put to sea at once; wait a week before you set sail. Stay close to shore if you wish to avoid a hazardous adventure.\"||You wait for more, but he seems to have finished speaking. \"You haven't even mentioned the western desert,\" you say in a tone verging on indignation.||\"I have given my advice on that. There is just one think I might add: seek the blood that is like sap.\"||You suck your teeth. \"Enigmatic,\" you comment drily.||\"If it's clarity you're after, consult a merchant.\"||Somewhat disgruntled, you retreat down the temple steps. You would have preferred to proudly turn your back on the smug priest, but custom forbids you to avert your face from any shrine as you leave it for fear of offending the deity within. Also, these temple steps are alarmingly steep; descending backwards is less nerve-wracking.">

<ROOM STORY424
	(DESC "424")
	(STORY TEXT424)
	(CONTINUE STORY093)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT425 "You hold out the shawl, allowing the scaly talons to catch hold of it. The arm withdraws into the hole and there is a pause while the unseen creature examines what it has got. \"This is a stabai shawl!\" cries a voice full of insensate rage. \"A curse be upon you, you crafty stabai! May fungus infect your limbs and sickness burrow into your bodies. You'll not escape lightly for this outrage.\"||The stabai utter moans of dismay and melt away into the distance, alarmed by the monster's threats. For your part, you descend swiftly and quietly to examine your prize. Cleaning away the coating of muck, you discover it to be a circlet such as a nobleman or high priest might wear upon his brow. It is patterned with sacred glyphs and bears the cruciform symbol of the World Tree in inlaid plaques of jade. It is literally worth a king's ransom.">

<ROOM STORY425
	(DESC "425")
	(STORY TEXT425)
	(PRECHOICE STORY425-PRECHOICE)
	(CONTINUE STORY324)
	(ITEM GOLD-DIADEM)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY425-PRECHOICE ()
	<LOSE-ITEM ,SHAWL>>

<CONSTANT TEXT426 "Not far off, a young priestess is overseeing the work of a group of artisans. Out of curiosity you stroll over and see that they are decorating a temple wall with an overlay of stucco. Apprentices trowel the plaster into place and then senior artisans work with the speed and assurance of past masters, sculpting images of heroes, princes and gods as the priestess directs. Then, while the stucco is still damp, a second team steps in with pots of dye and applies bright colours. You can only marvel at the skill of the men's work.||The figures depicted in the frieze looks so startlingly vivid that you could almost imagine them coming to life and stepping out of the stucco.">
<CONSTANT CHOICES426 <LTABLE "go over and talk to the priestess" "find a place to stay" "seek an audience with the King of Nachan">>

<ROOM STORY426
	(DESC "426")
	(STORY TEXT426)
	(CHOICES CHOICES426)
	(DESTINATIONS <LTABLE STORY054 STORY101 STORY077>)
	(REQUIREMENTS <LTABLE NONE 0 NONE>)
	(TYPES <LTABLE R-NONE R-MONEY R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT427 "Covering your mouth and nose, you sift through the mouldered remains. You find a shell necklace and an ivory ring adorning the corpse as jewellery. Inside the shattered remnants of the mouth rests a jade bead intended for the dead woman's soul to purchase its passage into the afterlife. Her babies have no such beads -- conventional lore says that they are too young to have souls. You feel sad for them, seeing the tiny skeletons clutched so hopelessly to the mother's dead breast. Even across the gulf of centuries, it is a scene poignant with deep tragedy.||In front of the sarcophagus you now notice a funerary lamp. It still has little incense inside it.">
<CONSTANT TEXT427-CONTINUED "The two demons utter a stream of coarse remarks as you climb back down, annoyed at having been kept waiting. You ignore them. Your experience in the tomb has left you feeling melancholy and haunted">

<ROOM STORY427
	(DESC "427")
	(STORY TEXT427)
	(PRECHOICE STORY427-PRECHOICE)
	(CONTINUE STORY167)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY427-PRECHOICE ("AUX" (COUNT 4) LOOT)
	<SET LOOT <LTABLE SHELL-NECKLACE IVORY-RING INCENSE JADE-BEAD>>
	<COND (<CHECK-ITEM ,JADE-BEAD> <SET COUNT 3>)>
	<PUT .LOOT 0 .COUNT>
	<SELECT-FROM-LIST .LOOT .COUNT .COUNT>
	<CRLF>
	<TELL ,TEXT427-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT428 "You glance up. In the gloomy vault of the dragon's throat, giant tonsils hang like a pair of gongs. You can just reach one of the tonsils by standing on tiptoe. You start to tickle it, and soon the dragon gives a gagging cough and spits you out -- along with a torrent of bilious vomit which burns your skin.">
<CONSTANT TEXT428-CONTINUED "You slowly get to your feet. Kawak's face at this end is blunter, with bulbous white eyes and long tusks. He sees you grimace at the stink of the vomit and remarks in a rumbling voice: \"Be thankful I didn't eat you alive.\"||Nodding, you press on deeper towards the Deathlands.">

<ROOM STORY428
	(DESC "428")
	(STORY TEXT428)
	(PRECHOICE STORY428-PRECHOICE)
	(CONTINUE STORY263)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY428-PRECHOICE ()
	<TEST-IMMORTALITY 1 ,DIED-FROM-INJURIES ,STORY428>
	<IF-ALIVE TEXT428-CONTINUED>>

<CONSTANT TEXT429 "Your thrust skewers the hydra at the junction of its four necks. A ghastly multiple shriek splits the air. You are jerked off its feet by its death-throes and its blood gushes out into your face. It snaps feebly at you, but you cling on and sink the weapon deeper until finally it gives a last spasm and fall lifeless.||As you withdraw the weapon, a large drop of its green life-fluid oozes out of the wound and falls to the ground, congealing to form a rubbery ball such as one might use in the ritual ball contest of your people.">

<ROOM STORY429
	(DESC "429")
	(STORY TEXT429)
	(PRECHOICE STORY429-PRECHOICE)
	(CONTINUE STORY038)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY429-PRECHOICE ()
	<KEEP-ITEM ,HYDRA-BLOOD-BALL>
	<COND (<CHECK-CODEWORD ,CODEWORD-ANGEL> <STORY-JUMP ,STORY015>)>>

<CONSTANT TEXT430 "\"We might wait for ever for a poor man to show up,\" you say. \"My quest demands rather more urgency than that.\"||So saying, you retrace your steps to the wooden gate. It is now sealed again by the convoluted knot, but with your dexterity it is the work of a moment to untie it. Returning outside, you untie the knot on the other gate and hurry through the other ledge, where you pick up the hooked pole lying there. Putting the nobleman's plan into operation, the two of you slowly cross the twin beams, putting your weight onto the hooked poles to counterbalance one another.||The torrent of blood churns beneath you. One slip and you would both be borne away to your doom. But at last you reach the far bank and step onto firm dry land. With a sigh of relief, the noble casts his pole into the river. You might wish to keep yours.">

<ROOM STORY430
	(DESC "430")
	(STORY TEXT430)
	(PRECHOICE STORY430-PRECHOICE)
	(CONTINUE STORY399)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY430-PRECHOICE ()
	<KEEP-ITEM ,POLE>>

<CONSTANT TEXT431 "This courtyard is surrounded by low grey walls that lie like borders of soot around a plaza ablaze in the blistering sunshine. In the far wall is a massive of intertwined human bones and skulls. \"They are the previous victims of our master,\" says the chief courtier with a leer when he sees you blanch. \"Soon your own bones will be added to that gate.\"||Ignoring him , you turn your attention to five windowless buildings standing in the wide plaza. \"And those?\" you ask.||They are the Five Houses of Destiny,\" he says. \"If you can pass one night in each, the gate will open. Then you will gaze on the countenance of Necklace of Skulls.\"||You wait through a long afternoon until the sun dips into a red hot shimmer along the western horizon. The heat of the day has left you giddy, but you do your best not to show it as the courtiers come to lead you to the first of the buildings. As they open the door, you are confronted by a wave of fiery heat as though from an open kiln. The interior of the building is a single stone hall with a blazing channel of smouldering charcoal set along it. Large stones warmed to red heat surround it. Sweat erupts from your pores as you are ushered inside.||\"This is the House of Fire,\" says the chief courtier. \"Have a good night. I'll come for you in the morning -- should you survive.\"||The door closes and you are left sealed within the House of Fire. Its smoky confines are swelteringly airless, and your only rest is not true sleep, but a listless swoon brought on by heat exhaustion.">

<ROOM STORY431
	(DESC "431")
	(STORY TEXT431)
	(PRECHOICE STORY431-PRECHOICE)
	(CONTINUE STORY403)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY431-PRECHOICE ()
	<TEST-IMMORTALITY 2 ,DIED-GREW-WEAKER ,STORY431>>

<CONSTANT TEXT432 "Your eyes can make out nothing in the inky darkness that enfolds you. As you squat down on the guano-spattered floor, there is a flap of leather wings and the first of the bats comes fluttering down towards you. You put an arm up to fend it away. Then suddenly you feel a tingle of cold alarm as you realize someone is standing beside you.||\"This mortal is under my protection,\" says a familiar voice. \"Return to your roosts. There will be no drinking of blood for any of you tonight.\"||The rustle of wings recedes into the rafters. You turn, straining to make out the stranger in the absolute dark. \"Who are you?\" you ask him.||\"A friend.\" He touches your arm reassuringly. \"You helped me once, now I am returning the favour. Go to sleep now. These bats are my subjects, and they will not dare harm you.\"||You enjoy a restful night.">

<ROOM STORY432
	(DESC "432")
	(STORY TEXT432)
	(PRECHOICE STORY432-PRECHOICE)
	(CONTINUE STORY041)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY432-PRECHOICE ()
	<GAIN-LIFE 1>
	<DELETE-CODEWORD ,CODEWORD-ZOTZ>>

<CONSTANT TEXT433 "Your opponents have had enough. They abandon their home and go running off yelling, \"Flee! The lunatic will kill us all!\" You watch them splash through the verges of the pond and vanish into the curtain of undergrowth. You nod in satisfaction. It is only when you examine the roasting carcass on the fire that you discover you made a mistake. It is not a human baby they were cooking, but a monkey. So they were not cannibals after all. They must have been the jungle people that the hunter told you about.||A swift examination of the hut reveals a well-stocked larder containing a haunch of venison, three papaya, a bag of chilli peppers and a waterskin.">
<CONSTANT TEXT433-CONTINUED "You decide against taking the roast monkey. You do not think you could bring yourself to eat anything that looks so much like a person. Now you had better leave before the jungle people return">

<ROOM STORY433
	(DESC "433")
	(STORY TEXT433)
	(PRECHOICE STORY433-PRECHOICE)
	(CONTINUE STORY118)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY433-PRECHOICE ()
	<SELECT-FROM-LIST <LTABLE HAUNCH-OF-VENISON PAPAYA CHILLI-PEPPERS WATERSKIN> 4 4>
	<CRLF>
	<TELL ,TEXT433-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT434 "Exposed to the full heat of the sun, you know you would not last three days. You must rest in the shade in the daytime, travelling on at sunset. By keeping on the move, you can keep warm despite the night-time chill.||You slip a pebble in your mouth. Sucking it will stave of thirst. You must conserve your water if you are to survive.">

<ROOM STORY434
	(DESC "434")
	(STORY TEXT434)
	(CONTINUE STORY046)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT435 "You cast a negation spell, causing the flames to peter out. Jade Thunder scrabbles forward across the sand and snatches up his wand with a great shout of joy. \"At last!\" he cries. \"Now let me show you what can be achieved by a Grand Adept of our most potent art.\"">

<ROOM STORY435
	(DESC "435")
	(STORY TEXT435)
	(CONTINUE STORY091)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT436 "\"Easy to repay us,\" says one fellow, flashing his teeth in a broad white grin. He holds up the shawl you acquired earlier. \"The stabai cause us a lot of mischief. If we had their shawl, they wouldn't bother us.\"||After some haggling, the jungle people agree to offer you a haunch of venison in exchange for the shawl.">
<CONSTANT TEXT436-CONTINUED "You are ready to set out. As you gather up your belongings, a youth who has been watching you keenly without joining the conversation sidles up to you. \"I could guide you out of the woods if you think you might get lost,\" he suggests. You are unsure how to take this offer. The jungle dwellers do not observe the same rules of hospitality as civilized people, and for all you know he might lead you into a trap">
<CONSTANT CHOICES436 <LTABLE "let him guide you" "set out alone">>

<ROOM STORY436
	(DESC "436")
	(STORY TEXT436)
	(PRECHOICE STORY436-PRECHOICE)
	(CHOICES CHOICES436)
	(DESTINATIONS <LTABLE STORY410 STORY118>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY436-PRECHOICE ()
	<COND (,RUN-ONCE
		<CRLF>
		<TELL "Exchange " T ,SHAWL " with a " D ,HAUNCH-OF-VENISON "?">
		<COND (<YES?>
			<LOSE-ITEM ,SHAWL>
			<TAKE-ITEM ,HAUNCH-OF-VENISON>
		)>
	)>
	<CRLF>
	<TELL ,TEXT436-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT437 "You set sail and continue your voyage west.">

<ROOM STORY437
	(DESC "437")
	(STORY TEXT437)
	(EVENTS STORY437-EVENTS)
	(CONTINUE STORY300)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY437-EVENTS ()
	<COND (<CHECK-CODEWORD ,CODEWORD-EB> <RETURN ,STORY387>)>
	<RETURN ,STORY437>>

<CONSTANT TEXT438 "The blistering heat is sapping your last reserves of strength. Your lips are dry cracked husks and your skin is covered in blackened blisters. You cannot endure for long.">

<ROOM STORY438
	(DESC "438")
	(STORY TEXT438)
	(PRECHOICE STORY438-PRECHOICE)
	(CONTINUE STORY303)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY438-PRECHOICE ("AUX" (HARDY F) (DAMAGE 2))
	<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
		<SET DAMAGE 1>
		<SET HARDY T>
	)>
	<TEST-IMMORTALITY .DAMAGE ,DIED-OF-THIRST ,STORY438>
	<COND (<AND <IS-ALIVE> .HARDY>
		<EMPHASIZE ,NATURAL-HARDINESS>
	)>>

<CONSTANT TEXT439 "You conjure a swarm of little green ants which follow the motion of your wand. Pointing to the dragon's tonsils, which dangle above you in the cavern of his mouth like a pair of giant gongs, you direct the ants to crawl up across them. The ticklish effect of thousands of tiny scuttling legs soon has the desired effect, and the dragon spits you out into the open with a gagging cough.||You get to your feet and wring the dragon's saliva out of your robes. It could have been worse: he might have thrown up. Kawak hangs at the lip of the canyon, glowering as he spits out ants like a man spitting papaya pips. You hurry off before he turns nasty.">

<ROOM STORY439
	(DESC "439")
	(STORY TEXT439)
	(CONTINUE STORY263)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT440 "You smear yourself with the grease of the meat.">
<CONSTANT TEXT440-CONTINUED "Steeling yourself, you walk down into the lake. The bitter cold bites at your flesh, but the insulating layer of deer fat protects you from the worst of it. Half stumbling, half floating, you descend the staircase towards a blaze of pulsating green light">

<ROOM STORY440
	(DESC "440")
	(STORY TEXT440)
	(PRECHOICE STORY440-PRECHOICE)
	(CONTINUE STORY173)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY440-PRECHOICE ()
	<KEEP-ITEM ,HAUNCH-OF-VENISON>
	<CRLF>
	<TELL ,TEXT440-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT441 "You know that the terrain of the forest generally rises towards the south and west. On the basis of this, the direction of the woodland streams gives you at least a hint about which way to go to reach Nachan. You need to bear steadily left until you begin to see signs of human habitation.">

<ROOM STORY441
	(DESC "441")
	(STORY TEXT441)
	(CONTINUE STORY326)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT442 "As you and your brother cross the courtyard and pass through the palace gates, you can feel the ground shaking under your feet. You reach a dune and turn to look back. The pyramid and surrounding buildings are sinking into the sand. In minutes they have vanished entirely, and there is no sign to show that this was ever the spot where Necklace of Skulls dwelt among his bestial courtiers. You look around for the courtiers, but see only a pack of malnourished dogs slinking off amid the dunes.||\"It's a long way home,\" says Morning Star. \"Fraught with danger every step of the way, I shouldn't wonder. Heat, thirst, sandstorms, poisonous snakes ...\" He says all this with a smile.||You smile too. \"After all we've been through, it'll seem like a picnic! Well brother, what are we waiting for?\"||And, turning your faces to the east, you set out across the drifting sands.">

<ROOM STORY442
	(DESC "442")
	(STORY TEXT442)
	(VICTORY T)
	(FLAGS LIGHTBIT)>
