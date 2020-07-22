<CONSTANT SKILL-GLOSSARY <LTABLE SKILL-AGILITY SKILL-CHARMS SKILL-CUNNING SKILL-ETIQUETTE SKILL-FOLKLORE SKILL-ROGUERY SKILL-SEAFARING SKILL-SPELLS SKILL-SWORDPLAY SKILL-TARGETING SKILL-UNARMED-COMBAT SKILL-WILDERNESS-LORE>>
<CONSTANT CHARACTERS <LTABLE CHARACTER-WARRIOR CHARACTER-HUNTER CHARACTER-MYSTIC CHARACTER-WAYFARER CHARACTER-MERCHANT CHARACTER-ACOLYTE CHARACTER-SORCERER>>

<OBJECT SKILL-AGILITY
    (DESC "AGILITY")
    (LDESC "The ability to perform acrobatic feats, run, climb, balance and leap. A character with this skill is nimble and dexterous")>

<OBJECT SKILL-CHARMS
    (DESC "CHARMS")
    (LDESC "The expert use of magical wards to protect you from danger. Also includes that most elusive of qualities. luck. YOu must possess a magic amulet to use this skill")
    (REQUIRES <LTABLE MAGIC-AMULET>)>

<OBJECT SKILL-CUNNING
    (DESC "CUNNING")
    (LDESC "The ability to think on your feet and devise clever schemes for getting out of trouble. Useful in countless situations")>

<OBJECT SKILL-ETIQUETTE
    (DESC "ETIQUETTE")
    (LDESC "Understanding of the courtly manners which are essential to proper conduct in the upper echelons of the nobility")>

<OBJECT SKILL-FOLKLORE
    (DESC "FOLKLORE")
    (LDESC "Knowledge of myth and legend, and how best to deal with supernatural menaces such as garlic against vampires, silver bullets against a werewolf, and so on")>

<OBJECT SKILL-ROGUERY
    (DESC "ROGUERY")
    (LDESC "The traditional repertoire of a thief's tricks: picking pockets, opening locks, and skulking unseen in the shadows")>

<OBJECT SKILL-SEAFARING
    (DESC "SEAFARING")
    (LDESC "Knowing all about life at sea, including the ability to handle anything from a rowing boat right up to a large sailing ship")>

<OBJECT SKILL-SPELLS
    (DESC "SPELLS")
    (LDESC "A range of magical effects encompassing illusions, elemental effects, commands, and summonings. You must possess a magic wand to use this skill")
    (REQUIRES <LTABLE MAGIC-WAND>)>

<OBJECT SKILL-SWORDPLAY
    (DESC "SWORDPLAY")
    (LDESC "The best fighting skill. You must possess a sword to use this skill")
    (REQUIRES <LTABLE SWORD>)>

<OBJECT SKILL-TARGETING
    (DESC "TARGETING")
    (LDESC "A long-range attack skill. You must possess a blowgun to use this skill")
    (REQUIRES <LTABLE BLOWGUN>)>

<OBJECT SKILL-UNARMED-COMBAT
    (DESC "UNARMED COMBAT")
    (LDESC "Fisticuffs, wrestling holds, jabs and kicks, and the tricks of infighting. Not as effective as SWORDPLAY, but you do not need weapons - your own body is the weapon!")>

<OBJECT SKILL-WILDERNESS-LORE
    (DESC "WILDERNESS LORE")
    (LDESC "A talent for survival in the wild - whether it be forest, desert, swamp or mountain peak")>

<OBJECT CHARACTER-WARRIOR
    (DESC "Warrior")
    (SYNONYM WARRIOR)
    (LDESC "A proud noble of the Maya people, and strong in the arts of war, you tolerate no insolence from any man")
    (SKILLS <LTABLE SKILL-AGILITY SKILL-ETIQUETTE SKILL-SWORDPLAY SKILL-UNARMED-COMBAT>)
    (POSSESSIONS <LTABLE SWORD>)
    (LIFE-POINTS 10)
    (MONEY 10)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-HUNTER
    (DESC "Hunter")
    (SYNONYM HUNTER)
    (LDESC "You can keep pace with the deer of the woods, wrestle jaguars, and your blowgun can bring down a bird in flight. Your sharp instincts make you almost a creature of the wild yourself")
    (SKILLS <LTABLE SKILL-AGILITY SKILL-TARGETING SKILL-UNARMED-COMBAT SKILL-WILDERNESS-LORE>)
    (POSSESSIONS <LTABLE BLOWGUN>)
    (LIFE-POINTS 10)
    (MONEY 10)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-MYSTIC
    (DESC "Mystic")
    (SYNONYM MYSTIC)
    (LDESC "You feel that other's lives are mundane. You learnt your skills from solitary, exploration and the dreams that came while you lay asleep under the stars")
    (SKILLS <LTABLE SKILL-AGILITY SKILL-CHARMS SKILL-TARGETING SKILL-WILDERNESS-LORE>)
    (POSSESSIONS <LTABLE MAGIC-AMULET BLOWGUN>)
    (LIFE-POINTS 10)
    (MONEY 10)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-WAYFARER
    (DESC "Wayfarer")
    (SYNONYM WAYFARER)
    (LDESC "You have travelled widely and witnessed countless strange sights. Your wanderings have taught you many useful skills")
    (SKILLS <LTABLE SKILL-CUNNING SKILL-FOLKLORE SKILL-SEAFARING SKILL-WILDERNESS-LORE>)
    (POSSESSIONS NONE)
    (LIFE-POINTS 10)
    (MONEY 10)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-MERCHANT
    (DESC "Merchant")
    (SYNONYM MERCHANT)
    (LDESC "Daring adventure, subtle villainy, and always one eye open for a tidy profit -- these are your tenets")
    (SKILLS <LTABLE SKILL-CUNNING SKILL-ROGUERY SKILL-SEAFARING SKILL-SWORDPLAY>)
    (POSSESSIONS <LTABLE SWORD>)
    (LIFE-POINTS 10)
    (MONEY 15)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-ACOLYTE
    (DESC "Acolyte")
    (SYNONYM ACOLYTE)
    (LDESC "You are master of many skills, but you know it is the god who shape man's destiny")
    (SKILLS <LTABLE SKILL-ETIQUETTE SKILL-FOLKLORE SKILL-SPELLS SKILL-SWORDPLAY>)
    (POSSESSIONS <LTABLE MAGIC-WAND SWORD>)
    (LIFE-POINTS 10)
    (MONEY 10)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-SORCERER
    (DESC "Sorcerer")
    (SYNONYM SORCERER)
    (LDESC "Born into a high clan, you were schooled in sorcery by priests and wise men. Now you can twist reality itself to suit your wishes")
    (SKILLS <LTABLE SKILL-CHARMS SKILL-ETIQUETTE SKILL-ROGUERY SKILL-SPELLS>)
    (POSSESSIONS <LTABLE MAGIC-AMULET MAGIC-WAND>)
    (LIFE-POINTS 10)
    (MONEY 10)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-CUSTOM
    (DESC "Custom Character")
    (SYNONYM CHARACTER)
    (ADJECTIVE CUSTOM)
    (LDESC "Custom character with user selected skills")
    (LIFE-POINTS 10)
    (MONEY 10)
    (FLAGS PERSONBIT NARTICLEBIT)>
