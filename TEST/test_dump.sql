CREATE TABLE `COMPOUND` (
  `Id` INT NOT NULL AUTO_INCREMENT, 
  `Location` TEXT NULL, 
  `Name` TEXT NULL, 
  `NameSet` TEXT NULL, 
  `PhoneList` TEXT NULL, 
  `EmailSet` TEXT NULL, 
  `CompanyMap` TEXT NULL, 
  `SimpleDate` DATE NULL, 
  `SimpleDateMap` TEXT NULL, 
  `SimpleDateSet` TEXT NULL, 
  `SimpleDateList` TEXT NULL, 
  `NameSetMap` TEXT NULL, 
  `Text` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `COMPOUND` (`Id`, `Location`, `Name`, `NameSet`, `PhoneList`, `EmailSet`, `CompanyMap`, `SimpleDate`, `SimpleDateMap`, `SimpleDateSet`, `SimpleDateList`, `NameSetMap`, `Text`) VALUES
(1, 'Belgium', '[\'Malcolm\',\'Beech\']', '[\'[\'Jack\',\'Harper\']\',\'[\'Victoria\',\'Olsen\']\']', '[\'12345678\',\'23456789\']', '[\'jack.harper@gmail.com\',\'victoria.olsen@outlook.com\']', '{\'12345678\':\'Warner Bros\',\'23456789\':\'Universal Pictures\'}', '2009-03-07', '{\'[\'Malcolm\',\'Beech\']\':\'2014-07-05\',\'[\'Brynna\',\'Kara\']\':\'2003-03-02\'}', '[\'2003-03-02\',\'2014-07-05\']', '[\'2003-03-02\']', '{\'2006-12-02\':\'[\'[\'Kiele\',\'Harley\']\',\'[\'Janette\',\'Hisko\']\']\',\'2012-06-24\':\'[\'[\'\',\'\']\',\'[\'\',\'\']\']\'}', '{}'),
(2, '', '[\'\',\'\']', '[\'[\'\',\'\']\',\'[\'\',\'\']\']', '[\'\',\'\']', '[\'rick.deckard@gmail.com\',\'dave.holden@outlook.com\']', '{\'12345678\':\'\',\'23456789\':\'\'}', '2011-01-11', '{\'[\'Brynna\',\'Kara\']\':\'2014-07-05\',\'[\'Maudie\',\'Waloff\']\':\'2001-11-27\'}', '[\'2011-04-10\',\'2011-01-11\']', '[\'2006-12-02\']', '{\'2012-06-24\':\'[\'[\'Fannie\',\'Hollran\']\',\'[\'Adriana\',\'Selchow\']\']\',\'2012-03-17\':\'[\'[\'Fannie\',\'Hollran\']\',\'[\'Adriana\',\'Selchow\']\']\'}', ''),
(3, 'Dagompid', '[\'Brynna\',\'Kara\']', '[\'[\'Shuang\',\'Lamarque\']\',\'[\'Carolien\',\'Iantaffi\']\']', '[\'+84 783 235 575\',\'+39 789 124 583\']', '[\'pandora.burns@mail.com\',\'shigeru.patoka@outlook.com\']', '{\'+81 504 935 483\':\'Shastry Labs\',\'+21 312 770 774\':\'Basser Association\'}', '2001-11-27', '{\'[\'Maudie\',\'Waloff\']\':\'2003-03-02\',\'[\'Brynna\',\'Kara\']\':\'2001-11-27\'}', '[\'2003-03-02\',\'2009-03-07\']', '[\'2012-03-17\']', '{\'2011-04-10\':\'[\'[\'Jack\',\'Harper\']\',\'[\'Victoria\',\'Olsen\']\']\',\'2001-02-03\':\'[\'[\'Zia\',\'Devgon\']\',\'[\'Goldina\',\'Weckwerth\']\']\'}', 'Else was again breathed was in thought, often with hunger gave copper-coins to beg. Mumbled a constantly covered by love nobody, you\'ve got it any sleep in return.'),
(4, 'Aridipi', '[\'Maudie\',\'Waloff\']', '[\'[\'Giovanni\',\'Allgood\']\',\'[\'Laney\',\'Dyna\']\']', '[\'+52 734 702 660\',\'+95 764 814 168\']', '[\'akin.costello@yahoo.com\',\'rosie.slavin@outlook.com\']', '{\'+19 790 772 237\':\'Glidewell Services\',\'+13 916 419 111\':\'Krenos Dynamics\'}', '2011-01-11', '{\'[\'Wendi\',\'Pepe\']\':\'2003-03-02\',\'[\'Jaman\',\'Gewell\']\':\'2012-06-24\'}', '[\'2011-01-11\',\'2006-12-02\']', '[\'2009-03-07\',\'2006-12-02\',\'2001-02-03\']', '{\'2001-02-03\':\'[\'[\'Zia\',\'Devgon\']\',\'[\'Goldina\',\'Weckwerth\']\']\',\'2006-12-02\':\'[\'[\'Odile\',\'Bradyhouse\']\',\'[\'Jolie\',\'Willmott\']\']\'}', 'Gave the ferry-boat for two of sounded strange, where their fields nobody will keep you kidding. Hours looked around through water without seeing old eyes. A childlike thus alone with anger to the.'),
(5, 'Latrinabop', '[\'Saraann\',\'Geer\']', '[\'[\'Kiele\',\'Harley\']\',\'[\'Janette\',\'Hisko\']\']', '[\'+82 552 392 314\',\'+95 950 234 577\']', '[\'gertie.arnon@gmail.com\',\'annabella.hamlin@hotmail.com\']', '{\'+53 364 720 404\':\'Stratton Cooperative\',\'+66 894 296 967\':\'Besnier Store\'}', '2006-12-02', '{\'[\'Brynna\',\'Kara\']\':\'2011-01-11\',\'[\'Saraann\',\'Geer\']\':\'2003-03-02\'}', '[\'2003-03-02\',\'2001-02-03\']', '[\'2009-03-07\',\'2012-06-24\',\'2009-03-07\']', '{\'2003-03-02\':\'[\'[\'Shuang\',\'Lamarque\']\',\'[\'Carolien\',\'Iantaffi\']\']\',\'2011-01-11\':\'[\'[\'Odile\',\'Bradyhouse\']\',\'[\'Jolie\',\'Willmott\']\']\'}', 'Anxiety in thought we refer to forget him. Apparently he realised that your people own, wavered to wake up gave her where an end.'),
(6, 'Alexiax', '[\'Wendi\',\'Pepe\']', '[\'[\'Fannie\',\'Hollran\']\',\'[\'Adriana\',\'Selchow\']\']', '[\'+75 396 460 190\',\'+54 360 191 130\']', '[\'verine.sykes@live.com\',\'dalip.cocco@live.com\']', '{\'+82 316 532 268\':\'Scott Tech\',\'+74 223 275 293\':\'Defranchi Cooperative\'}', '2001-11-27', '{\'[\'Chelsy\',\'Mcduffie\']\':\'2014-07-05\',\'[\'\',\'\']\':\'2001-11-27\'}', '[\'2014-07-05\',\'2001-02-03\']', '[\'2001-02-03\']', '{\'2001-02-03\':\'[\'[\'Zia\',\'Devgon\']\',\'[\'Goldina\',\'Weckwerth\']\']\',\'2003-03-02\':\'[\'[\'Giovanni\',\'Allgood\']\',\'[\'Laney\',\'Dyna\']\']\'}', 'Herself had attended his dormant spirit suddenly he has, talking turned out business-affairs they did many times. Fine shoes such shoes in on every creature, occasionally dreaming at which set in new man. A green the raft upriver listened silently begging ones.'),
(7, 'Nestesagito', '[\'Olive\',\'Parisi\']', '[\'[\'Pritchard\',\'Adamyk\']\',\'[\'Brinna\',\'Bubel\']\']', '[\'+34 248 957 764\',\'+78 859 770 714\']', '[\'charita.lum@gmail.com\',\'shayla.bradley@hotmail.com\']', '{\'+95 452 883 245\':\'Reeder Association\',\'+98 224 942 915\':\'Kolesnik Union\'}', '2011-04-10', '{\'[\'Chelsy\',\'Mcduffie\']\':\'2009-03-07\',\'[\'Brynna\',\'Kara\']\':\'2009-03-07\'}', '[\'2001-02-03\',\'2006-12-02\']', '[\'2001-02-03\']', '{\'2014-07-05\':\'[\'[\'Wynn\',\'Duthie\']\',\'[\'Leo\',\'Badmington\']\']\',\'2006-12-02\':\'[\'[\'Kiele\',\'Harley\']\',\'[\'Janette\',\'Hisko\']\']\'}', 'One with its goal stood who seeks unity, close attention with grief boiled over happiness felt it. After under a feared gambler few with equanimity.'),
(8, 'Yazdanih', '[\'Loretta\',\'Ives\']', '[\'[\'Zia\',\'Devgon\']\',\'[\'Goldina\',\'Weckwerth\']\']', '[\'+91 781 257 405\',\'+44 393 557 564\']', '[\'odessa.geary@yahoo.com\',\'bse.przybycien@gmail.com\']', '{\'+59 738 179 827\':\'Bowser Fx\',\'+39 460 251 244\':\'Hartling Institute\'}', '2014-07-05', '{\'[\'Brynna\',\'Kara\']\':\'2003-03-02\',\'[\'Loretta\',\'Ives\']\':\'2011-04-10\'}', '[\'2011-01-11\',\'2006-12-02\',\'\']', '[\'2009-03-07\']', '{\'2003-03-02\':\'[\'[\'\',\'\']\',\'[\'\',\'\']\']\',\'2011-04-10\':\'[\'[\'Giovanni\',\'Allgood\']\',\'[\'Laney\',\'Dyna\']\']\'}', 'Any kind his bowl of changed as his stakes, an oar with themselves and awoke to weep. Finding it than a hint of boars of thousands.'),
(9, 'Veronika', '[\'Chelsy\',\'Mcduffie\']', '[\'[\'Wynn\',\'Duthie\']\',\'[\'Leo\',\'Badmington\']\']', '[\'+84 838 150 626\',\'+10 961 747 638\']', '[\'freek.gateau@outlook.com\',\'nelda.kirkland@yahoo.com\']', '{\'+66 222 119 241\':\'Roscoe News\',\'+53 515 232 238\':\'Girvan Cooperative\'}', '2011-01-11', '{\'[\'Saraann\',\'Geer\']\':\'2001-11-27\',\'[\'Jaman\',\'Gewell\']\':\'2001-02-03\'}', '[\'2003-03-02\',\'2012-03-17\']', '[\'2011-04-10\']', '{\'2012-06-24\':\'[\'[\'Giovanni\',\'Allgood\']\',\'[\'Laney\',\'Dyna\']\']\',\'2014-07-05\':\'[\'[\'\',\'\']\',\'[\'\',\'\']\']\'}', 'Or might you I looked like only as well, since he thinks he learned and my reward. Interrupted him close to wake you see him, us and I\'m going on by one\'s breath.'),
(10, 'Diaman', '[\'Jaman\',\'Gewell\']', '[\'[\'Odile\',\'Bradyhouse\']\',\'[\'Jolie\',\'Willmott\']\']', '[\'+42 891 916 378\',\'+86 317 683 660\']', '[\'edita.standrin@hotmail.com\',\'dutch.freeth@gmail.com\']', '{\'+27 757 136 394\':\'Egerman Store\',\'+33 390 703 860\':\'Hodges Club\'}', '2001-11-27', '{\'[\'Olive\',\'Parisi\']\':\'2011-04-10\',\'[\'Chelsy\',\'Mcduffie\']\':\'2009-03-07\'}', '[\'2001-02-03\',\'2003-03-02\',\'\']', '[\'2012-03-17\',\'2003-03-02\']', '{\'2003-03-02\':\'[\'[\'Pritchard\',\'Adamyk\']\',\'[\'Brinna\',\'Bubel\']\']\',\'2011-04-10\':\'[\'[\'Kiele\',\'Harley\']\',\'[\'Janette\',\'Hisko\']\']\'}', 'To strive downwards to utter a detour from death. Both the penitents how shall I told you mean, apparently he stared into eyes were made gifts for, sacrifices give an obedient worshipper of mere words.');

CREATE TABLE `SIMPLE` (
  `Uuid` VARCHAR(36) NOT NULL, 
  `Bool` TINYINT UNSIGNED NULL, 
  `Int8` TINYINT NULL, 
  `Uint8` TINYINT UNSIGNED NULL, 
  `Int16` SMALLINT NULL, 
  `Uint16` SMALLINT UNSIGNED NULL, 
  `Int32` INT NULL, 
  `Uint32` INT UNSIGNED NULL, 
  `Int64` BIGINT NULL, 
  `Uint64` BIGINT UNSIGNED NULL, 
  `Float32` FLOAT NULL, 
  `Float64` DOUBLE NULL, 
  `String` TEXT NULL, 
  `Name` TEXT NULL, 
  `Date` DATE NULL, 
  `DateTime` DATETIME NULL, 
  `Blob` BLOB NULL, 
  `Option` TEXT NULL, 
  `EnglishText` TEXT NULL, 
  `SpanishText` TEXT NULL, 
  `FrenchText` TEXT NULL, 
  `LatinText` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SIMPLE` (`Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`, `Option`, `EnglishText`, `SpanishText`, `FrenchText`, `LatinText`) VALUES
('8dbdda48-fb87-48d6-746f-1965824e966a', 0, 1, 2, 3, 4, 5, 6, 7, 8, 1.1, 2.2, 'Hello world!', 'Graziano', '2001-02-03', '2001-02-03 04:05:06.789', '123456781234567891234567812345678', 'second_Graziano', 'It could you yesterday wear many secrets of humans. Deaf and knowledge shining when a burden, past touched the night\'s last sweet scent of enlightenment.', 'Notables y casa marítima victoria. Dejarla la patria con triste muere acompañado.', 'Est-ce que l\'âme noble corps, l\'élixir de trêve de trois pattes de brouillards légers. Humble martyr qui dort c\'est honteux que faites-vous de crime, marchaient dans rome ton chemin mauvais.', 'Diei ut sese initium superioribus negoti reliquos inciperent atque, deditione quam convictam principes appellant videretur priusque se galliam.'),
('41aacd76-20f8-4c8e-219d-44f26220c0ba', 1, 65, 28, 165, 866, 819, 624, 696, 935, 38.73, 17.44, 'Entagsduc', 'Andress', '2011-04-10', '2007-11-25 14:24:10', '84ea1d58233dd6c476b4', 'fourth_2007-11-25 14:24:10', 'Language would force him went outside. Sun tanned his spirit was heard him why these words.', 'Alegres van sufriendo mil deleites que tomada. Alterados del tiempo lo poco reposando. Inclinó su tiempo alegre lleve.', 'Profilant la religion est profonde, epanche tout l\'être en faute noire encore qu\'un œil fâché, siciliennes ni laid comme avant d\'entrer dans l\'ombre. D\'être en plumes des pardons mêlés de lierre.', 'Pro bellum imperatum se cum gallis marcellum. Demonstravimus romanos ne qua quae magistratus quem pars armataeque, legionum transfert ad demigrarent defecerat fuga iudicabant non.'),
('154b53ff-328e-49b5-6f5d-9d6b5f84fc22', 1, 26, 52, 454, 348, 497, 950, 70, 777, 12.39, 19.57, 'Artojubau', 'Graman', '2012-03-17', '2005-09-28 03:19:58', '164fb015f131e759212e', 'second_Graman', 'If it slowly it filled him satisfy me leave, both being he observed the daemons. Farewell river after another each of suicide in love, mouth but suffering time almost none.', 'Playa y amor mató ni terneza, dolencias flechas y grato pecho falto. Querría si resiste contra nuestros días.', 'Torrent de trente ans le pommeau. Voeu dernier sac d\'écus dans l\'interminable.', 'His legatos victi ad locis satis ascensu castra et uteretur, quae quaeque quisquam tempus potestatis reciperent sustinere. Terreri demonstratum interim corona vix, et dignitatem ambiorige annuus nostram quo lisco germanorum.'),
('e299f73b-9e39-44be-e558-c3e8271901de', 1, 48, 88, 45, 399, 320, 151, 548, 548, 80.21, 86.45, 'Udekupau', 'Devine', '2011-01-11', '2000-01-18 02:40:41', '6355b0783a3ebdb7d2dd', 'second_Devine', 'That evil words exclaimed lamentingly, enchantment which set him like this resolution to serve. Stood before I would be, nodded in fine oil in drifted through life.', 'Jactante mentirosa verdadera y dos hombres verá cuajado, vive y damas no dobladas. Volviendo el escondido por agosto, presas gana en agua represada.', 'Favori la charmille en parler, d\'où jaillit toute mignonne tout rempli de troie.', 'Superatis eis opes cogerent libertate transiret copiasque ser, nuntiet his etiam erat conscripsit per attingunt. Considunt desperare castris nostri totius neque quo, milites cognito sunt agendos flumen latere iudicione ad.'),
('26ddbd71-0af0-4c89-030b-89a1211cbc77', 1, 62, 88, 58, 860, 985, 49, 826, 623, 76.42, 85, 'Amnansowatid', 'Beckman', '2003-03-02', '2007-10-13 18:36:24', '50163cf3af44402a54de', 'third_2003-03-02', 'No attributes which lay on bed, half all there it that every naughtiness with high trees.', 'La verdura hacen conocer de duro golpe tan populosa. Mirad que puedas poner fin y vea, recogió tan poquitos portugueses de mombaza luego acusa, conocida por salvar su remedio llama se entregaba.', 'Miss aérogyne femme ici se rappelaient en feu. Pénétrons bien nue et fauve.', 'Et paulo fiunt quod obsidibusque magnas proficiscendum, magistratibus tali caesaris minoribus pugnare spatio et barbaris. Rhenum continuis esset britanni in, anni dispositis introduxissent imperata ei a in obsides influeret.'),
('48dffab6-609a-4dc0-4bf7-d5ee268c806a', 1, 43, 75, 84, 537, 561, 311, 100, 853, 22.82, 79.12, 'Jessilavy', 'Weldon', '2014-07-05', '2004-11-14 20:12:25', 'cf38cda9dbf2303b37b4', 'third_2014-07-05', 'Curious people as people a bath of apes moving water. Travelled for how he alone I said nothing, and whatever he brought to tell me about.', 'Corto mas ves para donde descubrirá y menino, nereo llamó las fábulas soñadas fabulosas. Hermanas madres dos huyendo el nido, tierra usada a judea que están representando.', 'D\'oublier l\'heure des cris d\'hirondelles, brûle et l\'herbette avec esprit surtout et maigre.', 'Ex adversarii tormentis frumenti naves, romani italiam mundi equitatus qui itium venisset.'),
('9bb0e0c3-9ef0-4bdb-e1cc-ce34050edefe', 0, 45, 63, 267, 562, 108, 582, 261, 469, 32.45, 73.8, 'Ardiukwoq', 'Parham', '2001-11-27', '2015-04-03 02:50:39', 'f3fd599872a504b98546', 'fourth_2015-04-03 02:50:39', 'Until nothing there collapsed and sea-shells screamed in secrets, I\'m asking you follow that. Fully become also take his bare shins. You\'re suffering for three years.', 'Después en peña dura haya tomado, historias que mal desea el coro. Errores en malabar tendrá menos rutilante, vense las guarda ten cuidado rey propio marte.', 'Nous ignore et compagne lointaine. Oublié voisine de cinq gars attentifs de les aventures, endormez-vous au crime horreur menant leur parole forte. Contemplons ce berceau s\'adossait à trompe.', 'Subito in facit sequani pars instituta nostri magnus. Rebus alpes nihil multitudinis petere cum.'),
('10cd372d-c08e-4bcb-0640-883c041bc475', 0, 27, 3, 174, 149, 542, 793, 93, 148, 82.1, 31.61, 'Iltinko', 'Hardman', '2006-12-02', '2004-08-28 12:55:49', '1dd19ab97e13bbd85733', 'fourth_2004-08-28 12:55:49', 'Reached the nodded his eternal not-finding, proper it cannot love practised meditation through so much more, putting himself closely in town ascetics on it. Is and lived hidden so much.', 'Obscureciendo va también voces dimos. Penetra las rompas y ancorado, disimula con qué fué allí solo entero. Nosotros como sobre aquesta entrada el destino.', 'Note retour du léthé de l\'immortalité. Aurais-je sans nuages de lune blanche vous loue, epieraient pour demeurer ici grognards sont des propos fades nouveau-nés. Paris ta caresse le piédestal.', 'Exercitus amicitia se proxima fuit finibus vestigiis, venire coactos intervallum qui auxilium pugnae viderent ita.'),
('b1a10ce8-85ed-4fee-a64d-ff3f042267f2', 1, 94, 87, 239, 143, 164, 392, 58, 474, 36.37, 59.91, 'Karnamcginag', 'Colontonio', '2012-06-24', '2004-02-01 08:19:11', '457df3b929704829de38', 'second_Colontonio', 'Walked at about the poison, a searching for by bees. Told how she found joy for its secret of.', 'Mallas finas y grato pecho airado mar y torneos, orar por amar de ellas ser mostraba. Otros tales andan y mal empleado.', 'Femme cependant tout un arome, (ses yeux aux parfums au patois.', 'Commeatibus cum prudentiae treveris agmine paulatim, maleficio missurum et una in maximaque multis civitates.'),
('296f18f1-243c-4441-1ffd-b27b2ea41827', 0, 26, 85, 206, 573, 104, 381, 114, 879, 97.84, 55.26, 'Hofoenegabif', 'Mallory', '2009-03-07', '2010-07-08 08:54:47', '3021264e236df1b5158f', 'fourth_2010-07-08 08:54:47', 'Himself and peel off my goal stood in their secret, enjoyed his confession of life. An advice he told that perfected one.', 'Playa desnuda y blancas velas rabia y pues habéis andado, mira elvas quien está atando. Puede mover la lluvia nunca usados.', 'Passaient devant quatre à mêler leur joie au vallon, un caveau pluvieux et tels. Donnent un lis à n\'aimer en volutes.', 'Vicinitatibus carnutes transiret videret silvas, ubi ducenos ex honore causa hoc quibus illud, bellum omnibus legatos fortissimo etsi familiaribus. Ex romani ut exercuerant fecerunt fieri aditus eum helvetii rem.');

CREATE TABLE `VALUE` (
  `Id` BIGINT NOT NULL, 
  `Uuid` VARCHAR(36) NULL, 
  `Name` TEXT NULL, 
  `Integer` INT NULL, 
  `Text` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `VALUE` (`Id`, `Uuid`, `Name`, `Integer`, `Text`) VALUES
(3344523601393165508, '8b04d5e3-775d-298e-7845-5efc5ca404d5', 'first', 1, ' This is the first text, with spaces '),
(-6907789044519798771, 'a9f0e61a-137d-86aa-9db5-3465e0801612', 'second', 2, 'This is the second text, with escaped characters ^~{}'),
(-5292141111288023615, 'dd5c8bf5-1558-ffcb-e500-7071908e9524', 'third', 3, 'This is the third text§with a new line'),
(-7654305769731274948, 'c0759f24-1649-8708-841e-7975566360ce', 'fourth', 4, 'This is the fourth text§also with a new line'),
(7366903994430713728, '5aea2604-0fae-47fd-b28d-d48251a875eb', 'Mcintee', 464, 'Them too loud when I\'ll see is of questions, travellers felt fear so said nothing stung any given. Sinner is one to than could be sad.'),
(1412966688938415611, '65874eb7-c23b-4dc7-f3f4-a778ec773baa', 'Synness', 737, 'Scent of sun again submerged his father, me with care about you force him. Boy a sigh he belong to you, salvation as it ran up I listen well.'),
(7190577260125528369, '7dff269c-5958-43b9-289c-d903b17b6769', 'Puglia', 212, 'Bid him go on chance not answer every creature, as alien something miraculous happened more bring his mourning. Occasionally that hatred against hunger and taught.'),
(4327182016113957009, '28103e6d-cc98-4f75-2c73-b8d8952a9476', 'Azari', 445, 'Other people with women these were quiet. Somehow happened today I\'m old word give and curious, since his people like it her pale cheeks. Shall be superior to confess to satisfy him. Want me they found himself in love.'),
(7552378648800740518, 'a821c082-fcd5-4331-5861-6545ff8a57d4', 'Remson', 4, 'Day and offerings and get that supple hand, speaking she found where grew up felt a student. Merchant passed between him committed all I said, non-eternal things the stakes and through life. On all times always watched him safe.'),
(3440915992387011684, '404ab6c9-601a-4706-b22a-40aebf408ff5', 'Hinz', 942, 'May see you came without an unwhithering calm days. Venerable among travellers seeing images appeared on his error, bowed with them as true essence lay down.');

CREATE TABLE `VALUE_DATA` (
  `Uuid` VARCHAR(36) NOT NULL, 
  `ValueId` BIGINT NULL, 
  `ValueUuid` VARCHAR(36) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `VALUE_DATA` (`Uuid`, `ValueId`, `ValueUuid`) VALUES
('24abb493-772d-458f-aa94-9034b464c27c', 3344523601393165508, '8b04d5e3-775d-298e-7845-5efc5ca404d5'),
('07c2f875-9815-4389-ed10-e56e3a71922d', -6907789044519798771, 'a9f0e61a-137d-86aa-9db5-3465e0801612'),
('fdfa1841-dc84-40e4-7d60-2a510bbef2ff', -5292141111288023615, 'dd5c8bf5-1558-ffcb-e500-7071908e9524'),
('9048c110-d3fb-47e5-47ba-cf18988e577d', -5359923222225123686, '0883a652-0e6e-b6c9-304d-cfb71034d053'),
('17378aef-f8dd-4343-0fad-4233ed9abe21', 4327182016113957009, 'dd5c8bf5-1558-ffcb-e500-7071908e9524'),
('81e07fc6-a512-451d-adfc-2d6a2bb08c4b', -7654305769731274948, '404ab6c9-601a-4706-b22a-40aebf408ff5'),
('fee9cf79-cbc8-4eab-d870-601268d3923c', 4327182016113957009, 'c0759f24-1649-8708-841e-7975566360ce'),
('0cc3488f-ddcb-441a-f280-0961141c720d', 4327182016113957009, 'c0759f24-1649-8708-841e-7975566360ce'),
('bfe76b2a-a455-4dda-dd15-82c3fa070e4a', 7552378648800740518, 'a821c082-fcd5-4331-5861-6545ff8a57d4'),
('0d0078c5-efb3-466b-4ac0-d93fba55e465', 7552378648800740518, 'a821c082-fcd5-4331-5861-6545ff8a57d4');

ALTER TABLE `COMPOUND`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `SIMPLE`
  ADD PRIMARY KEY (`Uuid`);

ALTER TABLE `VALUE`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `VALUE_DATA`
  ADD PRIMARY KEY (`Uuid`);
