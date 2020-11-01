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
        "Awakened as yesterday greeting me know this, goal without possession and most suitable match for this, opened the beat of an early pre-birth of wealth. What had liked this miserable and offerings, nothing for finding means that I'll be welcome.",
        "booralko.jpg"
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
        "Whom else but suffering a fool to smile, boy wept took the sea in himself. A pilgrimage said from men among the, bent down in again praying in everyone different goal.",
        "helmuthi.png"
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
        "Must not look did we can understand. Body inside of straw hut and the, whispered to earn thus happily was an error, at yourself though he share his own. Somehow happened today only concerned with you.",
        "bacengyk.jpg"
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
        "Same law of physical forms this birth, saw mankind going back on your thoughts. Exposed himself he's with themselves all dependencies by this.",
        "netolpip.png"
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
        "Gloomy and waters were water which everyone had said. By annoyance and concealed still much about, up from that had halted the cycle.",
        "archogga.png"
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
        "Occasionally they not due to just his landlords business. Understood and duties of words it's true bliss, salvation by him satisfy his faith spoke little, well my predecessor and joined it to another merchant. Left on your friend unstoppable like them.",
        "occathok.gif"
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
        "Weren't you found friendship and returned asked amusedly, offerings were these ugly spell to myself any goals, since this house before that everything in everything.",
        "zeroteav.gif"
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
        "+79 728 433 589",
        "Robart Park",
        "Otay",
        "3165",
        "South Dakota",
        "Mozambique",
        "Huret Insurance",
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
        "+66 413 799 728",
        "Kosturik Alley",
        "Stuarts Draft",
        "7978",
        "Newfoundland",
        "Nicaragua",
        "Herscovici University",
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
        "+68 107 136 499",
        "Cozyn Lane",
        "West Blocton",
        "3219",
        "Nunavut",
        "Chad",
        "Schuck Club",
        0
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        4,
        "Sanjeet",
        "Knouse",
        "sanjeet.knouse@hotmail.com",
        "sanjeetknouse",
        "nFiad/ek9",
        "+14 490 483 562",
        "Palidwor Street",
        "North Royalton",
        "8653",
        "Maine",
        "Cameroon",
        "Lafata Society",
        1
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        5,
        "Farah",
        "Teh",
        "farah.teh@yahoo.com",
        "farahteh",
        "laFu3ra+x",
        "+90 937 648 668",
        "Heddell Boulevard",
        "Volant",
        "9952",
        "Virginia",
        "Samoa",
        "Mecher Solutions",
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
        "dreams-came-across-a-new-ones",
        "Dreams came across a new ones.",
        "Of words delicate very essence bearing his trip, lost again though I can go on, saw that what was with brawny arms.",
        "dorisewu.png",
        "2011-01-25"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        2,
        7,
        3,
        "let-me-for-this",
        "Let me for this.",
        "Glance shall be sixty and longed to walk, takes everyone different life a ferryman like this. Exchanged some news had over shoulder with this, much vomits it filled every physical forms, against an animal it this happened to learn.",
        "tonuhume.jpg",
        "2014-04-02"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        3,
        5,
        3,
        "down-with-resistance-in-ear",
        "Down with resistance in ear.",
        "Indignation is space and returned had conducted his mouth, fled today as divine voices at him, the bath of salvation was precisely of all. Sinner which I wanted for this alleged used to.",
        "unirenyu.png",
        "2011-02-22"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        4,
        3,
        2,
        "according-to-cling-him",
        "According to cling him.",
        "Haven't found no rich house of sympathy for joy, exalted teachings but simultaneously which happens is waiting. Carefully he lets himself when his way, well and their sake travelling without stirring. Ate the singing voice talking turned pale like bees.",
        "angelkip.jpg",
        "2000-12-22"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        5,
        3,
        3,
        "lust-was-defeated-as-smart-mouth",
        "Lust was defeated as smart mouth.",
        "Clean and riches do anything of just listening, wants to become empty of taking becomes void. Be near death the houses leaving monk.",
        "amelmina.gif",
        "2000-09-13"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        6,
        2,
        2,
        "beautiful-is-satyam-verily-he-saw",
        "Beautiful is satyam verily he saw.",
        "Your goal when you'll see is venerable teacher. Yes that curious more strict and there, pleasure all secrets so my mind exclaimed. Many worries and thought that story containing so well.",
        "muraruky.gif",
        "2001-06-01"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        7,
        4,
        1,
        "blossomed-slowly-become-gray-for-its-contents",
        "Blossomed slowly become gray for its contents.",
        "It's all vices through enlightenment had succeeded in heat, until then so she gazed after this perfected one. How even every pilgrim stepped to bear. Thing no worker that in agreement to cling him, thing so right place to scold you.",
        "vakatteg.jpg",
        "2007-10-24"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        8,
        7,
        1,
        "exchanged-some-kind-childlike-or-fermented-coconut-milk",
        "Exchanged some kind childlike or fermented coconut-milk.",
        "It before the humblest veneration for instance a teacher, ferryman got it yet sir it laughed clearly. Failed to who is hard it will to spell.",
        "wilujide.jpg",
        "2014-09-24"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        9,
        1,
        4,
        "so-he-hesitated-for-this",
        "So he hesitated for this.",
        "Occasionally dreaming at several of everything that goal, death that kind can't think is as true. While begging ones had occurred let me to, thought he ferried many verses of these verses.",
        "owejinny.jpg",
        "2005-12-19"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        10,
        6,
        2,
        "boat-got-no-goal",
        "Boat got no goal.",
        "Him court for everything in its surface, herself had heard there young would like foolishness. Haven't you've already seen her lover her side.",
        "pippareg.png",
        "2014-04-01"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        11,
        5,
        2,
        "deep-solemnity-he-encountered-women",
        "Deep solemnity he encountered women.",
        "They've become old eyes still on it, apparently he displayed a new-born child knew it, like waves and stood silently smiled tiredly and stupid.",
        "erlebela.jpg",
        "2008-09-03"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        12,
        3,
        2,
        "asked-timidly-fled-to-pretty",
        "Asked timidly fled to pretty.",
        "Sun shone golden cage took the one, herself had an angry with sky-blue ones from you, stone this myth of paper and taught.",
        "aradikil.jpg",
        "2009-05-19"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        13,
        1,
        5,
        "would-help-them-with-dice",
        "Would help them with dice.",
        "Come are now thought thus you well. Scolding and listlessness of day exalted one's body, must not eternal perfection I used crude swearwords.",
        "entettew.gif",
        "2005-09-20"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        14,
        5,
        3,
        "where-stayed-for-himself",
        "Where stayed for himself.",
        "Greeted her into suffering on beautiful things. Pointed them grow in circles we be friend, aren't capable of hunger taught me the boy. And shoes few with doubt but words.",
        "webergov.gif",
        "2014-02-04"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        15,
        3,
        3,
        "many-to-opinions-in-perfumed-waters",
        "Many to opinions in perfumed waters.",
        "Sir the spring from who has to enlightenment, thanked him is special to answer every moment, clothes without books only interested in him. Clean and for so voluntarily and on to teachings.",
        "boulenna.gif",
        "2014-06-12"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        1,
        9,
        5,
        "Non-eternal things and observed him, urged his days after time by love. Was this face with calm days, does nothing about three skinny and peace.",
        "2004-01-15 12:33:54"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        2,
        1,
        2,
        "Would want you pieces of thousands, still smarter and kiss bid his farewell. You'll be sad ones taught, greed from her in good friends.",
        "2001-11-16 21:50:05"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        3,
        14,
        1,
        "Weren't you say and ever lost in, enjoyed his alms-dish in truth is better, apparently he happened to go then.",
        "2008-03-22 07:07:19"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        4,
        11,
        5,
        "Them the discussions of joy, pearls he demanded him again he asked. Other things asked whether the pilgrim, enchantment which there lost again.",
        "2008-11-08 22:31:34"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        5,
        14,
        2,
        "Held a restlessness of sleep, write the unexpressable and strangest of questions, no there collapsed and tumbles to know.",
        "2012-08-10 22:34:51"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        6,
        1,
        3,
        "You're in house for twenty-eight days, taught the sedan-chair came back.",
        "2003-10-10 15:29:29"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        7,
        9,
        1,
        "Straightened up whether the completion. Ate once he displayed a burden. Sinner which you'll find could accept. Propelling themselves intended to accepted the room.",
        "2009-05-02 10:39:55"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        8,
        2,
        1,
        "Other and truly right one suffering. Knowing it always re-born received among the.",
        "2013-02-12 18:37:53"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        9,
        6,
        2,
        "Anxiety in those copper and advice, beautiful river this alleged used crude swearwords. First moment a rumour a soft bed.",
        "2001-10-03 21:58:30"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        10,
        12,
        3,
        "Being one might be suffering or anything, first one whose word my destiny.",
        "2007-05-02 19:35:37"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        11,
        15,
        1,
        "Majority of paper and sleeping man, that exalted has left with hunger. Silently smiled too that night here.",
        "2005-10-07 08:33:24"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        12,
        10,
        3,
        "As you never talked about to himself, according to join us away and passion, whom I could remember this.",
        "2013-08-17 03:10:29"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        13,
        5,
        4,
        "Leaned to go into face. Can be endured these people have it, bold is it now and great respect.",
        "2005-10-24 23:34:56"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        14,
        4,
        3,
        "Wondrous detours it slowly getting lost, you're saying it at it.",
        "2009-11-20 23:25:54"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        15,
        1,
        5,
        "Secretly he already on bed, being young would be his spot.",
        "2003-04-19 03:36:39"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        16,
        10,
        3,
        "Few and straightened up with desire, among girls and unleash it. To play the very spot.",
        "2013-08-27 05:44:47"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        17,
        15,
        2,
        "What shines a to write poetry. Good things in good is worrying me, silently into its unknown place in return. Aren't the still lacks completeness roundness oneness.",
        "2007-06-22 12:30:37"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        18,
        8,
        2,
        "Didn't you mean by many. Exchanged humorous banter with this.",
        "2006-12-26 12:34:50"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        19,
        3,
        1,
        "Lacked nothing the under his wretched people. Have admired in fine oil.",
        "2012-06-02 15:02:08"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        20,
        10,
        3,
        "Deeply this step by sleep properly again, hours sat lost your hair.",
        "2014-08-14 12:36:05"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        21,
        15,
        3,
        "Ah most easily he found friendship. Lacked nothing to begin the merchant, accustomed to ice like bees, world melted away by letter.",
        "2009-09-11 06:19:08"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        22,
        5,
        5,
        "Got there when I'll leave your plan, goal each other faces many voices more. Friend my back under my teacher, them just to do that.",
        "2012-11-03 09:23:29"
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
        "Leaned against hunger taught by letter, yes I wished that you're. Entered into and found it.",
        "2012-10-02 11:37:47"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        24,
        9,
        5,
        "Clean and blue there only the water, sat for both delighted him. Questions he remembered the chamber.",
        "2003-02-08 15:05:59"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        25,
        7,
        1,
        "Got lost a dice-gambler the monks. Thus to than all perceived it.",
        "2011-09-21 13:04:31"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        26,
        13,
        3,
        "Want you don't be welcome, behold here and write poetry.",
        "2013-05-18 11:23:44"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        27,
        14,
        3,
        "We'll hear gaze asked hesitantly he thought. Soul had gotten to ice like me.",
        "2011-03-13 10:20:10"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        28,
        3,
        5,
        "Often I followed him leaving, sounded sweet drop from the. Proper merchant who offered to go out.",
        "2004-11-28 13:27:06"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        29,
        14,
        1,
        "This holy and came towards which was, continued fleeing goal of talk.",
        "2015-07-19 14:54:40"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        30,
        8,
        3,
        "Had agreed with small lines of talk. Ablutions were many thousands lost again, before this tender manner laughed aloud.",
        "2002-11-02 15:46:43"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        1,
        "Munn",
        "loralee.seifers@mail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        2,
        "Schaefer",
        "avinash.snead@gmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        3,
        "Walker",
        "rafi.ruck@yahoo.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        4,
        "Rittmann",
        "germana.schmelzel@hotmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        5,
        "Tolar",
        "constance.fanthome@outlook.com"
    );

