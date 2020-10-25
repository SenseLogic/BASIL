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
        "He's strong the multitude of ill-humour of offerings, he'll entrust you not bother your love, mumbled a filled her garden to occupy them. She'll die of good enough to forget him.",
        "ooksarba.gif"
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
        "Thoughts were long strides started bidding his shadow, interrupted him committed a learned being just travelling. Nodded in thought wondrous detours it himself fall.",
        "cararsyu.gif"
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
        "Rarely spoke for oneself which these reports, exalted one moment that but its title, at odds with only be one how still thus.",
        "omagirov.png"
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
        "Dreams flowed on shoulder turned to scold him, I'm fighting his youth who petitioned him. As strong hunger gave the permission my stomach.",
        "akrameve.png"
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
        "Without fear and lovely is leaving monk stopped, waiting thinking with dancing girls the uniformity of all. Entered soul slowly lose or another than his. Touched with contracted pupils begging with great secret.",
        "illavisu.gif"
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
        "Body became lovable even the job was useless, and face as far removed from teachings from him. Harmony knowledge that of discontent of expertise.",
        "halamaru.png"
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
        "Down felt death of sickliness of thousands, young that learning which seems to you practise meditation, wheel of discussing all into lust the chimpanzee.",
        "oscarrox.png"
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
        "+41 407 240 580",
        "Conerly Alley",
        "Berrysburg",
        "9067",
        "Ontario",
        "Samoa",
        "Desoto Trust",
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
        "+85 917 629 935",
        "Hudecek Street",
        "Protem",
        "1561",
        "Maryland",
        "Sri Lanka",
        "Fleischer Security",
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
        "+65 611 873 667",
        "Clayton Street",
        "Chilo",
        "2179",
        "Virginia",
        "Lebanon",
        "Sarbutt Fx",
        0
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        4,
        "Gerald",
        "Tooley",
        "gerald.tooley@hotmail.com",
        "geraldtooley",
        "Uger.o5svir",
        "+41 828 356 865",
        "Thuswaldner Drive",
        "Sherman Station",
        "7993",
        "Iowa",
        "Moldova",
        "Wendling Labs",
        1
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        5,
        "Deb",
        "Mcmillan",
        "deb.mcmillan@live.com",
        "debmcmillan",
        "win3y&zH",
        "+17 823 593 780",
        "Wiley Court",
        "Paden City",
        "4945",
        "Newfoundland",
        "Israel",
        "Mirza Solutions",
        0
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        1,
        7,
        5,
        "long-meditative-recitation-of-good-for",
        "Long meditative recitation of good for.",
        "Pride flared up here I used the distant son, merchant with resistance and by fasting nor their end, whenever embarrassment and when they followed it can wait.",
        "ettearse.jpg",
        "2000-08-16"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        2,
        1,
        3,
        "truly-i-m-old-man-s",
        "Truly I'm old man's.",
        "Majority of truth can love nobody may go out, until no teaching you found to obtain money. Son she put into a dreary and evening.",
        "jasagnon.jpg",
        "2001-05-14"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        3,
        6,
        3,
        "hours-sat-lost-in",
        "Hours sat lost in.",
        "Would talk to weep petted her friend, had seen her old spoke with wide golden cage. Truly come up I ran along pondered.",
        "ricausba.jpg",
        "2001-07-26"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        4,
        2,
        1,
        "young-vain-fleeting-pleasure",
        "Young vain fleeting pleasure.",
        "Went out motionless cold in beautiful women that you're. Secretly he speak them because we can understand, you want back after having to an eternal not-finding.",
        "tanoetti.jpg",
        "2010-06-19"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        5,
        1,
        3,
        "will-study-and-my-destiny",
        "Will study and my destiny.",
        "Told about losing my thoughts listened silently. Previous births and sleeping man sometimes suspected what else, will fall straight down differently the fearful man. Nevertheless always watched them died how peaceful his students, senses the delusion finds everything the business.",
        "carovisu.jpg",
        "2011-02-02"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        6,
        4,
        4,
        "your-areas-of-it-my-pleasure-garden",
        "Your areas of it my pleasure-garden.",
        "Oldest our venerable teacher teachings again turned gray, yesterday greeting me without clothes fine clothes, one half of words so long time. Wondrous teachings was alive the school of patience, better for seeding lovers loving mothers nursing their worries.",
        "teretisu.jpg",
        "2009-05-08"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        7,
        1,
        5,
        "it-valuable-and-as-smart-eyes-a-comedy",
        "It valuable and as smart eyes a comedy.",
        "Speaking I might come and we'll continue learning, should tell me they go back inside. Shimmered his garments and always get on it, speaking which more spiritual one awaited not feel.",
        "ichipnik.gif",
        "2004-02-12"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        8,
        2,
        5,
        "slowly-and-letters-i-used-to",
        "Slowly and letters I used to.",
        "Mute who flock here under the exalted, over drifted far removed from them except to live, warrior and as such clothes to spell.",
        "vilarbok.jpg",
        "2011-08-11"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        9,
        1,
        3,
        "sacrifices-give-you-forsaken-me-of-worship",
        "Sacrifices give you forsaken me of worship.",
        "Shall become a dying people in return. Shall find salvation was stone your child, leaned against its layers to satisfy me honourable one, opened mouth on she lay himself mocking me.",
        "ustawavi.png",
        "2000-12-20"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        10,
        5,
        5,
        "arrow-fast-he-repeat-all-this",
        "Arrow-fast he repeat all this.",
        "Isn't every exercise often that night lasted a burden, bold is a gap which could teach you. Stone is enough I even a freshly cracked fig. Smiled quietly flowing forms was enough to cling him.",
        "darillew.png",
        "2014-03-08"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        11,
        7,
        3,
        "stood-alone-with-very-own-suffering-for-riches",
        "Stood alone with very own suffering for riches.",
        "Reached ears who wanted for bread and fell asleep, among his lips that I'm not you. Could force him standing there too can think, harmony knowledge you also awoke to in her will, beckoned him quietly his kind can't do this.",
        "pacanivo.jpg",
        "2009-01-03"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        12,
        1,
        3,
        "me-from-living-his-stakes",
        "Me from living his stakes.",
        "Name the thirty or foolish but words exclaimed, it now they shall reach their mind. Arriving at one has done well be learned, listened gratefully to hate you took possession and beggar. Urged him commit his tenderness his goal.",
        "aughwojo.png",
        "2007-08-28"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        13,
        6,
        3,
        "simply-believed-his-slim-hips",
        "Simply believed his slim hips.",
        "Sat with dusty and cut his walk. Made friends continued but he belong to, and business of lust the fasting waiting thinking.",
        "alladgos.gif",
        "2010-05-08"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        14,
        4,
        2,
        "touched-with-which-could-i-also-thank-you",
        "Touched with which could I also thank you.",
        "Farewell from her fan of enlightenment hit him. Love my thought that aside from myself any sleep, bid him happiness something have thrown away with this, her old could approve of ill-humour of disgust. At bottom of happy manner and treated the visible.",
        "ouretris.gif",
        "2009-01-22"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        15,
        5,
        4,
        "i-ve-found-neither-hair-on-shoulder",
        "I've found neither hair on shoulder.",
        "Without the longing voice he greeted her eyes, stood silently went to work beautiful woman. Fine shoes they came along my forehead. Wants to start the leaving with unrest filled with.",
        "elemlaco.gif",
        "2001-10-18"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        1,
        10,
        4,
        "Boy ran without money learned much wisdom. No learning easily thus much of enlightenment.",
        "2002-10-23 13:43:18"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        2,
        1,
        3,
        "Few words place more quiet, soul fuming from me know him. Mute gaze and stayed for twenty-eight days.",
        "2009-09-12 01:07:00"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        3,
        5,
        4,
        "Bad talk to your amusement, farewell river nothing quietly ashamed. I've never stopped thinking fasting is present, ran and at times but never satisfied.",
        "2002-11-19 03:44:44"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        4,
        10,
        1,
        "Followed it so be sad, truly the meditation had followed him. If you make offerings were these waters. Questions but a word of teachings.",
        "2007-02-04 11:13:11"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        5,
        13,
        3,
        "Can love seems I thought, lost again which rich man. For his spirit loses its start there.",
        "2004-07-10 19:06:29"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        6,
        9,
        5,
        "Their position of merciless self-denial, deaf and learning from following him. I met his stakes that obstacle, also no emergency for your exalted teacher.",
        "2003-04-18 11:49:55"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        7,
        4,
        1,
        "There too can after so well. Were quiet passion and deed. Meditation holding your trainee for them.",
        "2005-02-07 03:45:35"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        8,
        7,
        3,
        "Look eternal itself all this, somehow happened occasionally dreaming at once. Takes everyone can understand this, it's true essence bearing his solid staff.",
        "2005-10-19 20:25:04"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        9,
        2,
        3,
        "Stayed there perhaps reciprocate it, ferryman like that man of talk. Near it makes when you've turned gray.",
        "2009-12-25 00:42:54"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        10,
        13,
        5,
        "Travellers stay for directions for yourself, without stirring a servant prepared to enlightenment. Seeing that most shameful life.",
        "2003-09-28 23:32:41"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        11,
        13,
        1,
        "Out of old ferryman had reached them. Late at me and worldly life.",
        "2010-11-27 10:17:23"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        12,
        8,
        1,
        "Were well your kindness towards him. Say what has that ferry.",
        "2000-03-08 13:30:56"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        13,
        6,
        4,
        "Don't mind flowing forms of their pouches, lust was pregnant from mine.",
        "2003-09-03 15:00:39"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        14,
        6,
        3,
        "Worry in ear his teachings, apparently he neither hair out to die.",
        "2006-06-27 14:48:08"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        15,
        8,
        3,
        "Wouldn't want you know love words, join water and stranger searching. An era was following a thought.",
        "2007-02-01 08:37:43"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        16,
        4,
        5,
        "Taught my dear you've thought walking silently, with him satisfy me my hut.",
        "2003-09-15 10:55:32"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        17,
        11,
        2,
        "Source murmured which teacher for this, bowed with reluctance to the.",
        "2005-03-16 00:41:40"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        18,
        9,
        3,
        "Accepted it could force him, among carters and shadow of other thing. Harmony knowledge that I prefer the world, stayed behind him awake into his goal.",
        "2012-09-26 03:52:28"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        19,
        8,
        5,
        "Sounded the first roof for finding, placed his glance realized her friend's face, but let it destroying it as true. Clothes I hadn't been strange.",
        "2010-04-07 20:54:01"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        20,
        3,
        4,
        "Young had made who used crude swearwords, way also surrounded by this. Kindly he passes through enlightenment hit him.",
        "2004-07-06 01:58:54"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        21,
        4,
        3,
        "Everything he wrestled but become so irrefutably, urged him over in confirmation. Near thus blindly and unleash it, afterwards when his best times to speak.",
        "2008-01-18 03:31:18"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        22,
        10,
        1,
        "Ablutions were thoughts stopped searching, when little pleasures and veneration in the. He'll return and wavers and beautifully, good to pay could no future.",
        "2002-05-07 22:05:21"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        23,
        8,
        4,
        "Broke loose embraced him do so. Were two old tired mouth her sedan-chair, pilgrims shall please you need.",
        "2013-10-19 15:34:06"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        24,
        9,
        3,
        "Still find only saw mankind going to. Looking up paced to enlightenment, majority of water thus childlike.",
        "2009-02-23 13:43:16"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        25,
        3,
        2,
        "Made money filled me live it, monks used to laugh he thought. Previous births were not fall of talk.",
        "2001-04-21 00:10:56"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        26,
        6,
        1,
        "Ferryman laughed this soft bed, someone always working the boy. Life hardly perceived it rarely talked incessantly. Both neither preferred self-castigation so clearly.",
        "2007-03-25 09:47:42"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        27,
        5,
        2,
        "Us accept alms move on, people own words delicate very spot.",
        "2004-07-04 21:45:53"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        28,
        1,
        1,
        "False god when we who come back, lost them he went outside. Knew everything smelled of one was dead. Both neither had passed quickly.",
        "2000-08-06 09:48:08"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        29,
        12,
        1,
        "The quietly looked upon him, business and impatient when playing with sadness.",
        "2004-06-21 12:38:05"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        30,
        14,
        1,
        "Occasionally dreaming at odds with defamation, bad voices very divinity's way said, got near it voices consisted of words.",
        "2012-11-03 09:26:25"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        1,
        "Kerwin",
        "minnaminnie.ting@yahoo.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        2,
        "Hendren",
        "fania.mcneill@mail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        3,
        "Kpodzo",
        "count.nezon@yahoo.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        4,
        "Rafferty",
        "freya.miello@yahoo.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        5,
        "Kavanagh",
        "ariella.cocosarchive@mail.com"
    );

