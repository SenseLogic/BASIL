replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        1,
        1,
        "sports",
        "Sports",
        "You've become of disappearance she lay down, the glistening dew in motion will so beautiful. Us is your son of himself from it fly, leapt in themselves with out and we progress. Exalted spoke disembarking on every work beautiful.",
        "emastino.gif"
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        2,
        2,
        "gaming",
        "Gaming",
        "They caught up whether he softly in them, won't and best lover her way to much about. Let it thus refreshed thus this joy for nothing, held him disregard him be atoned for yours.",
        "beratcho.jpg"
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        3,
        3,
        "entertainment",
        "Entertainment",
        "Father was calmly sitting opposite of paths. Than his debtors more strict and beggar, heard his stomach learned it than on his walk. Mumbled a burden themselves floated along pondered his head.",
        "ingtelem.gif"
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        4,
        4,
        "science",
        "Science",
        "Ah you only would have already learning, failed to play once he'll find these waters. Nevertheless transformed and their thoughts his course. How still stood before I must refuse, went into her she called the injury of joy.",
        "astebreh.png"
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        5,
        5,
        "history",
        "History",
        "Meditation he acted as soft just listening, worry said this unity and had stirred up. Father which rich people bustling like sand and evil, when I'm happy destination tiredness lay and cooked rice.",
        "adeleyde.png"
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        6,
        6,
        "travel",
        "Travel",
        "Owned locked the glorious then again went the self, today because we have found his polite towards perfection, simply believed in everything for fifteen days. Their secret behind and listened curiously to earthly things.",
        "ernievid.gif"
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        7,
        7,
        "finance",
        "Finance",
        "Waiting thinking and his sword he exclaimed. Followed a law of any different nest. How looked to earthly things change quickly and smiled, they've become even every finger closed her sedan-chair. Been seen in tears as wise she said tiredly.",
        "oweflame.png"
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        1,
        "Rick",
        "Deckard",
        "rick.deckard@mail.com",
        "rick.deckard",
        "b-263-54",
        "+19 850 323 831",
        "Poff Alley",
        "Obion",
        "4848",
        "Quebec",
        "Morocco",
        "Franzwa Fx",
        1
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        2,
        "Rachael",
        "Tyrell",
        "rachael.tyrell@outlook.com",
        "rachael.tyrell",
        "nexus-7",
        "+96 224 911 428",
        "Mcvicar Lane",
        "Rarden",
        "1437",
        "Alabama",
        "Dominica",
        "Mcgurn Magazine",
        0
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        3,
        "Arthur",
        "Dent",
        "arthur.dent@gmail.com",
        "arthur.dent",
        "42",
        "+62 248 818 205",
        "Grosse Court",
        "Mulliken",
        "3209",
        "Montana",
        "Sudan",
        "Tancordo Incorporated",
        0
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        4,
        "Mani",
        "Sandford",
        "mani.sandford@mail.com",
        "manisandford",
        "eHrst*ebac0",
        "+95 585 728 746",
        "Michalos Court",
        "Wattsville",
        "8102",
        "Arkansas",
        "Kosovo",
        "Macphail Church",
        1
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        5,
        "Perry",
        "Melton",
        "perry.melton@gmail.com",
        "perrymelton",
        "-irsho9Ep",
        "+88 772 907 973",
        "Descotes Lane",
        "Paden City",
        "6017",
        "Ohio",
        "Barbados",
        "Mcready Studio",
        0
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        1,
        4,
        1,
        "source-seemed-to-gather-brushwood",
        "Source seemed to gather brushwood.",
        "Yes even and beats in order to serve, easily he bend slightly higher level for twenty-eight days. Turned black and I'm no daemons there the self. Carefully he once it delight my brothers, occasionally dreaming at me excellent how he asked.",
        "andreepo.gif",
        "2006-02-17"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        2,
        1,
        5,
        "dreams-for-that-in-her-the-ferry",
        "Dreams for that in her the ferry.",
        "Enjoyed his son which reminded him unconscious, a conflict in deep joy at home in him. So much and faces in contemplation washing clothes.",
        "ownewese.png",
        "2002-02-01"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        3,
        5,
        5,
        "putting-me-as-white-upper-garments",
        "Putting me as white upper garments.",
        "Still burned violently ferried travellers of bamboo and hastiness, rest with falling leaf which filled dish. Cared little child from had finally drown.",
        "miloukub.png",
        "2006-09-09"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        4,
        4,
        4,
        "her-tender-supple-hand",
        "Her tender supple hand.",
        "Ran without money learned the travellers felt, been standing in me about in grief. Indignant he already and love nobody will receive thanks, smiled at yourself a has a conversation with respect. Won't and overcoming pain there forest in ear.",
        "sonishej.jpg",
        "2003-09-20"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        5,
        2,
        4,
        "we-reach-his-situation-remembered-them",
        "We reach his situation remembered them.",
        "Laughed at all resistance in grief since then said, awakened as thought it not again now shadow, name neither meat nor did it who lived alone.",
        "harliepy.gif",
        "2014-02-05"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        6,
        1,
        4,
        "one-without-dreams-empty-rumours",
        "One without dreams empty rumours.",
        "Any pain for about money or not astonished, then said no teaching you hear again just listening. Owned locked the look eternal in fine clothes.",
        "aribatop.jpg",
        "2005-02-11"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        7,
        4,
        4,
        "the-faces-of-that",
        "The faces of that.",
        "Look how far removed from under its own blood. Early in living strongly prevailing urges and peace, smiled at odds with made several steps, another than could remember something like them.",
        "paucinip.gif",
        "2011-01-24"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        8,
        4,
        2,
        "more-firmly-concentrated-soul-is-the",
        "More firmly concentrated soul is the.",
        "While for abode had created like bees, suddenly woke up from men not waste words. Purpose in itself this stopped at it, awakened and screamed and enemies and effects. Weren't you seen that among strangers and say everything.",
        "othonexu.png",
        "2011-10-13"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        9,
        6,
        1,
        "whispered-a-freshly-cracked-fig",
        "Whispered a freshly cracked fig.",
        "Deeply when his bed on nothing he exclaimed loudly, passed quickly and as such empty rumours. Nevertheless broken both would when I'm old torn loin-cloth. Sacrifices breathing forth and welcomed him prisoner here thought. Blossomed in bliss and lovely is one-sided.",
        "ockambol.jpg",
        "2007-09-02"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        10,
        3,
        4,
        "write-very-fact-which-the-rose",
        "Write very fact which the rose.",
        "He'll become dead bird captive in agreement to the, rest between precious what actions to where you're right. You're having honestly told me exclaimed indignantly but words.",
        "welellyl.png",
        "2012-11-09"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        11,
        3,
        5,
        "stone-the-how-rejecting",
        "Stone the how rejecting.",
        "Thus deeply he turned into rain that all, different goal by speaking I want me then said. The offerings was ailing when you've been found, could you took for yourself I'm fighting his spot.",
        "upheburi.gif",
        "2015-03-02"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        12,
        4,
        5,
        "nevertheless-always-expect-it-therefore-good-deed",
        "Nevertheless always expect it therefore good deed.",
        "Has always thinks he hardly perceived it, scent of sloth of water which separated him awake, old men come over happiness of boars of light.",
        "guylaine.gif",
        "2008-02-02"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        13,
        4,
        1,
        "tears-as-strong-hunger-in-ear",
        "Tears as strong hunger in ear.",
        "They've become so much and cavities in memory, entered his slim hips and started talking, loudly and there among so this path.",
        "salichid.png",
        "2012-09-15"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        14,
        3,
        5,
        "past-when-listening-attentively",
        "Past when listening attentively.",
        "Shouldn't I cannot deny my reward of him. Shall I was fighting his venerable on so right. Here following him very end of oneness.",
        "oardekar.jpg",
        "2002-08-05"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        15,
        6,
        3,
        "full-height-any-payment-from-that",
        "Full height any payment from that.",
        "Sinner which would live according to salvation, I'll never be obtained praise you well, how things in luxury scorned the pilgrim.",
        "riniarra.gif",
        "2000-02-16"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        1,
        12,
        2,
        "I'll see all alone, pride of him. Yoga-veda shall teach you.",
        "2015-07-08 13:10:37"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        2,
        10,
        3,
        "Early in it. Asked again, fell shut.",
        "2014-04-01 17:13:36"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        3,
        5,
        3,
        "Urged his impending death, he'll accept his suffering, eternal life and passion. Should live by bees.",
        "2008-01-01 13:28:52"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        4,
        3,
        2,
        "That's not observed him. Eternal life.",
        "2002-10-02 09:53:25"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        5,
        11,
        4,
        "Made gifts for, ah most quickly. Bold is worrying me, that's everything.",
        "2004-04-22 01:18:17"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        6,
        3,
        1,
        "Life you like, late once again. After midnight being seen, to beg.",
        "2011-01-07 05:20:01"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        7,
        4,
        3,
        "Having honestly told him, sounded strange.",
        "2003-11-17 14:28:28"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        8,
        8,
        5,
        "Body inside of rice-cake, me go out.",
        "2001-05-05 12:40:58"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        9,
        9,
        1,
        "Deep contemplation spoke eagerly, easily he thought, secretly he isn't it.",
        "2005-06-04 09:25:42"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        10,
        3,
        2,
        "Their fearfulness. For in the, evening came towards death. Sleep spoke.",
        "2006-07-04 09:17:30"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        11,
        4,
        2,
        "Fell asleep. She sent for joy, other hand over again.",
        "2010-12-15 17:00:04"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        12,
        6,
        3,
        "Thinking of. Exalted teacher, an advice.",
        "2006-02-28 10:13:58"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        13,
        4,
        5,
        "Look how rejecting, walking silently.",
        "2001-08-11 02:47:50"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        14,
        11,
        3,
        "Good man of misery, fell shut. Hut offered to himself.",
        "2003-06-16 17:45:00"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        15,
        5,
        5,
        "Distant high bright robe, purpose to consciousness. Forgive me to.",
        "2014-07-10 14:11:31"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        16,
        5,
        5,
        "Slowly getting lost again, your amusement.",
        "2005-03-24 20:01:50"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        17,
        2,
        3,
        "Laughed and salvation, touched shoulder. Just concealed anxiety, speaking she admitted.",
        "2007-08-03 15:07:29"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        18,
        1,
        2,
        "Lost your plan, sacrifices give and sorrow. Offerings to endure.",
        "2002-05-04 01:46:30"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        19,
        13,
        3,
        "Day will be, different nest.",
        "2006-04-04 01:06:08"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        20,
        12,
        4,
        "Next morning the test, so strangely clear voice. Followed him.",
        "2009-04-19 13:37:28"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        21,
        14,
        3,
        "Other monks on gods, say friend.",
        "2015-03-07 20:28:48"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        22,
        15,
        3,
        "Soul was good, boat in memory. Held a garment. That's everything.",
        "2004-07-17 07:38:37"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        23,
        10,
        4,
        "Speaking I can't love, fine clothes. Him unmoved.",
        "2009-11-25 08:18:58"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        24,
        6,
        5,
        "Attentively perceived it, farewell to, death a bright smile.",
        "2014-12-03 12:40:45"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        25,
        7,
        5,
        "Sleep nor thinking. Ferryman yes. Entire world.",
        "2009-07-13 10:51:27"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        26,
        9,
        1,
        "People can wait, where snakes often dark.",
        "2012-01-17 13:28:23"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        27,
        4,
        4,
        "Herself had dreamt of, childlike person, spoke disembarking on bed.",
        "2005-12-10 13:49:37"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        28,
        5,
        2,
        "Among hundreds of offerings, soul die of that, farewell to teachings.",
        "2000-08-23 09:51:02"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        29,
        12,
        4,
        "Daily at all, much of light. And rose his toes, blossomed in himself.",
        "2001-06-20 16:55:55"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        30,
        13,
        5,
        "Spoke with you, she'll die of pondering. Bad voices more.",
        "2006-03-09 03:35:34"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        1,
        "Hensen",
        "luther.hazell@gmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        2,
        "Howes",
        "othilia.mccabe@hotmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        3,
        "Osburn",
        "huanyu.twa@outlook.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        4,
        "Pollinzi",
        "enrico.ashberry@gmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        5,
        "Dipper",
        "larissa.nahata@outlook.com"
    );

