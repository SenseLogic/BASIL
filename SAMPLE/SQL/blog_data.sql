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
        "Fully become his distant target one have thought, long search on foot on your hair, offerings to enter his power he dreamt of. High and motionless man into it destroying it said.",
        "olisoryu.jpg"
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
        "Still on a conversation about her sedan-chair, I'll give orders because you believe you he was. Taught him prisoner here thought was part the morning, than an old self it often are your indulgence.",
        "opolehyu.png"
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
        "Sadness and more like he hoped to endure, exalted one's thoughts caught sight of patience. Urged his masterful skills until his landlords business of.",
        "manessal.gif"
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
        "You've lost but sweet happiness of any other, blossomed his rice-bowls took the possible to calm days. Waiting how should the river's voice sounded sweet, told me said this monk and inwardly.",
        "ampinsky.gif"
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
        "Are his service and pilgrims you seen everything. There existed a full height any teachings every creature, well you've thought the ground when seeing old man.",
        "edwertyq.gif"
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
        "Out devoured up he belonged together and shivered, perhaps you subject to wake up paced to myself. At daybreak I sought his mistress that this yet.",
        "jasillmy.jpg"
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
        "Would doubt in kissing which more warmly, according to offer him foamed at once, conducted his chest as an hour silently into face.",
        "manikoli.png"
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
        "+31 840 393 677",
        "Litzenberger Boulevard",
        "Lamoni",
        "9514",
        "Vermont",
        "Mozambique",
        "Risko Institute",
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
        "+53 391 757 347",
        "Dininno Park",
        "Shell",
        "2589",
        "Alberta",
        "Moldova",
        "Fedoruk News",
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
        "+59 377 787 706",
        "Bir Street",
        "Blountsville",
        "1390",
        "Indiana",
        "Switzerland",
        "Nicol Dynamics",
        0
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        4,
        "Dacy",
        "Clough",
        "dacy.clough@live.com",
        "dacyclough",
        "3Vag?eg",
        "+61 931 209 304",
        "Willson Street",
        "Woodruff",
        "5720",
        "Nebraska",
        "Mauritius",
        "Lenathen Church",
        0
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        5,
        "Fae",
        "Vartanesian",
        "fae.vartanesian@hotmail.com",
        "faevartanesian",
        "esBw0arrel^",
        "+46 895 911 164",
        "Aiken Alley",
        "Trabuco Canyon",
        "6647",
        "Missouri",
        "Thailand",
        "Filkins Club",
        1
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        1,
        3,
        2,
        "up-impetuously-hunting-for-her",
        "Up impetuously hunting for her.",
        "Simply thus awoken one awaited in him, hours looked into the essential existence by speaking. Tears he suddenly had shone golden cage, held against hunger would join youth had died, then turned a night here in reaching the chamber.",
        "balochij.gif",
        "2012-03-01"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        2,
        3,
        5,
        "by-scolding-dear-friend",
        "By scolding dear friend.",
        "Cannot love words to smile quietly ashamed, life fading now his mockery some way said. Full breast popped out to relieve suffering, wouldn't you he'll like my wife's funeral pile.",
        "retadmiz.jpg",
        "2007-09-05"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        3,
        1,
        2,
        "cared-little-boy-her-house-locked",
        "Cared little boy her house locked.",
        "But only a part with their great perfected one, should I envy at head differently sound foolish. Opposite to awake which keep him teach, no teacher had left him conducted him. Monks as thought would ever saw a dreary life.",
        "ontangog.png",
        "2003-08-18"
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
        "somehow-happened-that-but-he-listened-with-you",
        "Somehow happened that but he listened with you.",
        "Friend with bad talk of hundreds of an arrow, for joy in face into words it's not you. Next to strive for everybody he walk the goal.",
        "onmehmid.png",
        "2004-04-19"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        5,
        2,
        3,
        "didn-t-you-think-little",
        "Didn't you think little.",
        "Up then turned against teachings every time ago. Can support them died had roared and finally said, wanted for watching waited friendly patience when my pilgrimage. Ferryman and bid him into your work, well it don't beat where do so.",
        "annidbiu.jpg",
        "2006-04-18"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        6,
        3,
        1,
        "tomorrow-and-women-with-white-in-return",
        "Tomorrow and women with white in return.",
        "Farewell to please you have perfume in ear, oldest one awaited the boat got to do, teachings the symbols and robbers have thought. Love anybody or ugly spell to mend the salvation.",
        "ronenavu.png",
        "2003-10-24"
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
        "knowing-it-good-just-concealed-putrefaction",
        "Knowing it good just concealed putrefaction.",
        "Daily at bottom already thought exalted one's breath, she'll die of many thousands which we won't, by innumerable generations of her gifts for.",
        "lilettid.png",
        "2001-02-20"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        8,
        2,
        3,
        "if-it-i-said",
        "If it I said.",
        "High canopy of overcoming pain glowing with hunger. Bowed with thanks returned the daytime with enticed me. Placed his pain for one door without one wants, will speed on chance not addressing with enticed me.",
        "endrette.png",
        "2012-04-01"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        9,
        6,
        5,
        "whenever-it-has-taught-you-write-very-much",
        "Whenever it has taught you write very much.",
        "Majority of contemplation spoke little of enlightenment, questions he owned locked the only son again. Questions but was akin to ever before more mockingly. Had overcome the ferryman and watched it so.",
        "ohnulexu.gif",
        "2013-09-07"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        10,
        4,
        5,
        "different-than-ever-lost-your-great-pity",
        "Different than ever lost your great pity.",
        "Smile flourished more ugly whenever it who offered him, listened with sky-blue ones taught my sleep badly. Possessions said who petitioned him here thought, was inevitable inescapable was water was a whisper. As it had turned black hair comb his being.",
        "acrinsal.jpg",
        "2000-06-16"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        11,
        6,
        4,
        "these-clothes-on-in-words",
        "These clothes on in words.",
        "Near goals all by it for people see him, listen and venerable one half as your son. Lust like waves in house in them.",
        "aldineha.png",
        "2008-08-06"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        12,
        2,
        2,
        "failed-to-please-you-told-about-this",
        "Failed to please you told about this.",
        "They've become gray hair like into word a man, means of transformations all prayers of salvation, wanted for once again you're mocking me. Courtesan had replaced my love stronger was broken.",
        "arrergiv.png",
        "2013-07-09"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        13,
        3,
        4,
        "by-her-she-admitted",
        "By her she admitted.",
        "Leaned against myself old banana-eaters to consciousness, both male sheep in one's body and is necessary, father not shine at sunrise they do at once.",
        "burosrar.jpg",
        "2014-07-09"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        14,
        5,
        2,
        "with-crystal-lines-of-peacocks-feathers",
        "With crystal lines of peacocks feathers.",
        "Worry in on downhill with yearning to rest, bid his kind a loss has this yet, too ferryman like stars in one's heart. Want back being separated and unleash it, knowing and abused by one awaited not you.",
        "uccingeu.jpg",
        "2005-07-02"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        15,
        4,
        4,
        "language-would-remain-of-teachings",
        "Language would remain of teachings.",
        "Fully become silent war or worth learning and penance, stayed motionless cold and holiness of paths. But rather they knew neither hair comb his situation.",
        "kunitaka.gif",
        "2011-12-05"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        1,
        14,
        1,
        "Went through water of noble promises, mouth how grateful was vexed by letter. Want to fast but since then.",
        "2008-11-21 16:19:04"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        2,
        11,
        3,
        "Questions but tell me being, she was able to weep.",
        "2009-12-25 05:07:42"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        3,
        3,
        5,
        "Cared little between evil words, tales and deeply and remembered correctly, watched it speaks when he hated.",
        "2012-04-21 07:17:59"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        4,
        6,
        3,
        "Greed from that she him, venerable teachings will keep you do it, smile lit up from men talked incessantly.",
        "2002-02-27 07:01:21"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        5,
        13,
        1,
        "High caste of blessing spoke little. Near the multitude of physical form. Let's be among thousands lost in ear, thought sprang forth from an.",
        "2001-06-11 04:59:11"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        6,
        10,
        4,
        "Gloomy intoxication of mere words, two accustomed to perform the mango-trees, wouldn't want you insist upon yourself.",
        "2004-11-20 23:26:13"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        7,
        10,
        2,
        "Nothing the use for finding, one the white just his approval. Consciousness thus loved any longer, their life also will do that you're.",
        "2002-03-14 21:16:03"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        8,
        3,
        3,
        "Suddenly as wonderful and longed for, well tested sequence of truth.",
        "2003-05-16 18:18:57"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        9,
        3,
        2,
        "Never since all those not answer, proper it sounded sweet things. Thus unsuccessfully and wait any longer back.",
        "2010-08-19 07:05:14"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        10,
        9,
        3,
        "Flesh and quiet a ferryman laughed, wouldn't you ferryman got lost. Thanked her body however small near it, ran over slowly become a goal.",
        "2014-01-22 15:09:17"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        11,
        15,
        5,
        "Bent over his consciousness the goal, perhaps reciprocate it importance they never satisfied. So now that most shameful life.",
        "2006-03-08 10:14:21"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        12,
        4,
        2,
        "Arriving at his equal yes that time, watched the forehead with for fifteen days. As mockery with light like him.",
        "2006-09-11 05:21:57"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        13,
        14,
        4,
        "Wouldn't punish him foamed at hers, there were told that ferry, don't mind he encountered women.",
        "2000-09-06 11:51:11"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        14,
        7,
        4,
        "Opposite bank when left by everyone, come in former times of wise. A short escape of wise, smiling thanked and we'll continue learning.",
        "2000-11-14 03:14:03"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        15,
        6,
        1,
        "Long look did his shoulder, I'm greeting her way said nothing. Knew to play once again, against him away like this way.",
        "2004-09-25 13:18:07"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        16,
        5,
        2,
        "Exclaimed lamentingly its brow a ferryman, boat on once said I'm travelling.",
        "2004-11-12 19:36:55"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        17,
        9,
        4,
        "Read in her heart he himself with, river today neither hair of them. Waiting his dream he replied.",
        "2010-03-21 05:27:22"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        18,
        11,
        3,
        "Come he ever have said, soon have teachers and told him.",
        "2007-01-13 18:34:50"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        19,
        14,
        3,
        "Exposed himself not in such hair, urged him unconscious in your son's upbringing.",
        "2008-10-04 21:15:52"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        20,
        7,
        5,
        "Tales and more of you hear, while bent down ready to friend.",
        "2003-11-13 02:51:17"
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
        "You mark my name is, placed two hours of oneness. Monk and about he laughed.",
        "2000-06-12 22:01:40"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        22,
        7,
        3,
        "Looking at times for me. Have never returned the ground, entered for what fades most quickly.",
        "2008-05-22 16:50:17"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        23,
        14,
        3,
        "Asked his learning which admonished to walk, exposed himself with brawny arms. Stared at your foolish world my father.",
        "2008-10-15 20:38:11"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        24,
        2,
        5,
        "According to where you able to side, evening together by urges all conceptions, are tormenting yourself by letter. To any time were playing as `learning'.",
        "2000-01-11 09:58:05"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        25,
        10,
        3,
        "Often I'll see such an untouchable peace, oldest of reflection of light, attentively waiting having had committed your mouth.",
        "2007-07-24 17:07:47"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        26,
        12,
        1,
        "Herself had lain by letter, asked many things we progress, dreams flowed the feeling in him.",
        "2004-04-25 14:27:52"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        27,
        14,
        1,
        "Wound was there who wants to teach, myth had nothing about words, speak them suffering infinitely meaningless. Broke loose embraced wrapped his teachings.",
        "2008-11-05 09:24:07"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        28,
        13,
        2,
        "Smiling he became to some mocking voice, thanked her and casually as himself despised. Simply believed his thoughts through your teachings, watched him disregard him disregard him.",
        "2004-05-24 09:37:46"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        29,
        4,
        1,
        "Smart brown and hardly noticeable gesture, had noticed here for not satisfied. Fell silent in speaking I been.",
        "2015-12-17 08:13:12"
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
        "Ah most hurriedly walking on foot, him conducted his envy at night. Body like sand and start over.",
        "2002-03-25 04:23:37"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        1,
        "Sayer",
        "aurea.frankcom@hotmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        2,
        "Parypa",
        "zere.bezdel@outlook.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        3,
        "Kaigler",
        "dhanvinder.lackie@yahoo.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        4,
        "Popowycz",
        "tami.cae@mail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        5,
        "Dropbox",
        "tiina.ashraf@gmail.com"
    );
