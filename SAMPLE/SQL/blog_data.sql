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
        "His light like being I thank you. Loved everybody he believed in them for knowledge, awakened as defeated him by the hidden so right.",
        "bucacket.gif"
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
        "Being just the near which tasted bitter, write the possessions said with perfect respect, and divine forgiveness in and being a.",
        "winerrik.png"
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
        "I'll leave he share his destiny upon yourself, goal when I'm travelling by sleep spoke sadly. Heard him given me the entrance to bear.",
        "anderget.gif"
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
        "Years which seems to myself want to smile, whenever embarrassment and preserved by begging ones, remained within himself completely concentrated soul the field.",
        "owraroru.gif"
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
        "Leaned to bustle about and evil words, sounded new one was river flowed on. Ah you read it hating it importance.",
        "agnessed.gif"
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
        "Greed from him weep petted his father's face, business of my pilgrimage followers of that. Another after his age just lighting the path. Gives strength in fear of transitoriness in ear. Son is also talk wisely my pleasure-garden.",
        "sueannes.gif"
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
        "Saw rising over the house there too modest. Whom else to war of offerings were waiting, know where it a calmness when fell shut. Can learn quickly and others more he thought. Ate fish costs and trust so good.",
        "bufordip.png"
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
        "+33 629 632 387",
        "Culmer Avenue",
        "Cotton Valley",
        "8876",
        "Pennsylvania",
        "Niger",
        "Kokkat Software",
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
        "+18 545 743 676",
        "Gauthier Boulevard",
        "Waite Park",
        "4498",
        "Rhode Island",
        "Botswana",
        "Rupert Online",
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
        "+55 671 745 432",
        "Godse Court",
        "Ariel",
        "7342",
        "Prince Edward Island",
        "Qatar",
        "Goins Point",
        0
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        4,
        "Danial",
        "Mcgrath",
        "danial.mcgrath@mail.com",
        "danialmcgrath",
        "Vtab9insip&",
        "+44 310 953 392",
        "Kearney Court",
        "Port Barrington",
        "9517",
        "Oregon",
        "Togo",
        "Haubert Network",
        1
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        5,
        "Altay",
        "Burrus",
        "altay.burrus@gmail.com",
        "altayburrus",
        "eDelebi3e-",
        "+10 973 723 797",
        "Mahendra Park",
        "State Park Place",
        "1015",
        "Mississippi",
        "North Korea ",
        "Moriyama Associates",
        0
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        1,
        3,
        1,
        "after-years-passed-on",
        "After years passed on.",
        "Has distinguished himself back and changed a farewell, sounded sweet drop out for by words exclaimed. What's the habits and female animal in you, sat the work there yesterday greeting his chin.",
        "arkackes.png",
        "2011-04-15"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        2,
        4,
        3,
        "pride-of-something-have-it",
        "Pride of something have it.",
        "Image also being separated from walking silently. And beats in their fields nobody may his hand, once said thoughtful words bent down on all life. Gives merchandise in yellow in circles we progress.",
        "mocharal.jpg",
        "2004-05-18"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        3,
        7,
        4,
        "good-or-she-him",
        "Good or she him.",
        "Who offered to coming from me about, bid his steps full he will subdued him asleep, indignation is unlikely for dwell on shoulder. Weren't you never talked about her grove I do, came he too so high trees and worry said.",
        "ahoppopy.jpg",
        "2007-05-21"
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
        "me-go-and-both-male-sheep-following-day",
        "Me go and both male sheep following day.",
        "Young bird of discontent in blissfulness in one's heart, takes everyone would stay and don't forget that. Deep love of among thousands threw away like me, previous life in again bowed touching him. Awakened and gifts as these verses exclaimed lamentingly.",
        "alobaufu.jpg",
        "2001-07-05"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        5,
        4,
        4,
        "sir-am-not-imperfect-or-human-being",
        "Sir am not imperfect or human being.",
        "Her she lay stiff legs greeting me. Stayed on your free myself from that. Tales and in persuading him whenever they lay hidden. Body nor you call `things actually a pilgrim, blossomed slowly and yet shining back under their secret.",
        "owskumpy.jpg",
        "2002-03-12"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        6,
        5,
        3,
        "everything-and-confessing-felt-it",
        "Everything and confessing felt it.",
        "Wants to something very gray for him, rose from and images appeared and right path. But also still unable to do know people can. Language would meet the art well the wrists.",
        "ornombox.png",
        "2005-04-27"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        7,
        2,
        5,
        "we-both-perceived-it",
        "We both perceived it.",
        "Will never satisfied with learned as one another, they reached and happily was travelling on her sedan-chair. Haven't you've last day of unexpressable by any other, reached it go and gifts as alike to bear, sleep properly again when a golden cage.",
        "ennuldeb.jpg",
        "2002-12-14"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        8,
        4,
        1,
        "goal-a-strange-foolish-game-which-was",
        "Goal a strange foolish game which was.",
        "Harmony knowledge and holiness wisdom not addressing with hunger, looking at head nor others a father. Be there only I confess to remember this yet.",
        "oolwicar.jpg",
        "2009-03-11"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        9,
        3,
        2,
        "never-one-sided-all-existence",
        "Never one-sided all existence.",
        "Venerable teacher teachings for and went into a burden, would get closer and shy he must follow that, told about words to find his companion his worries. Awakened as dust had occupied their best thought. Just one moment these so you've turned gray.",
        "petorefa.gif",
        "2005-09-13"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        10,
        2,
        5,
        "salvation-was-as-this-side-he-is-small",
        "Salvation was as this side he is small.",
        "Entered for sixty years passed to humans in grief, thus open waiting to consciousness the hidden. Rich for their control he as soft bed, at bottom of differentiation for fifteen days. Watched him one not let the who petitioned him.",
        "morapasy.jpg",
        "2013-04-09"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        11,
        2,
        1,
        "bad-voices-consisted-in-this-which-was",
        "Bad voices consisted in this which was.",
        "Pilgrims do this rushing river has taken away, your words enter his memory had felt different goal. Daily he a third of worry in memory.",
        "hiusaila.png",
        "2002-12-11"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        12,
        5,
        4,
        "man-walking-silently-into-vapour-and-peace",
        "Man walking silently into vapour and peace.",
        "Won't and learning and a little to go. Times the smell of existence since he a goal. Are awaiting him into every physical form. Stood there always picked them went outside. Gives such trifles to awake properly again.",
        "piyusheu.png",
        "2007-08-02"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        13,
        7,
        5,
        "oldest-monks-are-like",
        "Oldest monks are like.",
        "Lost a common not committed all existence. Somehow happened more similar he shall teach you, simply believed his time to spring from following day, here a sales-contract had abandoned by many holy man.",
        "adalosyh.jpg",
        "2008-04-28"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        14,
        3,
        4,
        "too-felt-his-father-and-river-laughed",
        "Too felt his father and river laughed.",
        "Having abused by receiving it necessary was without thinking, sadness and images and death is fasting, yesterday greeting her dress becomes old my pilgrimage said.",
        "ortarten.png",
        "2000-06-11"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        15,
        4,
        2,
        "flesh-and-sleeping-man",
        "Flesh and sleeping man.",
        "Thanked her left his nor prayer admonition. Walked again suddenly as alien something honourable one, another live instead warmer more mockingly laughing gods. Deaf and beggar as most foolish world beyond, join water thus sufferingly thus free again old man's.",
        "julances.gif",
        "2015-12-26"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        1,
        2,
        2,
        "Without one helping you hear, or ice like good friends.",
        "2001-10-04 02:17:29"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        2,
        14,
        3,
        "Soul is leaving one's thoughts. Hours of nicely dressed people. Again returned stepped the city.",
        "2015-05-17 16:15:22"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        3,
        8,
        5,
        "Son appeared to spare your name is, got bloated stank it spoke little. Too soft yet asked it.",
        "2011-05-12 03:12:28"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        4,
        10,
        5,
        "Sounded the whole world did his eyes. An accusation in yellow in everything, yes and played the stone.",
        "2009-08-13 20:08:10"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        5,
        15,
        5,
        "Having had thrown away like me, all teachers began that ferry. Looking into a perfected one.",
        "2015-04-15 02:15:46"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        6,
        13,
        1,
        "Close to perform the mango-trees. Rose and greeted one never since then, finding means that goal when my thoughts. Continued walking when a garment.",
        "2009-06-18 05:28:51"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        7,
        15,
        3,
        "Meditation there before been sleeping answered, until his eternal characteristics as.",
        "2012-04-27 05:16:18"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        8,
        1,
        3,
        "Thinking had left the childlike person. Whom is useful for her, takes everyone gives merchandise in them, scent of disgust came when we won't.",
        "2008-02-23 07:04:26"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        9,
        7,
        1,
        "Conducted his mourning for nothing, sun tanned his greeting you. Thus they did his tale.",
        "2005-12-16 06:36:46"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        10,
        10,
        1,
        "Saw and wanted for this, have met such hair is better. Always move from living joy I do.",
        "2010-07-08 06:15:54"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        11,
        11,
        1,
        "Ferryman had commanded him bread and lazy, nothing about and mysterious was incessant cheerfulness.",
        "2011-08-09 09:48:56"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        12,
        13,
        4,
        "Do it had asked himself. More since it because striving for you.",
        "2002-01-22 02:16:11"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        13,
        4,
        2,
        "Continued walking back to myself, greeted her with his language.",
        "2009-07-23 08:59:38"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        14,
        9,
        4,
        "By myself in this she said to, quietly let's not scorn the funeral pile. Distant son has lived hidden at night.",
        "2015-11-19 20:56:17"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        15,
        14,
        1,
        "Childlike or ugly years losing my thoughts. Smart eyes see all perceived it.",
        "2015-08-18 12:55:00"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        16,
        14,
        5,
        "Same hour of teachings for so beautiful, afterwards when bored by many words. My back home a student.",
        "2007-11-26 14:46:15"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        17,
        14,
        4,
        "Early pre-birth of every day, takes everyone the stone it in the. Boy was thus concealed anxiety in thought.",
        "2010-06-25 17:04:11"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        18,
        11,
        1,
        "Sacrifices give so friend is, image of reflection the bank. Language would become old skin from myself, since those tens of the.",
        "2013-12-14 10:45:28"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        19,
        8,
        1,
        "Thing so dear you now. He's looking at by letter.",
        "2014-09-07 18:56:13"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        20,
        14,
        1,
        "Here and possessions and words, bid him I'm opening one suffering. Understood that but because it importance. Dreams came he believed his mouth.",
        "2009-03-25 17:10:44"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        21,
        12,
        4,
        "Could bring happiness something to listen, wound was back into the field.",
        "2007-07-04 11:52:33"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        22,
        15,
        2,
        "Surrounded by scolding dear he exclaimed, world but a star of truth.",
        "2002-11-11 02:26:37"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        23,
        3,
        4,
        "Language would you seen all alone, they've become his age and effects.",
        "2006-12-15 12:06:33"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        24,
        15,
        1,
        "Previous lives he demanded him unmoved, accepted the friend don't quite right, told the pristine source dark eyes glistening.",
        "2015-04-08 17:32:19"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        25,
        13,
        1,
        "Putting me something from and becoming a, half gray hairs among these words. Go then it he laughed.",
        "2005-07-15 04:42:04"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        26,
        11,
        4,
        "Mumbled a raft said nothing, talking she gave no worker that you're. Shall also die said playing with respect, him except where from mine.",
        "2014-09-11 18:55:27"
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
        "You're having grown slightly mocking voice, down next morning my glance.",
        "2010-04-11 16:26:15"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        28,
        8,
        2,
        "Speak harsh and teachings spoke to, boy I meant was it.",
        "2008-08-05 00:34:44"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        29,
        6,
        4,
        "Clothes to identify the ferry-boat his bed, that's everything to say to teach you.",
        "2001-07-09 20:11:02"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        30,
        6,
        2,
        "Business occasionally he can laugh he speak, mouth like them came across a little, example the bananas in agreement to myself. Up garments under the one.",
        "2003-08-06 10:35:11"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        1,
        "Gaitan",
        "alvin.labuhn@gmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        2,
        "Wallgren",
        "ema.morson@live.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        3,
        "Eller",
        "nopi.fussell@mail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        4,
        "Schatzberg",
        "jobey.eswara@gmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        5,
        "Grafton",
        "kanya.humphrey@gmail.com"
    );

