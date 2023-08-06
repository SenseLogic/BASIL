set @old_unique_checks=@@unique_checks, unique_checks=0;
set @old_foreign_key_checks=@@foreign_key_checks, foreign_key_checks=0;
set @old_sql_mode=@@sql_mode, sql_mode='traditional,allow_invalid_dates';

create schema if not exists `TEST` default character set utf8mb4 collate utf8mb4_general_ci;

use `TEST`;

create table if not exists `TEST`.`SIMPLE`(
    `Uuid` VARCHAR(36) not null,
    `Bool` TINYINT UNSIGNED null,
    `Int8` TINYINT null,
    `Uint8` TINYINT UNSIGNED null,
    `Int16` SMALLINT null,
    `Uint16` SMALLINT UNSIGNED null,
    `Int32` INT null,
    `Uint32` INT UNSIGNED null,
    `Int64` BIGINT null,
    `Uint64` BIGINT UNSIGNED null,
    `Float32` FLOAT null,
    `Float64` DOUBLE null,
    `String` TEXT null,
    `Name` TEXT null,
    `Date` DATE null,
    `DateTime` DATETIME null,
    `Blob` BLOB null,
    `Option` TEXT null,
    `EnglishText` TEXT null,
    `FrenchText` TEXT null,
    `GermanText` TEXT null,
    `LatinText` TEXT null,
    `SpanishText` TEXT null,
    `Integer` BIGINT null,
    `Natural` BIGINT UNSIGNED null,
    `Real` DOUBLE null,
    `Address` TEXT null,
    `CategorySlug` TEXT null,
    `CategoryName` TEXT null,
    `CategorySection` TEXT null,
    primary key( `Uuid` )
    ) engine = innodb;

replace into `TEST`.`SIMPLE`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`, `Option`, `EnglishText`, `FrenchText`, `GermanText`, `LatinText`, `SpanishText`, `Integer`, `Natural`, `Real`, `Address`, `CategorySlug`, `CategoryName`, `CategorySection`
    )
    values
    (
        '8dbdda48-fb87-48d6-746f-1965824e966a',
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        1.1,
        2.2,
        'Hello world!',
        'Maracle',
        '2001-02-03',
        '2001-02-03 04:05:06.789',
        '123456781234567891234567812345678',
        'second_Maracle',
        'Simply believed in perfect respect. Would only be alive of hunger had said tiredly.',
        'L\'égoïsme le regret de calme elle assure ce principe-là, est-il né qu\'il mange pas riche comme l\'espérance est indifférent.',
        'Aus der Geschäftsordnung schätzen lernten auf uns sich gehen. Fast vollständig erhalten werden könnten, Unserer Jugend nicht militärischen Charakters. Verfaßte die chemische Industrie angesehen.',
        'Rerum hostes iis flumine se superbe. Fuit rem coiciebant legionis properabat. Cupidius interposita est fines tum venellos adire aliter mille sui, grandis committere inter occiderunt reliqui ac.',
        'Acabó de cuenca está bien gustoso, musas serás sabedor y grandeza alejandrina, destruído después vino a cortar la fría el instrumento. Cuélganse otros escogidos por climas tierras no haya.',
        2,
        3,
        5.1,
        'Frisk Fx, 68 Pallen Court, 9252 East Hazel Crest, New Jersey, \"YEMEN\"',
        'game',
        'The game',
        'Second section'
    );

replace into `TEST`.`SIMPLE`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`, `Option`, `EnglishText`, `FrenchText`, `GermanText`, `LatinText`, `SpanishText`, `Integer`, `Natural`, `Real`, `Address`, `CategorySlug`, `CategoryName`, `CategorySection`
    )
    values
    (
        '8ba8be71-9e6c-4dcd-ca75-bad48b879df9',
        1,
        92,
        84,
        277,
        289,
        664,
        87,
        577,
        474,
        15.73,
        63.53,
        'Alshidevu',
        'Taki',
        '2014-11-21',
        '2001-01-28 05:24:52',
        '',
        'fourth_2001-01-28 05:24:52',
        'Lacked all sides into thinking of, thanked and quietly moving through life.',
        'Parmi la maison à respecter personne, l\'argent est vrai sobre simple bonté. Voyageurs d\'un compagnon qui représentent dans l\'ombre.',
        'Bringt euer Budget ohne verarbeitete Fabrikate erstehen, verglichen immer wachsender Deutlichkeit tun.',
        'Contendit bellum avaricum est offerebat itinere legione. Dimiserant erat piscibus dimicandum coeperunt.',
        'Extrañamente alegre flota al cauto gallego el entendimiento, llamándote señor presos cuando reparte su altar no imaginaba, recoge el orador do parece del temor de homero.',
        196,
        134,
        330.12,
        'Benishai Limited, 100 Stratton Avenue, 6526 Millboro, Arizona, \"BARBADOS\"',
        'game',
        'The game',
        'Second section'
    );

replace into `TEST`.`SIMPLE`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`, `Option`, `EnglishText`, `FrenchText`, `GermanText`, `LatinText`, `SpanishText`, `Integer`, `Natural`, `Real`, `Address`, `CategorySlug`, `CategoryName`, `CategorySection`
    )
    values
    (
        '9c81eab2-9f32-4404-649c-55910d7dbbd8',
        1,
        76,
        44,
        278,
        266,
        79,
        16,
        657,
        148,
        55.26,
        53,
        'Amamiloz',
        'Boersma',
        '2000-03-04',
        '2000-10-23 04:53:26',
        '',
        'third_2000-03-04',
        'Oldest of changed as thought was in it, her breast when my path. Too is harming me excellent how his gaze asked. Purpose in he fasted for it.',
        'Eh bien par de marcher seules dans tout à l\'autre. L\'ambition pour réformer sa vanité des hauteurs considérables. Oh l\'esprit comme l\'angoisse d\'un ornement étranger, l\'autorité purement personnelle des humbles.',
        'Verarbeitet sie nutzbringend zu halten, Hätten wir schon trat ein.',
        'Passuum castris diu ad timore quo alterius subministrata, celeritate persequi aetatem die deprehendit magno urbis imperat, dispositis conflictati suo in atque industrieque quam ut suos in. Plures sequanis itaque homini quibus principum in educit esse.',
        'Caminan para darnos la bética bandera, repartiendo su naufragio saldrán vivos inspiraba. Movido cuando tocaba orfeo pariste bella forma extraña.',
        227,
        -37,
        190.14,
        'Fischer Online, 96 Lipari Avenue, 7572 Annette, New Jersey, \"ANTIGUA\"',
        'game',
        'The game',
        'Second section'
    );

replace into `TEST`.`SIMPLE`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`, `Option`, `EnglishText`, `FrenchText`, `GermanText`, `LatinText`, `SpanishText`, `Integer`, `Natural`, `Real`, `Address`, `CategorySlug`, `CategoryName`, `CategorySection`
    )
    values
    (
        '0c34e4a9-3a03-4c3f-87dc-a819d2600821',
        0,
        68,
        18,
        400,
        709,
        881,
        930,
        497,
        268,
        68.5,
        35.69,
        'Samowlawefop',
        'Knickerbocker',
        '2007-12-28',
        '2007-12-03 20:56:50',
        '',
        'third_2007-12-28',
        'Never satisfied a line which used to, opened soul slipped from the spreads his tale.',
        'Quel maître de telles ou petits ménages de l\'orner. Voir pour lui-même l\'homme des cœurs le mieux, s\'imagine-t-on vraiment féminin de voir ce flot de frais, aux fonctions plus humain de respectable dans l\'esclavage.',
        'Kommissare der Industrie zu empfangen, man die Zahlungsbilanz ermöglicht hätte ich das man eine Feststellung.',
        'Non quaestionem cognovit collocaverat vigilia in latere deiectis proterritis non, cogerentur occuparet suumque nerviis nam legionibus.',
        'Poderse ver a cristo y crece el piloto munición mantenimientos, sequeira por centro largamente de natura. Corazón mueven súbita partida de seda y frente. Puras almas tomar del vencedor del dulce armonía y famas.',
        82,
        -211,
        -128.86,
        'Webber Church, 13 Thorpe Park, 9347 Bowman, Prince Edward Island, \"SOUTH KOREA\"',
        'game',
        'The game',
        'Second section'
    );

replace into `TEST`.`SIMPLE`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`, `Option`, `EnglishText`, `FrenchText`, `GermanText`, `LatinText`, `SpanishText`, `Integer`, `Natural`, `Real`, `Address`, `CategorySlug`, `CategoryName`, `CategorySection`
    )
    values
    (
        '6d37a888-6bd2-453d-27fb-6c8cc81b0ce3',
        1,
        22,
        86,
        954,
        497,
        916,
        833,
        590,
        44,
        90.28,
        97.92,
        'Itskiglesou',
        'Dillard',
        '2011-12-24',
        '2005-04-27 12:27:01',
        '',
        'first_Itskiglesou',
        'High arcs above him did as these things. Often dark call out devoured up paced to endure.',
        'Tenez lorsque l\'imprimerie fut particulièrement frappé, quand le lecteur se réveiller qu\'une branche et rustre. Trouvez-vous pas mêlé aux goûts maladifs.',
        'Darauf aufmerksam gemacht habe keine Arbeitslosen, Träger großer Verantwortungen übernehmen können nur wünschen.',
        'Facturas biennium cum in atque hac occasione infestis imperii, efficit arbitrabatur tenere discedere velle navibus ex spem fines.',
        'Haciéndola de reina y neptuno, bramines se atenga a su deseo. Hinchen de alejandro a ser mostraba.',
        -171,
        -183,
        -353.86,
        'Thierry Insurance, 23 Loza Alley, 7006 Manville, Missouri, \"ANTIGUA\"',
        'movie',
        'The movie',
        'First section'
    );

replace into `TEST`.`SIMPLE`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`, `Option`, `EnglishText`, `FrenchText`, `GermanText`, `LatinText`, `SpanishText`, `Integer`, `Natural`, `Real`, `Address`, `CategorySlug`, `CategoryName`, `CategorySection`
    )
    values
    (
        '3927e1d2-aa3d-4fb7-06b8-61ef7cd2abbf',
        0,
        34,
        69,
        951,
        655,
        546,
        309,
        599,
        475,
        58.79,
        39.74,
        'Poloncellysy',
        'Sails',
        '2012-04-09',
        '2006-09-01 23:24:27',
        '',
        'first_Poloncellysy',
        'Bid him given upper garments, has had lasted a teaching a child. According to let him of oneness, smiled at sunrise they escape their paths in words.',
        'Lorsqu\'un dommage que parfois plus lourdement sur eux gratuitement, malheureusement la fête un désert et souveraine il dispose.',
        'Diesem Grundsatz heraus notwendig erscheint. Erheblichen Missverständnissen begegnet ist wirkungslos geworden war.',
        'Nostris parendi pro nullum iubet easdem queratur oriente totius insignis, summum tali quod lisco in citra castra equites reiectas parte. Consili permissa honore propter incolitur neque docebantur, caedem neque in hostes tempore.',
        'Tiene ya traía de animales, dad lugar distinto veas lo recibe el diabólico instrumento. Dejo la mafra se gana al encuentro melindano.',
        -159,
        -55,
        -213.83,
        'Sztein Depot, 15 Vanzella Alley, 4375 Bethel Acres, Massachusetts, \"KENYA\"',
        'game',
        'The game',
        'Second section'
    );

replace into `TEST`.`SIMPLE`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`, `Option`, `EnglishText`, `FrenchText`, `GermanText`, `LatinText`, `SpanishText`, `Integer`, `Natural`, `Real`, `Address`, `CategorySlug`, `CategoryName`, `CategorySection`
    )
    values
    (
        '38651c82-bc5f-465d-5c44-5f422a34ae91',
        0,
        74,
        93,
        137,
        242,
        114,
        150,
        662,
        867,
        94.38,
        46.28,
        'Ariellaser',
        'Barszczewski',
        '2001-09-18',
        '2011-03-10 23:57:01',
        '',
        'fourth_2011-03-10 23:57:01',
        'Being seen only interrupting it said, bid him is drawn on by love. Continued thinking fasting is said thoughtful words it\'s enough.',
        'Prenons un moment décisif de parler et quelle que d\'autres, parlons d\'abord que diriez-vous d\'une volonté auprès de joie véritable. Pour pendant ce qu\'elle revienne jamais.',
        'Auf wenige Tage überschritten und Erfolg des Kohlenpreises, dabei immer leben soll ihn uns verlästern, Technisch im Herbst anlässlich der Botschafterkonferenz. Tonnen hätte sich zunächst darum.',
        'Agro neque consilio gorgobinam et germanorum praeter infamia, adsuescere ripis omni per interficitur. Veritus renuntiavisse omnemque vererentur de ea caesar omnes omnis, eo dextro ad ac auxiliis.',
        'Vosotros nunca se hace menos cierto, suceso de arcadia en casos astrosos, reyes moros la neira gente trujo tanta guerra. Ante él vendrá noroña la donde en florido retraimiento.',
        299,
        359,
        658.1,
        'Bradshaw Fund, 54 Tohama Drive, 7879 Pollock, Illinois, \"PALESTINIAN TERRITORIES\"',
        'movie',
        'The movie',
        'First section'
    );

replace into `TEST`.`SIMPLE`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`, `Option`, `EnglishText`, `FrenchText`, `GermanText`, `LatinText`, `SpanishText`, `Integer`, `Natural`, `Real`, `Address`, `CategorySlug`, `CategoryName`, `CategorySection`
    )
    values
    (
        '6f4f80c1-ccc5-41a4-8d35-cda9680e3eaa',
        0,
        82,
        9,
        29,
        290,
        830,
        486,
        562,
        745,
        27.43,
        75.59,
        'Laslolanarwi',
        'Meadows',
        '2003-08-26',
        '2015-11-04 00:14:58',
        '',
        'third_2003-08-26',
        'Both listened to get old would stay he found, same escape the smashing to learn. Isn\'t it likes I thank you well.',
        'Des pires et unique que jamais, raser les morts de complications. Habillez-les simplement plus roués des journaux, l\'immense et sur nous dicte nos cœurs.',
        'Lediglich eine Regelung nur in Atem. Aluminium gemacht hat nach innen gewesen, sind gut aus allen wichtigen Fragen vergessen.',
        'Tanto hostes itaque qua conlatis persuasuros sua incolunt, qui sarcinis alteram fieret in legatos rauracorum ex eos.',
        'Obscureciendo va recontando el arco ebúrneo rico, ilíricos y mira qué aprovecha ni es mentira. Sujetando a descubrir mejor porque entiende.',
        307,
        232,
        539.16,
        'Parman Network, 60 Childress Lane, 8094 Key West, Minnesota, \"CENTRAL AFRICAN REPUBLIC\"',
        'game',
        'The game',
        'Second section'
    );

replace into `TEST`.`SIMPLE`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`, `Option`, `EnglishText`, `FrenchText`, `GermanText`, `LatinText`, `SpanishText`, `Integer`, `Natural`, `Real`, `Address`, `CategorySlug`, `CategoryName`, `CategorySection`
    )
    values
    (
        '4091bcae-bd42-496f-075c-b138a3cced44',
        0,
        37,
        40,
        549,
        675,
        85,
        354,
        971,
        213,
        72.6,
        48.56,
        'Neruillabusa',
        'Timtschenko',
        '2015-07-22',
        '2011-07-20 08:24:00',
        '',
        'first_Neruillabusa',
        'Someone is beautiful learned being alive after year. Arrow-fast he himself carried about he lived alone.',
        'Donnez-vous le métier de fatigue, voyez la société d\'autrefois vos enfants.',
        'Binnenseen dehnt sich zunächst in ihrer stofflichen Zusammensetzung geändert werden, Eine umfangreiche und juristische Fragen beziehen sich entschliesst. Soweit man darf ein wirtschaftliches Dasein führen. Erheblich sind nur an Waffen starrt.',
        'Gallosque iugum re adventu namque, repente suggestu nostrorum altitudinem duas uxellodunum praeficit studere sed diuturnitate. Ne deduxisset appropinquare quod proelioque undique ad contra munitis romani. Quintum vero perferre ante natum et retineri appropinquarent.',
        'Acá pintado en una señal que los cuerpos todos, sosiego darles en calma estando sosegado proseguía, trayéndoles refresco dulce vida ya no resiste.',
        229,
        -211,
        18.17,
        'Twarog Dynamics, 58 Darveau Court, 2318 Lewisetta, Nebraska, \"SWAZILAND\"',
        'movie',
        'The movie',
        'First section'
    );

replace into `TEST`.`SIMPLE`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`, `Option`, `EnglishText`, `FrenchText`, `GermanText`, `LatinText`, `SpanishText`, `Integer`, `Natural`, `Real`, `Address`, `CategorySlug`, `CategoryName`, `CategorySection`
    )
    values
    (
        '65b380d6-35eb-4e83-d34a-9f53c1e5b9ca',
        1,
        69,
        44,
        314,
        91,
        714,
        611,
        410,
        872,
        64.78,
        73.79,
        'Entulbravele',
        'Kahil',
        '2015-11-14',
        '2014-09-27 04:46:42',
        '',
        'fourth_2014-09-27 04:46:42',
        'Worry said that\'s everything out there before read this, exalted spoke the immaterial reward of three years.',
        'J\'en suis parfois si notre esprit d\'union sociale de sécurité, ces phénomènes de marquer ce prétendu axiome social.',
        'Werden sollen wir unseren ersten sechs Monate später reden, Nicht Verhandlungen gefunden wird es meines sehr erheblich sind.',
        'Nisi illius satisfactionem magna poenam interim, non rhenum minus opere atque dicit atque turres unos oppugnationis. Propius volebat cadunt magna undecimam solosque fontis est, defixerat numerum ariovistus partem significabatur est in.',
        'Aquellas gentes guerreras de marruecos el humano. Decidlo sin cuerpos por haber recelo no tornaron, santo su remedio se abalanza.',
        82,
        412,
        494.13,
        'Miskelly Foundation, 69 Bourret Drive, 7509 Glenmont, Arkansas, \"TUNISIA\"',
        'game',
        'The game',
        'Second section'
    );

create table if not exists `TEST`.`COMPOUND`(
    `Id` INT not null auto_increment,
    `Location` TEXT null,
    `Name` TEXT null,
    `NameSet` TEXT null,
    `PhoneList` TEXT null,
    `EmailSet` TEXT null,
    `CompanyMap` TEXT null,
    `SimpleDate` DATE null,
    `SimpleDateMap` TEXT null,
    `SimpleDateSet` TEXT null,
    `SimpleDateList` TEXT null,
    `NameSetMap` TEXT null,
    `Text` TEXT null,
    `TextArray` TEXT null,
    `OtherTextArray` TEXT null,
    primary key( `Id` )
    ) engine = innodb;

replace into `TEST`.`COMPOUND`
    (
        `Id`, `Location`, `Name`, `NameSet`, `PhoneList`, `EmailSet`, `CompanyMap`, `SimpleDate`, `SimpleDateMap`, `SimpleDateSet`, `SimpleDateList`, `NameSetMap`, `Text`, `TextArray`, `OtherTextArray`
    )
    values
    (
        1,
        'Belgium',
        '[\"Malcolm\",\"Beech\"]',
        '[\"[\"Jack\",\"Harper\"]\",\"[\"Victoria\",\"Olsen\"]\"]',
        '[\"12345678\",\"23456789\"]',
        '[\"jack.harper@gmail.com\",\"victoria.olsen@outlook.com\"]',
        '{\"12345678\":\"Warner Bros\",\"23456789\":\"Universal Pictures\"}',
        '2015-07-22',
        '{\"[\"Lorie\",\"Roscoe\"]\":\"2015-07-22\",\"[\"Yosuf\",\"Schellenberger\"]\":\"2012-04-09\"}',
        '[\"2003-08-26\",\"2011-12-24\",\"\"]',
        '[\"2015-07-22\",\"2012-04-09\",\"2000-03-04\"]',
        '{\"2000-03-04\":\"[\"[\"Dorris\",\"Burgi\"]\",\"[\"Hsieh\",\"Ihnat\"]\"]\",\"2014-11-21\":\"[\"[\"Gursharan\",\"Lamarque\"]\",\"[\"Florri\",\"Pridgen\"]\"]\"}',
        '{}',
        '[\"first\\n\\n\",\"second\\n\\n\"]',
        '[\"first\\n\\n\",\"second\\n\\n\"]'
    );

replace into `TEST`.`COMPOUND`
    (
        `Id`, `Location`, `Name`, `NameSet`, `PhoneList`, `EmailSet`, `CompanyMap`, `SimpleDate`, `SimpleDateMap`, `SimpleDateSet`, `SimpleDateList`, `NameSetMap`, `Text`, `TextArray`, `OtherTextArray`
    )
    values
    (
        2,
        '',
        '[\"\",\"\"]',
        '[\"[\"\",\"\"]\",\"[\"\",\"\"]\"]',
        '[\"\",\"\"]',
        '[\"rick.deckard@gmail.com\",\"dave.holden@outlook.com\"]',
        '{\"12345678\":\"\",\"23456789\":\"\"}',
        '2000-03-04',
        '{\"[\"Lucila\",\"Hendrickse\"]\":\"2007-12-28\",\"[\"\",\"\"]\":\"2003-08-26\"}',
        '[\"2015-07-22\",\"2011-12-24\"]',
        '[\"2003-08-26\"]',
        '{\"2003-08-26\":\"[\"[\"Goldi\",\"Tilton\"]\",\"[\"Nydia\",\"Kirkley\"]\"]\",\"2011-12-24\":\"[\"[\"Floria\",\"Bucklin\"]\",\"[\"Arabele\",\"Tapner\"]\"]\"}',
        '',
        '[\"first\\n\\n\",\"second\\n\\n\"]',
        '[\"first\\n\\n\",\"second\\n\\n\"]'
    );

replace into `TEST`.`COMPOUND`
    (
        `Id`, `Location`, `Name`, `NameSet`, `PhoneList`, `EmailSet`, `CompanyMap`, `SimpleDate`, `SimpleDateMap`, `SimpleDateSet`, `SimpleDateList`, `NameSetMap`, `Text`, `TextArray`, `OtherTextArray`
    )
    values
    (
        3,
        'Ogaffpaurmer',
        '[\"Stephie\",\"Pietromonaco\"]',
        '[\"[\"Lesli\",\"Samaroo\"]\",\"[\"Almeda\",\"Arnone\"]\"]',
        '[\"+49 244 187 677\",\"+27 308 575 242\"]',
        '[\"prue.sponchia@yahoo.com\",\"molly.holness@outlook.com\"]',
        '{\"+72 985 294 986\":\"Clark Factory\",\"+99 362 676 443\":\"Qainfo College\"}',
        '2007-12-28',
        '{\"[\"Yosuf\",\"Schellenberger\"]\":\"2003-08-26\",\"[\"Kelley\",\"Curley\"]\":\"2015-07-22\"}',
        '[\"2015-11-14\",\"2014-11-21\"]',
        '[\"2007-12-28\"]',
        '{\"2012-04-09\":\"[\"[\"Meridian\",\"Novisedlak\"]\",\"[\"Lyndsey\",\"Filkins\"]\"]\",\"2007-12-28\":\"[\"[\"Lesli\",\"Samaroo\"]\",\"[\"Almeda\",\"Arnone\"]\"]\"}',
        'Fully understanding what pain filled her breast, young woman on wondrous words it\'s enough, saw gods and trifles to an old. Secretly he positioned himself he inhaled and shivered.',
        '[]',
        '[\"first\\n\\n\",\"second\\n\\n\"]'
    );

replace into `TEST`.`COMPOUND`
    (
        `Id`, `Location`, `Name`, `NameSet`, `PhoneList`, `EmailSet`, `CompanyMap`, `SimpleDate`, `SimpleDateMap`, `SimpleDateSet`, `SimpleDateList`, `NameSetMap`, `Text`, `TextArray`, `OtherTextArray`
    )
    values
    (
        4,
        'Kwokeryxu',
        '[\"Jilleen\",\"Garee\"]',
        '[\"[\"Goldi\",\"Tilton\"]\",\"[\"Nydia\",\"Kirkley\"]\"]',
        '[\"+32 163 739 947\",\"+75 114 711 811\"]',
        '[\"wini.novia@yahoo.com\",\"christiane.rossi@gmail.com\"]',
        '{\"+84 785 658 199\":\"Koss College\",\"+84 151 334 128\":\"Ude Fx\"}',
        '2014-11-21',
        '{\"[\"Lorie\",\"Roscoe\"]\":\"2003-08-26\",\"[\"Malcolm\",\"Beech\"]\":\"2001-09-18\"}',
        '[\"2012-04-09\",\"2014-11-21\"]',
        '[\"2001-09-18\",\"2012-04-09\",\"2014-11-21\"]',
        '{\"2007-12-28\":\"[\"[\"Jack\",\"Harper\"]\",\"[\"Victoria\",\"Olsen\"]\"]\",\"2014-11-21\":\"[\"[\"Goldi\",\"Tilton\"]\",\"[\"Nydia\",\"Kirkley\"]\"]\"}',
        'Sleep was heading saw it may see such jokes, thing most holy source spring from your mouth. Not you had flown into my forehead, you\'re not answer every spot of followers of rice-cake.',
        '[]',
        '[\"first\\n\\n\",\"second\\n\\n\"]'
    );

replace into `TEST`.`COMPOUND`
    (
        `Id`, `Location`, `Name`, `NameSet`, `PhoneList`, `EmailSet`, `CompanyMap`, `SimpleDate`, `SimpleDateMap`, `SimpleDateSet`, `SimpleDateList`, `NameSetMap`, `Text`, `TextArray`, `OtherTextArray`
    )
    values
    (
        5,
        'Entillsanksy',
        '[\"Lucila\",\"Hendrickse\"]',
        '[\"[\"Meridian\",\"Novisedlak\"]\",\"[\"Lyndsey\",\"Filkins\"]\"]',
        '[\"+82 313 337 870\",\"+93 444 597 648\"]',
        '[\"melloney.vonreichbauer@gmail.com\",\"susi.teniola@live.com\"]',
        '{\"+21 697 800 700\":\"Udall Depot\",\"+98 786 553 396\":\"Vandagriff Media\"}',
        '2001-09-18',
        '{\"[\"Yosuf\",\"Schellenberger\"]\":\"2001-09-18\",\"[\"Lorie\",\"Roscoe\"]\":\"2007-12-28\"}',
        '[\"2001-09-18\",\"2003-08-26\"]',
        '[\"2015-11-14\",\"2012-04-09\"]',
        '{\"2007-12-28\":\"[\"[\"Goldi\",\"Tilton\"]\",\"[\"Nydia\",\"Kirkley\"]\"]\",\"2003-08-26\":\"[\"[\"Lesli\",\"Samaroo\"]\",\"[\"Almeda\",\"Arnone\"]\"]\"}',
        'Among other thousand times I reach that foolish world, loved any work there where do I think. Worry in bliss was unchanged quiet bubbles of joy, made friends like them grow dim shade of age.',
        '[]',
        '[\"first\\n\\n\",\"second\\n\\n\"]'
    );

replace into `TEST`.`COMPOUND`
    (
        `Id`, `Location`, `Name`, `NameSet`, `PhoneList`, `EmailSet`, `CompanyMap`, `SimpleDate`, `SimpleDateMap`, `SimpleDateSet`, `SimpleDateList`, `NameSetMap`, `Text`, `TextArray`, `OtherTextArray`
    )
    values
    (
        6,
        'Anniottalmy',
        '[\"Yosuf\",\"Schellenberger\"]',
        '[\"[\"Crawford\",\"Panke\"]\",\"[\"Willow\",\"Fattouh\"]\"]',
        '[\"+98 646 604 227\",\"+16 944 322 211\"]',
        '[\"shigeru.mennie@yahoo.com\",\"siana.zukosky@gmail.com\"]',
        '{\"+41 972 557 112\":\"Botto Consulting\",\"+90 447 283 816\":\"Orford Agency\"}',
        '2011-12-24',
        '{\"[\"Emil\",\"Maxsom\"]\":\"2011-12-24\",\"[\"Stephie\",\"Pietromonaco\"]\":\"2012-04-09\"}',
        '[\"2014-11-21\",\"2003-08-26\"]',
        '[\"2007-12-28\"]',
        '{\"2001-02-03\":\"[\"[\"Floria\",\"Bucklin\"]\",\"[\"Arabele\",\"Tapner\"]\"]\",\"2012-04-09\":\"[\"[\"Floria\",\"Bucklin\"]\",\"[\"Arabele\",\"Tapner\"]\"]\"}',
        'Down next morning after another for him, world is that this piece of their travels. Lust the bananas in luxury and again, example hadn\'t learned here under his worries, takes everyone the sleeping in him beautifully her sedan-chair.',
        '[]',
        '[\"first\\n\\n\",\"second\\n\\n\"]'
    );

replace into `TEST`.`COMPOUND`
    (
        `Id`, `Location`, `Name`, `NameSet`, `PhoneList`, `EmailSet`, `CompanyMap`, `SimpleDate`, `SimpleDateMap`, `SimpleDateSet`, `SimpleDateList`, `NameSetMap`, `Text`, `TextArray`, `OtherTextArray`
    )
    values
    (
        7,
        'Aillondetor',
        '[\"Kelley\",\"Curley\"]',
        '[\"[\"Gursharan\",\"Lamarque\"]\",\"[\"Florri\",\"Pridgen\"]\"]',
        '[\"+79 158 744 775\",\"+46 480 958 449\"]',
        '[\"darrin.vigeant@yahoo.com\",\"lea.morrissette@outlook.com\"]',
        '{\"+38 355 828 896\":\"Stjohn Incorporated\",\"+58 851 170 639\":\"Charter Fund\"}',
        '2015-11-14',
        '{\"[\"Emil\",\"Maxsom\"]\":\"2001-09-18\",\"[\"Kalpit\",\"Chadwick\"]\":\"2015-11-14\"}',
        '[\"2015-07-22\",\"2000-03-04\"]',
        '[\"2012-04-09\"]',
        '{\"2001-09-18\":\"[\"[\"Lesli\",\"Samaroo\"]\",\"[\"Almeda\",\"Arnone\"]\"]\",\"2014-11-21\":\"[\"[\"Lesli\",\"Samaroo\"]\",\"[\"Almeda\",\"Arnone\"]\"]\"}',
        'Came who used the fearful man that all, or having patience when has taught me on. Conducted him happiness felt drawn on bed and denial.',
        '[]',
        '[\"first\\n\\n\",\"second\\n\\n\"]'
    );

replace into `TEST`.`COMPOUND`
    (
        `Id`, `Location`, `Name`, `NameSet`, `PhoneList`, `EmailSet`, `CompanyMap`, `SimpleDate`, `SimpleDateMap`, `SimpleDateSet`, `SimpleDateList`, `NameSetMap`, `Text`, `TextArray`, `OtherTextArray`
    )
    values
    (
        8,
        'Marvetteco',
        '[\"Kalpit\",\"Chadwick\"]',
        '[\"[\"Pearla\",\"Bilovus\"]\",\"[\"Aloysia\",\"Hollister\"]\"]',
        '[\"+59 231 211 345\",\"+47 844 388 769\"]',
        '[\"earl.zalite@yahoo.com\",\"ketti.hembrick@gmail.com\"]',
        '{\"+80 759 112 926\":\"Kinrys Depot\",\"+68 123 586 700\":\"Ochoa Tech\"}',
        '2015-07-22',
        '{\"[\"\",\"\"]\":\"2003-08-26\",\"[\"Emil\",\"Maxsom\"]\":\"2014-11-21\"}',
        '[\"2014-11-21\",\"2003-08-26\"]',
        '[\"2011-12-24\",\"2011-12-24\",\"2015-07-22\"]',
        '{\"2012-04-09\":\"[\"[\"Gursharan\",\"Lamarque\"]\",\"[\"Florri\",\"Pridgen\"]\"]\",\"2007-12-28\":\"[\"[\"Jack\",\"Harper\"]\",\"[\"Victoria\",\"Olsen\"]\"]\"}',
        'We\'ll continue gambling he displayed a goal, until his oldest monks are destined for finding means, fine clothes for dwell on and smiled. Years bearing his growing up impetuously hunting, from your home a house from death.',
        '[]',
        '[\"first\\n\\n\",\"second\\n\\n\"]'
    );

replace into `TEST`.`COMPOUND`
    (
        `Id`, `Location`, `Name`, `NameSet`, `PhoneList`, `EmailSet`, `CompanyMap`, `SimpleDate`, `SimpleDateMap`, `SimpleDateSet`, `SimpleDateList`, `NameSetMap`, `Text`, `TextArray`, `OtherTextArray`
    )
    values
    (
        9,
        'Ervopenaso',
        '[\"Emil\",\"Maxsom\"]',
        '[\"[\"Floria\",\"Bucklin\"]\",\"[\"Arabele\",\"Tapner\"]\"]',
        '[\"+74 302 151 991\",\"+64 962 831 217\"]',
        '[\"lingyan.tilson@gmail.com\",\"bryana.craddock@mail.com\"]',
        '{\"+73 996 161 153\":\"Kernahan Network\",\"+72 526 182 533\":\"Merrick Corporation\"}',
        '2011-12-24',
        '{\"[\"Jilleen\",\"Garee\"]\":\"2000-03-04\",\"[\"Yosuf\",\"Schellenberger\"]\":\"2012-04-09\"}',
        '[\"2014-11-21\",\"2015-07-22\"]',
        '[\"2014-11-21\",\"2001-09-18\"]',
        '{\"2014-11-21\":\"[\"[\"Crawford\",\"Panke\"]\",\"[\"Willow\",\"Fattouh\"]\"]\",\"2003-08-26\":\"[\"[\"\",\"\"]\",\"[\"\",\"\"]\"]\"}',
        'Willingness delights my student her the poison, bid him forgetfulness and robbers have a dreary life. Thinking does nothing he wore the perfection.',
        '[]',
        '[\"first\\n\\n\",\"second\\n\\n\"]'
    );

replace into `TEST`.`COMPOUND`
    (
        `Id`, `Location`, `Name`, `NameSet`, `PhoneList`, `EmailSet`, `CompanyMap`, `SimpleDate`, `SimpleDateMap`, `SimpleDateSet`, `SimpleDateList`, `NameSetMap`, `Text`, `TextArray`, `OtherTextArray`
    )
    values
    (
        10,
        'Tanaithmamer',
        '[\"Lorie\",\"Roscoe\"]',
        '[\"[\"Dorris\",\"Burgi\"]\",\"[\"Hsieh\",\"Ihnat\"]\"]',
        '[\"+85 315 613 870\",\"+26 478 431 479\"]',
        '[\"cassandry.mckinlay@mail.com\",\"vasu.devarennes@outlook.com\"]',
        '{\"+32 741 334 448\":\"Harrell Union\",\"+94 525 460 579\":\"Eisnor Association\"}',
        '2012-04-09',
        '{\"[\"Malcolm\",\"Beech\"]\":\"2015-07-22\",\"[\"Stephie\",\"Pietromonaco\"]\":\"2001-09-18\"}',
        '[\"2011-12-24\",\"2015-11-14\"]',
        '[\"2003-08-26\"]',
        '{\"2003-08-26\":\"[\"[\"Gursharan\",\"Lamarque\"]\",\"[\"Florri\",\"Pridgen\"]\"]\",\"2014-11-21\":\"[\"[\"Floria\",\"Bucklin\"]\",\"[\"Arabele\",\"Tapner\"]\"]\"}',
        'Clothes I needed the goat stood in thought, hours he in loops perhaps a river. But its vigour and remembered his service, latter had the merchant also to destroy himself with. Could not half unconsciousness a servant as true.',
        '[]',
        '[\"first\\n\\n\",\"second\\n\\n\"]'
    );

create table if not exists `TEST`.`VALUE`(
    `Tuid` VARCHAR(22) not null,
    `Uuid` VARCHAR(36) null,
    `Name` TEXT null,
    `Integer` INT null,
    `Text` TEXT null,
    primary key( `Tuid` )
    ) engine = innodb;

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        'iwTV43ddKY54RV78XKQE1Q',
        '8b04d5e3-775d-298e-7845-5efc5ca404d5',
        'first',
        1,
        ' This is the first text, with spaces '
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        'qfDmGhN9hqqdtTRl4IAWEg',
        'a9f0e61a-137d-86aa-9db5-3465e0801612',
        'second',
        2,
        'This is the second text, with escaped characters ^~{}'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        '3VyL9RVY_8vlAHBxkI6VJA',
        'dd5c8bf5-1558-ffcb-e500-7071908e9524',
        'third',
        3,
        'This is the third text§with a new line'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        'wHWfJBZJhwiEHnl1VmNgzg',
        'c0759f24-1649-8708-841e-7975566360ce',
        'fourth',
        4,
        'This is the fourth text§also with a new line'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        'iVfws2umAbnEW4uoOYkr1Q',
        '9616a991-529b-426f-55e1-21af614a105f',
        'Falquero',
        299,
        'False god more miserable hut this arose his tale, I\'m able to change quickly across a of sleep. Gives me away from crying he made my name. Having grown slightly weak at all would go on.'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        'qR_E1-l2FsnnqlBit7vpxg',
        '61c27d53-94a6-4626-ab40-b8d06954eb5f',
        'Garand',
        892,
        'Never he saw agni he shall know in confirmation, greed from walking back to kiss and the. Sun dreams came running in the courtesans, shouldn\'t I hadn\'t learned harder things you kidding.'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        'Cis5zMeIncHlOjaTLDxc9g',
        '2db767e7-d493-44a4-9bcb-e3e7a6a5ad5f',
        'Gabbai',
        977,
        'As the stone was enough of dice the ruins, exclaimed if he went to enlightenment hit him. You\'ve heard shuddering with reluctance to capture it, another way said nothing to play the courtesans, they both perceived the who flock of worship.'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        'PfsZCM68qaMs0xcxgfnMWA',
        '10840bf4-a066-49c9-7d76-2899273108c6',
        'Nisbet',
        620,
        'While asking to take him awake which she asked. Different life a game occupied his voice sounded sweet, them this death a voice inside that time. Wants to glance at my speech flowed on.'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        '5NzPFRG7Q-WJdN1QDD2BVw',
        '5d6cfbe6-12d2-4df9-d35e-5f4e88e36179',
        'Lao',
        950,
        'Softly in words so differently the glory, has eaten and into friendly manner laughed this birth, it don\'t know about that kind with her. What\'s the last hut with thinking that all. Rose up money if you to it.'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        'QrEPmsZIru5HS0yQY9OshA',
        '21f8f15b-0824-4cc4-ddf8-ba50114fc80f',
        'Mensinkai',
        325,
        'Greeted him safe from old man like him. Means that foolish act upon all distress. Enjoyed his acts and you ran without me. Asked what and answers and will seek depth.'
    );

create table if not exists `TEST`.`VALUE_DATA`(
    `Uuid` VARCHAR(36) not null,
    `ValueTuid` VARCHAR(22) null,
    `ValueUuid` VARCHAR(36) null,
    primary key( `Uuid` )
    ) engine = innodb;

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        '1f510889-ecb0-4fe0-c2a8-543f4d105bd3',
        'iwTV43ddKY54RV78XKQE1Q',
        '8b04d5e3-775d-298e-7845-5efc5ca404d5'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        'aa3d3d22-ff3b-474a-9105-f5ada2ce4259',
        'qfDmGhN9hqqdtTRl4IAWEg',
        'a9f0e61a-137d-86aa-9db5-3465e0801612'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        'f7f30a5d-06ec-4496-cf5a-f01d7a6777b3',
        '3VyL9RVY_8vlAHBxkI6VJA',
        'dd5c8bf5-1558-ffcb-e500-7071908e9524'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        '900813da-8311-42c0-13e1-45d2a45e1755',
        'CIOmUg5utskwTc-3EDTQUw',
        '0883a652-0e6e-b6c9-304d-cfb71034d053'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        '95a7a1e4-7e2f-4e19-bebb-60437dab221b',
        'qfDmGhN9hqqdtTRl4IAWEg',
        'c0759f24-1649-8708-841e-7975566360ce'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        'cc2b4363-483f-48ee-ae0f-4b7f7064d26b',
        'wHWfJBZJhwiEHnl1VmNgzg',
        '9616a991-529b-426f-55e1-21af614a105f'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        'd9930b0e-0812-418b-6aaa-ac357bdb002a',
        'iwTV43ddKY54RV78XKQE1Q',
        'dd5c8bf5-1558-ffcb-e500-7071908e9524'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        '27ea72a9-17c7-47c8-7dbf-6f9e63ae7624',
        'wHWfJBZJhwiEHnl1VmNgzg',
        '10840bf4-a066-49c9-7d76-2899273108c6'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        'dc8ecdf6-7507-43c9-c236-d7dbc64888f3',
        'iVfws2umAbnEW4uoOYkr1Q',
        'dd5c8bf5-1558-ffcb-e500-7071908e9524'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        'd361868c-b471-4281-f6c0-227ad63f07f9',
        '3VyL9RVY_8vlAHBxkI6VJA',
        'dd5c8bf5-1558-ffcb-e500-7071908e9524'
    );

set sql_mode=@old_sql_mode;
set foreign_key_checks=@old_foreign_key_checks;
set unique_checks=@old_unique_checks;
