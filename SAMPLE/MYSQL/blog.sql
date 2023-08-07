set @old_unique_checks=@@unique_checks, unique_checks=0;
set @old_foreign_key_checks=@@foreign_key_checks, foreign_key_checks=0;
set @old_sql_mode=@@sql_mode, sql_mode='traditional,allow_invalid_dates';

create schema if not exists `BLOG` default character set utf8mb4 collate utf8mb4_general_ci;

use `BLOG`;

drop table if exists `BLOG`.`SECTION`;

create table if not exists `BLOG`.`SECTION`(
    `Id` BIGINT UNSIGNED not null auto_increment,
    `Number` BIGINT UNSIGNED null,
    `Slug` TEXT null,
    `Name` VARCHAR( 45 ) null,
    `Text` TEXT null,
    `Image` VARCHAR( 45 ) null,
    primary key( `Id` )
    ) engine = innodb;

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        1,
        1,
        'sports',
        'Sports',
        'Us across a listener completely concentrated on shoulder, wavered to do you think every fruit to overcome. Fled from did he conducts our foolishness. Him wouldn\'t you ought to protect your child.',
        'authalki.png'
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        2,
        2,
        'gaming',
        'Gaming',
        'Like them found in all these verses, know many questions he could bring his language. Shouldn\'t I recognise that long hair on it, where were water ran over I knew.',
        'istandop.png'
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        3,
        3,
        'entertainment',
        'Entertainment',
        'Smiling and had followed it already now emptiness, go and joy without having grown old my path. You mistaken in vain vacuous speaker sensed an arrow.',
        'odgoccyc.jpg'
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        4,
        4,
        'science',
        'Science',
        'Young with the foot on slender legs greeting you, softly and the amount of two young man. Yet none but immensely strong hunger and there, they\'ve become tired put it don\'t I.',
        'ennantau.jpg'
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        5,
        5,
        'history',
        'History',
        'Tell her where I merely were stood by speaking. Them cheat him then let\'s not comprehend any other. Means that she crouched down under their paths, from foolishness to show him just to beg. Haven\'t thought occurred let his lips which these things.',
        'andfanga.jpg'
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        6,
        6,
        'travel',
        'Travel',
        'Purpose to find when after it any other, wouldn\'t force you again walked again sun could accept, their refuge in an intoxication something cooked rice. Turned against hunger gave his my predecessor the rice-field. Haven\'t thought was very thing he encountered women.',
        'oohihadi.gif'
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Slug`, `Name`, `Text`, `Image`
    )
    values
    (
        7,
        7,
        'finance',
        'Finance',
        'Perhaps you as foolish and lived in every day, leapt in error that it a precise rule. Smile was bored and childlike face the blue.',
        'ziehnobi.gif'
    );

drop table if exists `BLOG`.`USER`;

create table if not exists `BLOG`.`USER`(
    `Id` BIGINT UNSIGNED not null auto_increment,
    `FirstName` VARCHAR( 45 ) null,
    `LastName` VARCHAR( 45 ) null,
    `Email` VARCHAR( 45 ) null,
    `Pseudonym` VARCHAR( 45 ) null,
    `Password` VARCHAR( 45 ) null,
    `Phone` VARCHAR( 45 ) null,
    `Street` TEXT null,
    `City` VARCHAR( 45 ) null,
    `Code` VARCHAR( 45 ) null,
    `Region` VARCHAR( 45 ) null,
    `Country` VARCHAR( 45 ) null,
    `Company` VARCHAR( 45 ) null,
    `ItIsAdministrator` TINYINT UNSIGNED null,
    primary key( `Id` )
    ) engine = innodb;

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        1,
        'Rick',
        'Deckard',
        'rick.deckard@mail.com',
        'rick.deckard',
        'b-263-54',
        '+61 730 426 743',
        'Chapa Lane',
        'McEwen',
        '8391',
        'New York',
        'Samoa',
        'Sellwood Store',
        1
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        2,
        'Rachael',
        'Tyrell',
        'rachael.tyrell@outlook.com',
        'rachael.tyrell',
        'nexus-7',
        '+18 920 761 121',
        'Rahn Lane',
        'San Miguel',
        '8255',
        'Rhode Island',
        'Comoros',
        'Sengupta Insurance',
        0
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        3,
        'Arthur',
        'Dent',
        'arthur.dent@gmail.com',
        'arthur.dent',
        '42',
        '+64 473 392 571',
        'Dickie Drive',
        'Mio',
        '3952',
        'South Dakota',
        'Czechia',
        'Prints Depot',
        0
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        4,
        'Danila',
        'Duthie',
        'danila.duthie@mail.com',
        'daniladuthie',
        'le!6aBpop',
        '+60 825 817 147',
        'Normandin Lane',
        'Lovell',
        '6852',
        'Virginia',
        'Guinea-Bissau',
        'Laidlaw Online',
        0
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        5,
        'Karil',
        'Rossanese',
        'karil.rossanese@hotmail.com',
        'karilrossanese',
        '?olbD4awan',
        '+81 365 978 351',
        'Pottle Drive',
        'Kahua',
        '8528',
        'Labrador',
        'Ukraine',
        'Biel Shop',
        1
    );

drop table if exists `BLOG`.`ARTICLE`;

create table if not exists `BLOG`.`ARTICLE`(
    `Id` BIGINT UNSIGNED not null auto_increment,
    `SectionId` BIGINT UNSIGNED null,
    `UserId` BIGINT UNSIGNED null,
    `Slug` TEXT null,
    `Title` TEXT null,
    `Text` TEXT null,
    `Image` VARCHAR( 45 ) null,
    `Date` DATE null,
    primary key( `Id` ),
    index `index_article_section_1_idx`( `SectionId` asc ),
    index `index_article_user_2_idx`( `UserId` asc )
    ) engine = innodb;

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        1,
        2,
        4,
        'held-the-sandy-bank-of-thoughts',
        'Held the sandy bank of thoughts.',
        'Childlike people\'s ways leading away thousands of. Stayed behind its layers to thank you. Early in them except where else but without substance.',
        'wanordeu.jpg',
        '2008-08-18'
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        2,
        6,
        2,
        'saw-agni-he-was',
        'Saw agni he was.',
        'These reports only remembered everything could you, went back and not wish the habit of wise. Smiling he silently his light of them their course.',
        'carmitah.gif',
        '2015-12-21'
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        3,
        1,
        4,
        'childlike-people-like-waves-and-dreary-life',
        'Childlike people like waves and dreary life.',
        'Business was next morning he should incessantly hit, boy himself completely understanding and write poetry. Mumbled a carp with friendliness the fisher fish, pearls he who had no one roll of dust. Saw rising over all thinking is fasting nor thinking.',
        'ortastek.gif',
        '2004-05-25'
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
        'sadness-and-worldly-life',
        'Sadness and worldly life.',
        'Salvation and sleep which already have once heard everything. Monk stopped on all stay for being happy fortune, blossomed his voice she looked around through life, sun rising over which I went the clear-thinking spirit.',
        'darlinez.gif',
        '2002-11-06'
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
        'rose-the-sal-wood-forest-started-talking',
        'Rose the sal-wood forest started talking.',
        'Putting himself the oar left him also worrying me, wisdom that secret hope every truth is meditation. Source ran away all lacks completeness roundness oneness. Bowed with its own words pure one and hastiness.',
        'attudayh.gif',
        '2011-04-17'
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        6,
        3,
        2,
        'fully-become-of-truth',
        'Fully become of truth.',
        'Whom even intended to finer food for her, loved everybody he possessed a thirsty man. Knowing and doesn\'t displease you hear more, old my clothes I haven\'t followed the passenger spoke.',
        'ingossac.png',
        '2000-08-21'
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        7,
        3,
        4,
        'thus-busy-laborious-years-of-three-years',
        'Thus busy laborious years of three years.',
        'Senses if time through so be passed on, I\'ve had neither perished nor self-castigation offerings for him, whenever embarrassment and princes would live of them. Same answer to bed was unchanged has existence. Business and penetrated by fasting is what is proven.',
        'beridgeh.gif',
        '2004-02-22'
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        8,
        5,
        1,
        'shimmered-his-eye-and-sleeping-in-it',
        'Shimmered his eye and sleeping in it.',
        'Ran without seeing into deception called name of wise, fear to become entities and when you mean. Years bearing these beautiful life told me on, source of words exclaimed loudly and disappointment. Occasionally dreaming at each other both followed it.',
        'antoncku.gif',
        '2014-07-14'
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        9,
        5,
        5,
        'bowed-with-much-sadness-and-was-holy',
        'Bowed with much sadness and was holy.',
        'Example hadn\'t been told that lovers loving agreement with, again you\'re suffering began the flying bird. I\'ve had still aware that perfected man.',
        'rasighau.gif',
        '2002-08-21'
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        10,
        7,
        1,
        'came-and-women-are-rare-who-seeks-unity',
        'Came and women are rare who seeks unity.',
        'Want you had aroused him linen for my senses. Death all desperation and grasped it all, must be as they built the cold void. Meditation of despair and sloth had shared their course.',
        'aliturop.png',
        '2004-12-25'
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        11,
        2,
        2,
        'no-he-liked-this-time',
        'No he liked this time.',
        'Eyes looked into word into friendly eyes quietly to, up here opened his spirit in vain vacuous speaker. We both in error that with you, half gray in everyone in one\'s body, urged his high canopy of peacocks feathers.',
        'perinseu.jpg',
        '2000-12-20'
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        12,
        5,
        2,
        'fell-into-her-eyes',
        'Fell into her eyes.',
        'Stopped once a village treated the present new ones, are smiling and on water shimmered his venerable one. Deaf and proud state of paths of these verses, came when would help until nothing stung any other.',
        'olmopieq.gif',
        '2011-06-02'
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        13,
        7,
        1,
        'she-ll-die-his-teachings',
        'She\'ll die his teachings.',
        'Fasting making it therefore I hadn\'t been fleeting pleasure, reached our venerable teachings and while asking. Way now what makes them by letter. Blind pride flared up but since then, boy looked at several steps full of it.',
        'englefuq.jpg',
        '2015-12-01'
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        14,
        2,
        3,
        'childlike-or-foolishness-of-strength-his-knees',
        'Childlike or foolishness of strength his knees.',
        'Monk stopped thinking is hard and wishes and disappointment, his chest ache when left that loss. Stood there were brothers their end to servants. I\'m giving in simple clothes I used to, father returned home nowhere a world lose him calculations.',
        'tamralid.png',
        '2014-04-13'
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        15,
        5,
        2,
        'wondrous-words-came-by-disciples-venerable-one',
        'Wondrous words came by disciples venerable one.',
        'Everything these beautiful and hands and fell asleep, what\'s the only joined it which so will be, I\'ve had seemed like humidity entering this further. Young in love a in a standstill, one roll of thousand eyes became her eyes.',
        'allaleni.gif',
        '2007-06-02'
    );

create table if not exists `BLOG`.`COMMENT`(
    `Id` BIGINT UNSIGNED not null auto_increment,
    `ArticleId` BIGINT UNSIGNED null,
    `UserId` BIGINT UNSIGNED null,
    `Text` TEXT null,
    `DateTime` DATETIME null,
    primary key( `Id` ),
    index `index_comment_article_1_idx`( `ArticleId` asc ),
    index `index_comment_user_2_idx`( `UserId` asc )
    ) engine = innodb;

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        1,
        5,
        2,
        'His friend\'s advice he reached them. By bees had shone golden cage.',
        '2003-06-12 11:33:52'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        2,
        8,
        4,
        'Exalted has already showing any further, questions he passes through life.',
        '2004-07-19 03:16:18'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        3,
        1,
        1,
        'Her suffering nor any given, lost myself yesterday wear many sacrificial songs, herself had committed a parable.',
        '2006-07-07 17:05:52'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        4,
        7,
        4,
        'Hours looked like who greeted him teach, suddenly she said not wisdom, source dark call magic words to read. Speaking still much but words.',
        '2003-04-08 08:27:32'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        5,
        3,
        1,
        'Fully become my group of dust. Tales and female carrying baskets.',
        '2014-09-27 19:40:20'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        6,
        6,
        3,
        'Words to awake properly again, held a readiness of teachings and accept, quietly lowered glance his gaze asked. Aren\'t you follow the perfection.',
        '2000-07-19 17:16:37'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        7,
        13,
        3,
        'Stone was pulling him alone like me, other person until the garden. Merchant a concentrated soul to enlightenment, lovely it necessary was wise.',
        '2014-06-27 18:54:14'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        8,
        1,
        1,
        'Warrior and painted in secrets. Late once a love nobody, the always seems to servants.',
        '2005-02-25 12:24:33'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        9,
        12,
        3,
        'Different as smart and holiness of oneness, on stiff legs any women are, fear someone always move on water. Example hadn\'t been just increased its title.',
        '2001-09-13 11:38:12'
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
        'Having honestly told him also with ecstasy. Accustomed to occupy them too, who seemed now gone on my words.',
        '2013-07-09 06:14:15'
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
        'Son did I wished to punish him. Gloomy and victory were accepted, other voices when little old be possible. Said but they would be.',
        '2000-02-02 00:32:32'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        12,
        11,
        2,
        'Oldest our path by one\'s heart, another each big loss that ferry. Been wounded by thought was broken.',
        '2006-11-14 12:32:08'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        13,
        7,
        5,
        'One talked loudly clapped her sedan-chair. Love nobody knew and curious, thus much wine from holy one himself, better teachings my benefactor spoke little.',
        '2008-11-07 04:12:47'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        14,
        2,
        2,
        'Many of something about this, better than he share his trip. Won\'t be his secret behind him, gives me said that\'s everything.',
        '2002-11-18 20:14:27'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        15,
        8,
        1,
        'Haven\'t found again at hers, boy to answer every killing the forest. Even with those words are like.',
        '2004-12-12 22:59:56'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        16,
        3,
        4,
        'Goal longing felt such hair, told how it sounded new.',
        '2013-11-06 19:42:35'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        17,
        6,
        3,
        'Today how looked upon yourself. Kindly spoke go and deed, soon they may see all important thing.',
        '2014-11-08 05:31:58'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        18,
        3,
        4,
        'Pilgrims shall reach my cousin in. Does really who came by letter. Life to start on bed.',
        '2013-03-24 08:41:54'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        19,
        1,
        5,
        'Was awoken again went back to shine, gives merchandise the alms-dish in heat.',
        '2010-11-27 01:24:30'
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
        'From his entire eternal characteristics as well, mumbled a heron\'s hunger had fallen.',
        '2005-05-13 17:18:56'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        21,
        7,
        5,
        'What\'s the hedge without thinking, everything he dreamed this breast, willingness my willingness to if she admitted. Than anything from wisdom like bees.',
        '2009-06-28 09:26:07'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        22,
        13,
        5,
        'Blossomed slowly among hundreds of rice there, travellers and isolated from death. Many pilgrims do is settled.',
        '2004-08-01 13:47:08'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        23,
        14,
        1,
        'Other way for gods together the run-away, here blue there where was left. Loudly clapped her peacefully dead face.',
        '2012-11-27 19:47:39'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        24,
        14,
        4,
        'Write something which can wait, I\'ll learn how still unable to friend.',
        '2014-01-04 03:19:52'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        25,
        5,
        3,
        'Few four or they accepted and passion, nothing standing there until he captured him, being among carters and maids the fields. Like sand and come and waited.',
        '2000-06-25 08:59:01'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        26,
        15,
        3,
        'Broke loose embraced once said quietly, past touched a kiss bid him awake.',
        '2013-08-11 16:49:38'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        27,
        9,
        4,
        'Evening had spent with equanimity, at head down his walk. It flowed over came back.',
        '2013-09-23 03:08:58'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        28,
        7,
        2,
        'A stranger who told him calculations, don\'t give orders he has.',
        '2012-07-17 14:22:43'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        29,
        8,
        2,
        'Got bloated stank it all, scolding and ever achieved it. Yes he pitied he laughed, yet shining from there young was necessary.',
        '2014-05-20 03:16:36'
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        30,
        3,
        1,
        'How still to attach to receive, is nothing I sought refuge to side, can wait any person someone is present.',
        '2004-07-12 16:43:00'
    );

create table if not exists `BLOG`.`SUBSCRIBER`(
    `Id` BIGINT UNSIGNED not null auto_increment,
    `Name` VARCHAR( 45 ) null,
    `Email` VARCHAR( 45 ) null,
    primary key( `Id` )
    ) engine = innodb;

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        1,
        'Seatter',
        'shandeigh.bir@mail.com'
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        2,
        'Doriot',
        'sanja.schejbal@live.com'
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        3,
        'Bostelmann',
        'giampaolo.jande@outlook.com'
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        4,
        'Ritza',
        'said.mayoux@gmail.com'
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        5,
        'Keehn',
        'jennica.rohal@hotmail.com'
    );

set sql_mode=@old_sql_mode;
set foreign_key_checks=@old_foreign_key_checks;
set unique_checks=@old_unique_checks;
