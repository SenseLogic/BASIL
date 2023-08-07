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
        'Boraie',
        '2001-02-03',
        '2001-02-03 04:05:06.789',
        '123456781234567891234567812345678',
        'first_Hello world!',
        'Gloomy and stood for sixty and preserved by a pause, opposite bank upriver on to lose a thought. Looking up to such feats.',
        'Rapprochés ainsi tout dit pour sortir du front, laissez le sommet des prudences des gens. Sur nos filles du bon sang et parlent enseignent, loin s\'épanouit le parasite couché au service de l\'existence.',
        'Zwei Jahren die Reparationsfrage erhoffen, Aussenhandel Amerikas nach Norden kommen. Entweder war auf Dollars sich dazu führen sollen. Nur wenige vorübergegangen sind gestern schwere Druck gelastet.',
        'Mora prorae quod insistere eam castra, nam nova ariovistus exercitus esse re.',
        'Aforros de moverlo con valor del universo recogiendo, míralos con gusto tanto grado que guiando. Cuáles con certeza de fábulas compuesta se entremete, habíamos cercado con escudo yelmo y deleitoso.',
        2,
        3,
        5.19,
        'Mazzei Store, 65 Hempstead Alley, 9115 Carsonville, Nova Scotia, \"RWANDA\"',
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
        'b7558cc1-d1ca-4263-ab0b-d1b2a580b230',
        1,
        77,
        61,
        641,
        969,
        605,
        471,
        457,
        8,
        29.25,
        18.37,
        'Elegrinuq',
        'Vangastel',
        '2010-12-24',
        '2012-07-04 11:22:18',
        '',
        'third_2010-12-24',
        'Broke loose embraced the stakes, consciousness returned home without hesitation these words.',
        'N\'y ait dans leurs affinités de supposer qu\'en souffrances profondes, toujours l\'indestructible la néglige de s\'aimer en force.',
        'Bekanntlich soll nicht verdenken –, wurde es ringt mit Ausnahme der Bevölkerung des reinen. Wenn am Geschick Europas unvergessen bleiben wird. Eingeschlossen war Vertrauen im Frieden und angelernt werden.',
        'Vallo appellatus sub concilium locum coniuratione coepta, disponit quaerentibus novissimumque passuum quos loco his.',
        'Equipados bateles entraban y húyese al moderno. Atrás viene gama quiere ayudar al carro guía, levanta el menor mal entendido. Perdón alcanzarás dando en todos su piloto necesario.',
        -53,
        -450,
        -502.82,
        'Bowser Group, 63 Nekueey Alley, 5356 Newborn, Arizona, \"BOTSWANA\"',
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
        'c422938b-827e-45a4-ce5e-5186831ea04a',
        1,
        44,
        60,
        266,
        640,
        307,
        947,
        211,
        515,
        70.95,
        14.11,
        'Rududbesi',
        'Barnickel',
        '2015-09-04',
        '2004-02-23 17:02:03',
        '',
        'third_2015-09-04',
        'Until nothing there with sky-blue ones, want back under a drinker and deep contemplation washing clothes. Offerings and hardly perceived the heart with enticed me. According to hate this side as `learning\'.',
        'Pourquoi passe-t-elle blanche des parasites tout intérieure, à dieu merci il vivra en monnaie authentique. Nos pères ont laissé tout progrès et l\'aient réparé.',
        'Warum sollen wir den eigentlichen Wirtschaftskörper unserer juristischen Natur sind, einem Volk eine Hypothese hat bei einem Europa. Unter Ausschaltung der Berg der Verantwortungen übernehmen können sagen möchte. Zweifellos wird dieses Vorstellungskreises beleuchten.',
        'Oppido oppugnare antea oppidani tenuissima suaque suas auctoritatem milia, turrim multis proiecit neque domum tradi cogendi capit cum domoque, unaque fors ferebatur belli legiones.',
        'Gastando en muros perpetuos edifica, llámase men moñiz que fueron y remo corro. Relinchan los vaivenes del tonante al vicioso.',
        -5,
        -32,
        -36.82,
        'Kurczak Church, 94 Saladna Court, 3160 Morgnec, Manitoba, \"CHILE\"',
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
        '2eaac478-6701-46fd-fc0d-d85d92f9cd33',
        0,
        3,
        12,
        856,
        508,
        707,
        650,
        944,
        994,
        86.79,
        55.25,
        'Casedastas',
        'Silgardo',
        '2013-04-08',
        '2015-11-08 20:43:43',
        '',
        'first_Casedastas',
        'Go and horror in front of despair, once and bone it don\'t worry said.',
        'Ses capacités se vendront pas celui dont la santé, viennent ensuite parce qu\'il fallait détruire pour aimer cette pensée.',
        'Bestimmt sind materiell umfassend und hier ein Strom, Sie wird voraussichtlich bis zu erhalten.',
        'Esse neu treveris magnisque milia dispersos nostro ambarros omnium, orientem dicere passuum facturos erant eorum in administrarent conlocare. Equitatumque plerumque defecerant distribuerunt se iudicari finitimae amplius separare.',
        'Allegan a españa no yerra, mostrándoles sus consejeros y fuentes van reprobando, deseoso de usanza antigua edad primera ala derecha lusitanos.',
        45,
        249,
        294.17,
        'Leicht Club, 49 Davidson Park, 7510 Keno, Newfoundland, \"ALBANIA\"',
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
        '81473c98-e79d-47da-399a-20b104ff2db6',
        0,
        28,
        10,
        219,
        792,
        61,
        50,
        793,
        307,
        30.84,
        50.74,
        'Koresteratex',
        'Rance',
        '2000-12-18',
        '2008-12-05 08:54:20',
        '',
        'third_2000-12-18',
        'Wants to work did his religious devotion his shoulder. Enjoyed his feet his death a basket, went through realizations all have completely filled with. Also saw a stronger sensation than before we were brothers.',
        'Telle situation et défendre votre religion et mêmes tendances, vues du mérite salaire que trop d\'excès de belles périodes. Vu le nom pense qu\'il n\'éclaire plus étroite les réclames, d\'où l\'on a vu les connaît le comble de fruit.',
        'Vielleicht eine Regelung unserer Zeit, Barzahlungen für genannt werden könne dieses Ziel verfolgen. Bereitete die öffentliche Meinung der Hydra.',
        'Ubi in ut iubet iure sibi venisset hanc ad. Viridomarus eodem naviculam a in morinos satis, se tribunus piscibus memoria gnaeum illos. Quid adventu inter animadvertit modum cum qui.',
        'Súbitas tempestades peligrosas sirtes bajíos arenosos, llámase men moñiz que tus pasados se aparece. Sonorosas trompetas arcadas que reinaba.',
        301,
        -237,
        64.17,
        'Biggs Cooperative, 41 Brower Avenue, 4654 Valkaria, Louisiana, \"EGYPT\"',
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
        '7fa4e9b4-8020-4043-8de0-85f9f7c482aa',
        0,
        20,
        6,
        600,
        602,
        877,
        130,
        673,
        681,
        36.83,
        21.02,
        'Beraughlibur',
        'Wepf',
        '2013-01-26',
        '2005-12-11 08:03:08',
        '',
        'fourth_2005-12-11 08:03:08',
        'Greeted her left on bed of is worrying me, a life what else but many holy men come back. What has taught me over, like foolishness used crude swearwords.',
        'L\'anarchie intérieure ne tarde pas quelqu\'un que pendant la publicité. Plutôt triste dans certains riches trop compliqué et dangereux, elle il transforme le couvreur et garder le parfait l\'infaillible.',
        'Bringt euer Budget für Ruhe und Tochterinstituten, dadurch eine höhere Summe von unbeglaubigten Zeitungsmitteilungen.',
        'Ingredi rei duce habuisse locum noctes suspiciones differunt rivumque confestim. Vero in esse se relinquit impediebatur, maiorem oppidani deductis frumentumque viridovix, successerunt interposita ipsos ille facere bos cum oppidum sibi.',
        'Tocas en olores gran genealogía, describiré primero mallas petos relucientes.',
        46,
        42,
        88.14,
        'Hopper Insurance, 14 Bestavros Park, 8410 Lanare, North Carolina, \"ALGERIA\"',
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
        'e9613f9b-0f23-471c-c885-10dc670fb441',
        0,
        45,
        93,
        845,
        631,
        676,
        23,
        93,
        290,
        27.38,
        73.02,
        'Amboinedina',
        'Amstutz',
        '2002-09-22',
        '2009-07-20 20:35:25',
        '',
        'first_Amboinedina',
        'Loved and felt them with words. When bored and dice-gambler the thousand eyes glistening.',
        'Lorsqu\'un dommage que s\'imposent les misères physiques et mondaine. Pauvres des années de ménage que cela c\'est vous, tu sois bon marché de moïse de logique. Tant qu\'il puisse comme il faudrait souhaiter à quelques-uns.',
        'Barzahlungen für handfeste Begriffe verstehen ist leer, will hier seinen unerschütterlichen Willen zur Produktionskraft überstieg. Habe keine Wirkung hat nach eine Goldmilliarde zu Gefallen, um und überwacht werden sucht.',
        'Iri laus gloriarentur non praeesse vulgare ad remorum, omnibus loco delegerat sequi relictae evocatis. Dimissis caesarem rebus aut de ab itinere germani.',
        'Germanos son muy a mercedes, temer las ofensas vaya o frío. Emprendiendo otra igual a aquesto holgarse grandemente.',
        -353,
        -124,
        -476.87,
        'Judd University, 89 Brichetto Lane, 8877 Parcelas Penuelas, Alabama, \"BURMA\"',
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
        '39149150-492b-440c-bcf9-95d744305b14',
        1,
        21,
        65,
        235,
        110,
        150,
        43,
        339,
        598,
        22.28,
        80.42,
        'Audelan',
        'Hawkes',
        '2011-01-01',
        '2008-04-17 18:20:37',
        '',
        'first_Audelan',
        'Your own knowledge he returned to rest, ate once seen him something cooked rice.',
        'Ou son temps madame mais voilà ce temps. Or en eux dans quelque chose plus noble, ailleurs qui accompagne les avares les satisfaire, qu\'est-ce qu\'une fleur une transformation intérieure.',
        'Als unzulänglich erkannt waren wir noch etwas sagen sollen. Französische Einrichtungen wurden in Frankreich hergestellt. Bleiben wir uns im Kriegsministerium untergebracht, Täglich hören bekommt der Sanierung wird sich bewährt hat.',
        'Hostes immolaturos homines desperata ambiorix, consequi ab tribuebat iubet quibus transrhenanis at familia depressis.',
        'Animales tiene más sirve y preguntando al cuerpo verse, salta a termodonte ya la suya exalta, dándole al español poder inmenso de tiranía y tierra codiciosos.',
        62,
        276,
        338.13,
        'Coyle Incorporated, 13 Ramroop Park, 1210 Hebron, Utah, \"TURKMENISTAN\"',
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
        '9169c687-6aea-424e-11ba-8b43d116bd6e',
        1,
        95,
        5,
        411,
        710,
        117,
        81,
        494,
        668,
        65.2,
        44.03,
        'Kosihy',
        'Finane',
        '2010-11-26',
        '2005-07-12 04:41:49',
        '',
        'second_Finane',
        'Carefully he happened more petty in ear, knowing and could hurt you hear. Death is blown across this thought thus new man.',
        'Ceux-là sont légion de l\'orner, poursuivant ses auditeurs et meurt. Détruisez cette transformation intérieure et pénétrer le centre.',
        'Damals war zu bewegen sind eine Kriegsdauer, pflichtgemäss zerstören oder mehrere Tausend zu beschaffen müssen. Nicht den Ausbau unserer Industrie zu weiteren Ausführungen des Volkes, wehe uns in gleichem Masse zu wirken verschiedene schwere Europamüdigkeit.',
        'Provincia supra sed ad sed fervefacta molita a sponte, ad non se ipse remis reliquis.',
        'Marlota de nereo que muestra entre piedras, preguntar mas con rumor no entendía.',
        89,
        -18,
        71.16,
        'Fuller Team, 61 Bartley Court, 1173 Callimont, Illinois, \"MALDIVES\"',
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
        '5eeb2d1e-fd99-4124-c240-8ce6b885026a',
        0,
        85,
        22,
        134,
        116,
        464,
        197,
        447,
        881,
        32.88,
        84.53,
        'Kacardettu',
        'Wagoner',
        '2010-11-05',
        '2008-01-10 04:46:07',
        '',
        'third_2010-11-05',
        'Awakened I prefer the scene of dice, nevertheless he listened curiously to bear your child.',
        'Allez voir pour l\'empêcher de paraître, essayer de vrai moi intime diminue d\'intensité quand les recueillir.',
        'Das Riesengebiet der Berechnung versagt hat mit Vertretern, Meine Herren aus unseren Willen zur Verfügung, gestatten Sie alle Zeit von Zahlen geben lassen könnten. Eure Wirtschaft geltend machen sollen.',
        'Helvetiis navigia ut propter venientes is. Et omnium duabus cum ex caesar posset nostros, gratia tamen purgandi libertatem ac.',
        'Cuánto mejor es veloso con juan primero que imitaba, capitular de ceilán el climeneo la parca fué provecho, sus hijos y néctar sobre todos digno al bravo toro.',
        199,
        393,
        592.16,
        'Mayo Society, 36 Schemena Boulevard, 9361 Ogilvie, Nova Scotia, \"ECUADOR\"',
        'movie',
        'The movie',
        'First section'
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
        '2013-01-26',
        '{\"[\"Tin\",\"De\"]\":\"2010-12-24\",\"[\"Gant\",\"Mcsween\"]\":\"2015-09-04\"}',
        '[\"2010-11-05\",\"2002-09-22\"]',
        '[\"2011-01-01\"]',
        '{\"2010-11-26\":\"[\"[\"Celinda\",\"Hrvatin\"]\",\"[\"Augusta\",\"Lipscomb\"]\"]\",\"2013-01-26\":\"[\"[\"Mariesara\",\"Zielinski\"]\",\"[\"Denver\",\"Rothamel\"]\"]\"}',
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
        '2010-12-24',
        '{\"[\"Sanjay\",\"Hollingshead\"]\":\"2015-09-04\",\"[\"\",\"\"]\":\"2001-02-03\"}',
        '[\"2013-01-26\",\"2011-01-01\"]',
        '[\"2000-12-18\",\"2010-11-26\"]',
        '{\"2013-04-08\":\"[\"[\"Tani\",\"Koerner\"]\",\"[\"Tadayuki\",\"Didioduggan\"]\"]\",\"2010-11-26\":\"[\"[\"Tani\",\"Koerner\"]\",\"[\"Tadayuki\",\"Didioduggan\"]\"]\"}',
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
        'Owdehow',
        '[\"Odelle\",\"Lotochinski\"]',
        '[\"[\"Linette\",\"Mcisaac\"]\",\"[\"Fariborz\",\"Vidmer\"]\"]',
        '[\"+59 587 321 714\",\"+43 451 411 419\"]',
        '[\"germ.wrobel@mail.com\",\"gregory.currer@yahoo.com\"]',
        '{\"+55 777 191 386\":\"Browne Labs\",\"+19 846 462 119\":\"Meckler Fx\"}',
        '2010-11-05',
        '{\"[\"Giacinta\",\"Blakkolb\"]\":\"2001-02-03\",\"[\"Gant\",\"Mcsween\"]\":\"2011-01-01\"}',
        '[\"2000-12-18\",\"2015-09-04\"]',
        '[\"2010-11-05\",\"2013-04-08\"]',
        '{\"2002-09-22\":\"[\"[\"Rick\",\"Stonos\"]\",\"[\"Roseanna\",\"Mansourati\"]\"]\",\"2011-01-01\":\"[\"[\"Vrouwerff\",\"Early\"]\",\"[\"Jodee\",\"Bolly\"]\"]\"}',
        'Hours looked over every naughtiness with words. It\'s enough to comfort and said things asked again, over came without giving pleasure of teachings he exclaimed.',
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
        'Harlenele',
        '[\"Gant\",\"Mcsween\"]',
        '[\"[\"Celinda\",\"Hrvatin\"]\",\"[\"Augusta\",\"Lipscomb\"]\"]',
        '[\"+80 599 364 846\",\"+66 330 737 244\"]',
        '[\"quintilla.reeder@live.com\",\"earle.prevost@yahoo.com\"]',
        '{\"+65 150 459 443\":\"Laws Club\",\"+38 187 981 332\":\"Keith Solutions\"}',
        '2001-02-03',
        '{\"[\"\",\"\"]\":\"2011-01-01\",\"[\"Sanjay\",\"Hollingshead\"]\":\"2013-01-26\"}',
        '[\"2011-01-01\",\"2000-12-18\"]',
        '[\"2010-11-05\",\"2010-12-24\"]',
        '{\"2010-12-24\":\"[\"[\"Tani\",\"Koerner\"]\",\"[\"Tadayuki\",\"Didioduggan\"]\"]\",\"2010-11-05\":\"[\"[\"\",\"\"]\",\"[\"\",\"\"]\"]\"}',
        'Glance pleases the object of this myth, knowing it an unsteadiness in to cling him. High arch in vain and wise one. The animals clouds rainbows rocks the height of sloth, touched his words came running in front of thought.',
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
        'Naidep',
        '[\"Giacinta\",\"Blakkolb\"]',
        '[\"[\"Pierrehenri\",\"Walpole\"]\",\"[\"Lowry\",\"Trunley\"]\"]',
        '[\"+86 121 935 664\",\"+67 959 635 332\"]',
        '[\"freddie.albery@gmail.com\",\"brietta.alzofon@yahoo.com\"]',
        '{\"+74 105 468 406\":\"Mendez Fashion\",\"+10 432 762 250\":\"Deslauriers Direct\"}',
        '2013-01-26',
        '{\"[\"Joke\",\"Zenkevicius\"]\":\"2010-11-05\",\"[\"Herta\",\"Eaton\"]\":\"2010-11-05\"}',
        '[\"2010-12-24\",\"2010-11-05\"]',
        '[\"2010-11-05\",\"2013-01-26\"]',
        '{\"2010-11-26\":\"[\"[\"Linette\",\"Mcisaac\"]\",\"[\"Fariborz\",\"Vidmer\"]\"]\",\"2000-12-18\":\"[\"[\"Olympia\",\"Linn\"]\",\"[\"Zorana\",\"Starr\"]\"]\"}',
        'Occasionally that teachings be played with white upper garments, against an error that very old banana-eaters to listen. Meditation there when buying receiving his respect from you.',
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
        'Entabed',
        '[\"Petronia\",\"Mok\"]',
        '[\"[\"Rick\",\"Stonos\"]\",\"[\"Roseanna\",\"Mansourati\"]\"]',
        '[\"+24 106 479 982\",\"+59 682 330 488\"]',
        '[\"fotini.eveleigh@mail.com\",\"catja.kurdas@live.com\"]',
        '{\"+29 350 807 423\":\"Spurlock Club\",\"+61 431 499 308\":\"Tully Central\"}',
        '2001-02-03',
        '{\"[\"Tin\",\"De\"]\":\"2001-02-03\",\"[\"Gant\",\"Mcsween\"]\":\"2010-11-26\"}',
        '[\"2013-01-26\",\"2001-02-03\"]',
        '[\"2013-01-26\",\"2013-04-08\",\"2001-02-03\"]',
        '{\"2010-11-26\":\"[\"[\"\",\"\"]\",\"[\"\",\"\"]\"]\",\"2010-11-05\":\"[\"[\"Mariesara\",\"Zielinski\"]\",\"[\"Denver\",\"Rothamel\"]\"]\"}',
        'Childlike or mask of sweetness from an, went and possessions renounced all teachings but destitute. Good man became the scroll which so clearly. Was set for fifteen days he the heron\'s death.',
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
        'Aliwal',
        '[\"Joke\",\"Zenkevicius\"]',
        '[\"[\"Olympia\",\"Linn\"]\",\"[\"Zorana\",\"Starr\"]\"]',
        '[\"+20 629 216 881\",\"+87 522 514 440\"]',
        '[\"josef.jeanes@yahoo.com\",\"glendon.colagrosso@hotmail.com\"]',
        '{\"+48 170 898 484\":\"Richmond Cooperative\",\"+86 484 100 832\":\"Wells Logic\"}',
        '2011-01-01',
        '{\"[\"Giacinta\",\"Blakkolb\"]\":\"2011-01-01\",\"[\"Odelle\",\"Lotochinski\"]\":\"2013-04-08\"}',
        '[\"2011-01-01\",\"2010-11-05\"]',
        '[\"2001-02-03\"]',
        '{\"2001-02-03\":\"[\"[\"Linette\",\"Mcisaac\"]\",\"[\"Fariborz\",\"Vidmer\"]\"]\",\"2013-04-08\":\"[\"[\"Jack\",\"Harper\"]\",\"[\"Victoria\",\"Olsen\"]\"]\"}',
        'Do therefore good or animal and walked the voice, tears as you told you sir it already. Quietly as honey collected by something of rebirths, passed rose near to ear his spot of words, smart less wondrous teachings he observed her mistress\'s ear.',
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
        'Ethbrawlerti',
        '[\"Tin\",\"De\"]',
        '[\"[\"Mariesara\",\"Zielinski\"]\",\"[\"Denver\",\"Rothamel\"]\"]',
        '[\"+93 974 979 636\",\"+69 811 687 744\"]',
        '[\"loella.pham@outlook.com\",\"marline.wark@hotmail.com\"]',
        '{\"+63 415 321 945\":\"Odden Cooperative\",\"+20 985 660 385\":\"Shier Media\"}',
        '2000-12-18',
        '{\"[\"Herta\",\"Eaton\"]\":\"2010-11-05\",\"[\"\",\"\"]\":\"2010-11-26\"}',
        '[\"2001-02-03\",\"2010-12-24\"]',
        '[\"2002-09-22\"]',
        '{\"2015-09-04\":\"[\"[\"Linette\",\"Mcisaac\"]\",\"[\"Fariborz\",\"Vidmer\"]\"]\",\"2001-02-03\":\"[\"[\"Celinda\",\"Hrvatin\"]\",\"[\"Augusta\",\"Lipscomb\"]\"]\"}',
        'Sat for they not brought news of despair. Children and elegant is soul sent for you, stone by begging with passion something about you, face tiredness has succeeded in one should the stakes.',
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
        'Elimmaka',
        '[\"Herta\",\"Eaton\"]',
        '[\"[\"Vrouwerff\",\"Early\"]\",\"[\"Jodee\",\"Bolly\"]\"]',
        '[\"+92 667 991 853\",\"+87 373 789 997\"]',
        '[\"sasha.inamullah@outlook.com\",\"shankar.wootton@live.com\"]',
        '{\"+79 367 509 529\":\"Hembrick Fx\",\"+37 131 600 758\":\"Stepp Church\"}',
        '2010-11-05',
        '{\"[\"Odelle\",\"Lotochinski\"]\":\"2010-12-24\",\"[\"Gant\",\"Mcsween\"]\":\"2015-09-04\"}',
        '[\"2015-09-04\",\"2001-02-03\",\"\"]',
        '[\"2013-04-08\",\"2013-04-08\"]',
        '{\"2002-09-22\":\"[\"[\"Rick\",\"Stonos\"]\",\"[\"Roseanna\",\"Mansourati\"]\"]\",\"2010-12-24\":\"[\"[\"Pierrehenri\",\"Walpole\"]\",\"[\"Lowry\",\"Trunley\"]\"]\"}',
        'Among people lead in speaking I think, hours of among hundreds of asceticism with enticed me, they\'ve become destitute and still lacks completeness roundness oneness. Pleasure all I already held him a penitent.',
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
        'Sinundefau',
        '[\"Sanjay\",\"Hollingshead\"]',
        '[\"[\"Tani\",\"Koerner\"]\",\"[\"Tadayuki\",\"Didioduggan\"]\"]',
        '[\"+76 720 118 644\",\"+58 160 436 307\"]',
        '[\"bryant.muller@yahoo.com\",\"geraldine.kaczynski@gmail.com\"]',
        '{\"+30 385 184 200\":\"Del Vision\",\"+68 155 788 845\":\"Schnurmann College\"}',
        '2010-12-24',
        '{\"[\"Sanjay\",\"Hollingshead\"]\":\"2010-11-26\",\"[\"Odelle\",\"Lotochinski\"]\":\"2015-09-04\"}',
        '[\"2010-11-26\",\"2002-09-22\"]',
        '[\"2010-12-24\",\"2001-02-03\",\"2010-11-26\"]',
        '{\"2002-09-22\":\"[\"[\"Rick\",\"Stonos\"]\",\"[\"Roseanna\",\"Mansourati\"]\"]\",\"2015-09-04\":\"[\"[\"Tani\",\"Koerner\"]\",\"[\"Tadayuki\",\"Didioduggan\"]\"]\"}',
        'Close to nurse discontent in it off in the. I\'ve already and disdainfully back and wrestled with doubt. Lost jewelry lost jewelry lost them the butterfly, didn\'t you in loops perhaps to earthly things. Silently went to finer food without money.',
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
        'evD0neJSXZ991T6lIy-QbA',
        '3f4112e1-ee24-442e-775a-a83e82a6e3f6',
        'Tanio',
        435,
        'Thinking he falls asleep when listening saw how rejecting, warrior gives merchandise and setting over which was, lust covetousness sloth of one have observed him.'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        '4X6Kgbl2XH3InkPUUDSX2Q',
        'c59a56ec-5f1e-48e7-c764-a5d12ac4ad07',
        'Schemena',
        193,
        'Conducted him just listening attentively to them, never he still quiet bubbles of despair I\'ve found. Rich man\'s garments under a greedy song, whispered to develop previous thoughts not lose him.'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        'seH21RlLGYH_HvvcST_T6A',
        '4438a6fa-93dc-414d-8f11-00fc6965e676',
        'Milne',
        476,
        'Eyes smile to despise it laughs at all, stared into his chamber he told to avoid evil. You in fear someone might my pilgrimage, rest now you\'ve last struggle of meditation. Secretly he died on his transformation listened in love.'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        'KxqWLPegp3Y8igo6jXZrzw',
        '8c5cb9fc-767d-40e8-66d9-9b940ae60e03',
        'Glaser',
        393,
        'At odds with ropes of is necessary, read a you never been saying something cooked rice, carefully prepared food of meditation had heard everything. Body of wise man has walked one wants.'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        'T1wuGJn39IUxN62IIuLHSw',
        '9433fd9b-a87c-47e0-8e71-ae13a30b341f',
        'Aronson',
        511,
        'Continued fleeing into which helps you seen his father. Owned a traveller after it spoke what and obedience, that \'soft is called out for thinking he laughed. Blossomed slowly drop by love having become a smile, though you\'ve always move from suffering began.'
    );

replace into `TEST`.`VALUE`
    (
        `Tuid`, `Uuid`, `Name`, `Integer`, `Text`
    )
    values
    (
        'v61nMW4apnJwbKKHsmosmA',
        'bc947c78-8e6f-4bc0-286e-e77edf19363f',
        'Gratton',
        422,
        'Softly perhaps mocking himself while bowing for fifteen days, times of children have stayed motionless man like bees. Than a penitent stood who seek knowledge has taken. Heard there forest his gaze opened his error.'
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
        'a76c0089-b8e4-43a3-6bf7-c4c2fe37476c',
        'iwTV43ddKY54RV78XKQE1Q',
        '8b04d5e3-775d-298e-7845-5efc5ca404d5'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        '2fc2eb6c-8de4-49d0-e2c7-54512bf1067a',
        'qfDmGhN9hqqdtTRl4IAWEg',
        'a9f0e61a-137d-86aa-9db5-3465e0801612'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        '399a1fec-410f-449b-a74e-a511a62ca04e',
        '3VyL9RVY_8vlAHBxkI6VJA',
        'dd5c8bf5-1558-ffcb-e500-7071908e9524'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        '95f54390-0bae-429d-3877-8b295fa31dde',
        'CIOmUg5utskwTc-3EDTQUw',
        '0883a652-0e6e-b6c9-304d-cfb71034d053'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        '16f896fc-7210-4ae5-9b0b-7c8c645b9093',
        'T1wuGJn39IUxN62IIuLHSw',
        'c59a56ec-5f1e-48e7-c764-a5d12ac4ad07'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        'a68267c5-3ad0-4fb5-65bb-ab72bfd3c7a8',
        'v61nMW4apnJwbKKHsmosmA',
        '4438a6fa-93dc-414d-8f11-00fc6965e676'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        '1a81dd31-dfd7-4262-60ea-e3ea30c97487',
        'T1wuGJn39IUxN62IIuLHSw',
        'a9f0e61a-137d-86aa-9db5-3465e0801612'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        '43e91f3c-2277-4749-9124-e8f675cd67e3',
        'iwTV43ddKY54RV78XKQE1Q',
        '8c5cb9fc-767d-40e8-66d9-9b940ae60e03'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        '1e28f57f-6b79-4371-67b7-8d4ca44ab245',
        'iwTV43ddKY54RV78XKQE1Q',
        'a9f0e61a-137d-86aa-9db5-3465e0801612'
    );

replace into `TEST`.`VALUE_DATA`
    (
        `Uuid`, `ValueTuid`, `ValueUuid`
    )
    values
    (
        '7ba13fc1-2141-4eae-aecb-0added440cfe',
        'iwTV43ddKY54RV78XKQE1Q',
        'c0759f24-1649-8708-841e-7975566360ce'
    );

set sql_mode=@old_sql_mode;
set foreign_key_checks=@old_foreign_key_checks;
set unique_checks=@old_unique_checks;
