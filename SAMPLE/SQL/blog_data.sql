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
        "Salvation and put an unwavering openness and through life. Yet shining in one's body like him, afterwards insight came along the heads of questions, of reflection of coming to cheat him found peace.",
        "wicendym.jpg"
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
        "Always get along this old man went and beautifully. Knew his worldly pleasures of fasting what else, stone and bitterly thought it voices laughing along pondered. Goal when the sleep again you're mocking voice, rose to overcome the story containing so long.",
        "giarudol.png"
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
        "False god had forgotten that evil words. Words through his he put an infinitely distant son, them suffering because I sir from under my hair.",
        "allideso.jpg"
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
        "Have recognised it will die than of him, want to earthly things are called name. Indignation is time to hear these things.",
        "estoltze.gif"
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
        "Eternal perfection of heat and murderer and distant spot. Attentively to open thus free thus childlike people, I'm giving and quietly as bright robe, sir intent to all was getting lost. Everything came when you'll be sleeping said to.",
        "artianse.gif"
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
        "Indignant he conducts for whatever he stopped suffering, smiling he himself every tavern of thousands. Never fully become even as old face, thing friend let go into its surface, who used to their vanities desires for twenty-eight days.",
        "lorianne.jpg"
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
        "From me from horror in to her, owned locked the pleasure-grove which is our foolishness. Were one time to fill the cycle, secretly he whispered to ear his senses. Got to side with that line which goal.",
        "iambader.png"
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
        "+18 313 248 989",
        "Glofcheskie Court",
        "Depew",
        "4875",
        "Manitoba",
        "Qatar",
        "Edwin Group",
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
        "+86 117 804 631",
        "Bois Avenue",
        "North Eaton",
        "8123",
        "Northwest Territories",
        "Equatorial Guinea",
        "Okafo Media",
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
        "+62 928 789 603",
        "Cohoe Boulevard",
        "Alston",
        "7438",
        "Alabama",
        "Lesotho",
        "Dong Team",
        0
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        4,
        "Magdalen",
        "Castronova",
        "magdalen.castronova@outlook.com",
        "magdalencastronova",
        "ne?l0andHy",
        "+89 596 394 859",
        "Nekueey Park",
        "Avenue",
        "3840",
        "Ohio",
        "Japan",
        "Beaulieu Central",
        0
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        5,
        "Tani",
        "Dimillo",
        "tani.dimillo@outlook.com",
        "tanidimillo",
        "aHt-elu2",
        "+75 664 627 129",
        "Malyszka Lane",
        "Wilton Center",
        "5427",
        "North Dakota",
        "Lithuania",
        "Nill News",
        1
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        1,
        4,
        2,
        "yesterday-greeting-her-will",
        "Yesterday greeting her will.",
        "Laughed surely I might you recognise the fields, does who would use on new body. Bold is perfect equanimity and salvation from it, quietly to begin my refuge with doubt, business with honours or entirely holy man.",
        "oplibero.png",
        "2000-10-04"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        2,
        2,
        4,
        "looked-up-all-voices-in-all-this",
        "Looked up all voices in all this.",
        "Mouth by and early pre-birth of sloth, more nor did as novices taken away. Hut thinking again returned into rain and offered him, worry said I don't comprehend why don't I. Lost colour and river going on that in you.",
        "milenale.png",
        "2000-01-03"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        3,
        4,
        5,
        "fully-become-his-debtors-more-thing-great-secret",
        "Fully become his debtors more thing great secret.",
        "Up all thinking precisely as any longer back, proper merchant had neither happy manner and denial. Followed it away time for twenty-eight days, you're on many thousands of people can't. Isn't forced his business was part and money.",
        "eillarto.png",
        "2004-10-19"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        4,
        2,
        4,
        "late-once-said-nothing",
        "Late once said nothing.",
        "Where would only knew the nights every joyful desire. At and uniform law and becomes void, talking to teach it must follow that, merchant was obtained by throwing out over by bees.",
        "donnarub.jpg",
        "2004-02-13"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        5,
        3,
        4,
        "placed-him-is-life",
        "Placed him is life.",
        "How do what will build funeral pile, smile remained forever that has had shone golden cage. Always there aren't you may go on, ablutions were still unable to occupy them.",
        "karissak.jpg",
        "2003-07-26"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        6,
        4,
        2,
        "or-five-the-multitude-of-paths",
        "Or five the multitude of paths.",
        "Young wishes of wine from who seek depth, nodded for the basics about spiritual than anything. Wouldn't take place filled her fan of misery. Himself to others tell me with this.",
        "idhulice.jpg",
        "2008-10-14"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        7,
        1,
        2,
        "followed-him-came-along-pondered",
        "Followed him came along pondered.",
        "Read for children are already of coming back. Apparently he briefly escapes and singing and there, heard its contents of words so right. Out for nothing will seek death there is divine.",
        "ithersen.gif",
        "2005-05-06"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        8,
        1,
        3,
        "shouldn-t-i-listen-better",
        "Shouldn't I listen better.",
        "At this touch and divine which more from horror, made several bows with veneration by great knowledge. Thing I am still found refuge to give, courtesan bent down picked up for twenty-eight days.",
        "kadurcoj.gif",
        "2001-07-15"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        9,
        4,
        5,
        "soon-saw-him-weep-petted-her-eyelids",
        "Soon saw him weep petted her eyelids.",
        "May I read it attentively perceived it. Conducted him lured him and looked like to sleep, good being one only smile how do so. Travelled back hour my mind me of oneness. Enchantment which reminded him just travelling without possessions.",
        "ipchubon.gif",
        "2012-03-10"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        10,
        7,
        4,
        "well-and-without-hesitation-these-words",
        "Well and without hesitation these words.",
        "Courtesan had the glow of friendliness every creature, arrow-fast he knows such trifles to avoid evil, monk looked up felt hope flowed any given.",
        "alladeje.jpg",
        "2009-11-25"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        11,
        7,
        4,
        "flesh-and-deaths-this-my-pleasure-garden",
        "Flesh and deaths this my pleasure-garden.",
        "Greed from had slowly drop laden with it, softly and worries pleasures of heat cooled him safe. Continued thinking hours and what of awakening one the, glance before read this even he dreamed this, know has always obeyed the order to give.",
        "eighellu.gif",
        "2008-03-09"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        12,
        3,
        4,
        "both-male-sheep-following-day",
        "Both male sheep following day.",
        "By on to awake which consisted of a, so rich in learning all resistance in return. Knew deep joy all voices at your teachings, most base of sun again now an opinion.",
        "anguvihy.gif",
        "2005-08-22"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        13,
        7,
        3,
        "business-he-slowly-getting-a-searcher-venerable-one",
        "Business he slowly getting a searcher venerable one.",
        "Before and hidden behind then have observed him, which he became the visible sought another time, fled back right one should still his language. Of everything together and of sounded new.",
        "orsokoon.png",
        "2008-05-06"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        14,
        3,
        3,
        "friend-son-my-glance",
        "Friend son my glance.",
        "Non-eternal things were trees stars of rest now, let go at some news had experienced. Has entered your little pleasures these things.",
        "insutchy.jpg",
        "2013-09-01"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        15,
        5,
        5,
        "wouldn-t-force-you-see-everything",
        "Wouldn't force you see everything.",
        "Taught my joy any work for worshipped river, previous lives of waiting opened soul when buying bananas. Any passion came to and worries as ever, clothes I do we are destined to bear. One chatted with themselves floated along pondered his situation.",
        "antimeun.jpg",
        "2012-01-17"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        1,
        15,
        2,
        "Bowed touching his slim hips. Often and love nobody counted them, teachings he remembered that secret of. Hours sat with me something real.",
        "2009-04-04 11:27:13"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        2,
        7,
        1,
        "Then said everything to please my brothers, often the creation of teachings.",
        "2004-03-15 20:40:03"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        3,
        15,
        1,
        "Way had spent his arm, stood by friendly knowing patient is proven.",
        "2001-04-19 22:14:15"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        4,
        10,
        4,
        "Saw anything without a sound, propelling themselves they did sense very grateful, bad people own and me yet.",
        "2000-04-27 10:04:28"
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
        "Smiling he once before been bitten, scent of elephants of merciless self-denial, whispered to thank you will meditate. Haven't thought the state he captured him.",
        "2007-02-07 09:54:14"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        6,
        15,
        5,
        "Did and months passed quickly. And lived behind him dressed people, rest to bed for himself.",
        "2015-05-26 23:50:47"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        7,
        12,
        1,
        "Blind wild desire no my self, face the mountains everywhere at hers. Hasn't it is dangerous to speak.",
        "2012-09-25 16:48:07"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        8,
        14,
        5,
        "Stared at one needs to friend. Love anybody or third-hand information, kindly he stood at it. Ate fish with none of age.",
        "2013-08-28 12:25:33"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        9,
        4,
        2,
        "It's not allowed to argue with respect. Willingness my loving mothers nursing their travels.",
        "2001-02-22 12:42:44"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        10,
        14,
        5,
        "Could accept alms and teachers that you, everything has been submerged his life. People of our kind of thought, curious more that everything could teach you.",
        "2003-03-25 14:13:22"
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
        "Pilgrims shall please not heard that all. Tears as dust of reeds he replied, merchant and watched it be said nothing. I've been entangled a banana tasted power.",
        "2005-10-15 02:06:06"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        12,
        8,
        2,
        "What I've learned among the world, though our hair on to its surface. Over quiet town where do it. Worry said nothing yet asked himself.",
        "2011-08-20 06:57:33"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        13,
        13,
        4,
        "Leaned to some among people. Myth this is it my cousin in.",
        "2011-06-23 10:45:52"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        14,
        10,
        5,
        "Her grove like oil in my hair. Thinking is just knowing patient, does really died a pilgrim. By friendly heart stirred up.",
        "2013-07-27 04:59:31"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        15,
        4,
        1,
        "Came who is small near to sleep, placed him became disobedient heart rejoiced. Secretly he nodded for twenty-eight days.",
        "2015-03-20 12:51:35"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        16,
        11,
        2,
        "Merchant and not worthless it any more, laughed brightly the blue river farewell. Wonderful and strangest of them.",
        "2011-02-01 08:57:53"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        17,
        12,
        1,
        "Gloomy intoxication of hundreds of their fearfulness, without doing anything new rules. Black ones with his sexuality moving.",
        "2007-01-03 16:50:51"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        18,
        2,
        5,
        "Whom else he gathered dust, dreams came and lustful pleasures for finding. Distorted her eyes looked down right away.",
        "2002-09-04 15:12:49"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        19,
        12,
        2,
        "Deeply like them because to experience. Heard talk with honours or foolish world. Language would understand yet did the courtesans, thing had assumed one with enticed me.",
        "2004-02-28 01:19:09"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        20,
        9,
        4,
        "Listen and knowledge but destitute, wonderful sleep nor drink wine. Sounded new life was sleeping, sir it many errors through your mouth.",
        "2001-11-27 03:53:22"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        21,
        15,
        1,
        "Means that what I'll be passed quickly, are causes sloth of mere words, arrow-fast he died alone without food.",
        "2002-01-18 14:23:01"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        22,
        12,
        4,
        "River of paper and voice sang. Apparently he did not succumbed to kiss. Mouth was worthwhile looking for.",
        "2013-04-25 07:27:49"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        23,
        12,
        5,
        "Near perfection and don't dare, other boys and lots of thought. You in positions 'ere the one, putting me too sweet things you'll see.",
        "2006-04-16 09:25:24"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        24,
        8,
        2,
        "Followed by was able to fast. He'll find only thing friend, than could escape from myself.",
        "2011-03-02 17:51:35"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        25,
        2,
        5,
        "Bent down felt it her will, nothing but she was gathering like bees.",
        "2008-11-19 19:15:40"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        26,
        5,
        5,
        "Love from following the mango-tree his situation, travelled to reach people can't love. Having passed rose the pangs of a, blossomed slowly left with her.",
        "2002-04-26 21:13:57"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        27,
        1,
        4,
        "Better for knowledge I too much, else might oppose the golden bracelets clanged.",
        "2003-02-23 15:08:04"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        28,
        14,
        3,
        "Accustomed to those childlike people own, among girls and heard their paths. Spared from walking when you'll see.",
        "2012-10-06 18:59:31"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        29,
        15,
        1,
        "Pleasure also animal and joyful desire, if his shoulders his hand, aren't the likes I went outside.",
        "2011-02-26 14:45:23"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        30,
        5,
        4,
        "Else could hurt you like, thanked her house there'll still lacks.",
        "2014-03-19 09:46:08"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        1,
        "Sumner",
        "sukey.lund@yahoo.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        2,
        "Mcinnis",
        "corissa.zaid@hotmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        3,
        "Esguerra",
        "alysia.pietropaolo@hotmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        4,
        "Eriksson",
        "lizabeth.warwick@yahoo.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        5,
        "Vandewouw",
        "emilie.gravitt@hotmail.com"
    );

