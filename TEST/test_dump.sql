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
(1, 'Belgium', '[\'Malcolm\',\'Beech\']', '[\'[\'Jack\',\'Harper\']\',\'[\'Victoria\',\'Olsen\']\']', '[\'12345678\',\'23456789\']', '[\'jack.harper@gmail.com\',\'victoria.olsen@outlook.com\']', '{\'12345678\':\'Warner Bros\',\'23456789\':\'Universal Pictures\'}', '2001-02-03', '{\'[\'Ainsley\',\'Redshaw\']\':\'2001-09-06\',\'[\'Dre\',\'Tyndall\']\':\'2010-01-07\'}', '[\'2001-02-03\',\'2005-10-13\']', '[\'2009-06-13\']', '{\'2002-10-22\':\'[\'[\'Theressa\',\'Hutson\']\',\'[\'Muffin\',\'Iocca\']\']\',\'2008-06-03\':\'[\'[\'Brigid\',\'Conrath\']\',\'[\'Kimmi\',\'Sleeman\']\']\'}', '{}'),
(2, '', '[\'\',\'\']', '[\'[\'\',\'\']\',\'[\'\',\'\']\']', '[\'\',\'\']', '[\'rick.deckard@gmail.com\',\'dave.holden@outlook.com\']', '{\'12345678\':\'\',\'23456789\':\'\'}', '2002-10-22', '{\'[\'Jaman\',\'Mcdade\']\':\'2001-09-06\',\'[\'\',\'\']\':\'2008-06-03\'}', '[\'2000-08-20\',\'2015-04-20\']', '[\'2010-01-07\',\'2000-08-20\',\'2009-06-13\']', '{\'2010-03-15\':\'[\'[\'Naser\',\'Cordy\']\',\'[\'Nataline\',\'Konopka\']\']\',\'2001-02-03\':\'[\'[\'Cristen\',\'Clairmont\']\',\'[\'Chungwo\',\'Bellehumeur\']\']\'}', ''),
(3, 'Oregara', '[\'Kirtikumar\',\'Sepko\']', '[\'[\'Brynn\',\'Valvasori\']\',\'[\'Ayako\',\'Meese\']\']', '[\'+84 201 351 768\',\'+13 978 971 875\']', '[\'theresa.debuda@yahoo.com\',\'alice.riggs@yahoo.com\']', '{\'+86 449 745 988\':\'Gustlin Insurance\',\'+53 905 771 456\':\'Hixon Company\'}', '2000-08-20', '{\'[\'Zouheir\',\'Lanier\']\':\'2002-10-22\',\'[\'Jaman\',\'Mcdade\']\':\'2015-04-20\'}', '[\'2002-10-22\',\'2001-02-03\']', '[\'2008-06-03\']', '{\'2010-01-07\':\'[\'[\'Brigid\',\'Conrath\']\',\'[\'Kimmi\',\'Sleeman\']\']\',\'2015-04-20\':\'[\'[\'Krzysztof\',\'Torrens\']\',\'[\'Natver\',\'Haugrud\']\']\'}', 'Speak a sleep properly again and stupid, we\'ll continue learning all these ugly smart mouth. Too soft bed and fro and gaga. Placed two of something on beautiful of patience, world through a joke or discard them.'),
(4, 'Donimafu', '[\'Marlon\',\'Cifersky\']', '[\'[\'Naser\',\'Cordy\']\',\'[\'Nataline\',\'Konopka\']\']', '[\'+60 158 699 433\',\'+74 758 601 316\']', '[\'timi.moogk@live.com\',\'bhagvat.satterfield@yahoo.com\']', '{\'+63 314 636 715\':\'Chisolm Institute\',\'+70 463 454 174\':\'Nixon Corporation\'}', '2010-01-07', '{\'[\'Kirtikumar\',\'Sepko\']\':\'2001-09-06\',\'[\'Zouheir\',\'Lanier\']\':\'2000-08-20\'}', '[\'2002-10-22\',\'2001-02-03\']', '[\'2015-04-20\',\'2001-09-06\']', '{\'2001-02-03\':\'[\'[\'Naser\',\'Cordy\']\',\'[\'Nataline\',\'Konopka\']\']\',\'2015-04-20\':\'[\'[\'Jack\',\'Harper\']\',\'[\'Victoria\',\'Olsen\']\']\'}', 'Soon have done well you please the rose. Look upon him mute struggle of things can understand, too many kinds of myself any guard of offerings.'),
(5, 'Ottseu', '[\'Jaman\',\'Mcdade\']', '[\'[\'Cary\',\'Seetharaman\']\',\'[\'Lida\',\'Lewellen\']\']', '[\'+31 274 915 272\',\'+22 889 329 432\']', '[\'denny.loudiadis@outlook.com\',\'sapphira.gower@hotmail.com\']', '{\'+23 453 592 974\':\'Boyea Media\',\'+17 309 730 426\':\'Foessl Depot\'}', '2002-10-22', '{\'[\'\',\'\']\':\'2010-01-07\',\'[\'Kirtikumar\',\'Sepko\']\':\'2002-10-22\'}', '[\'2008-06-03\',\'2015-04-20\']', '[\'2005-10-13\',\'2000-08-20\']', '{\'2015-04-20\':\'[\'[\'Krzysztof\',\'Torrens\']\',\'[\'Natver\',\'Haugrud\']\']\',\'2000-08-20\':\'[\'[\'Cary\',\'Seetharaman\']\',\'[\'Lida\',\'Lewellen\']\']\'}', 'Pleasure with an unwavering openness and water said, nevertheless broken in again start on account of enlightenment. I would join the listeners like you. Didn\'t you words exclaimed lamentingly its palm-trees, out into thinking and realized this realization.'),
(6, 'Caresasmariq', '[\'Dre\',\'Tyndall\']', '[\'[\'Theressa\',\'Hutson\']\',\'[\'Muffin\',\'Iocca\']\']', '[\'+92 315 488 298\',\'+37 710 844 300\']', '[\'virginie.belohoubek@gmail.com\',\'alisha.hawkes@gmail.com\']', '{\'+65 575 404 604\':\'Stutts Depot\',\'+75 710 290 388\':\'Mah Tech\'}', '2010-03-15', '{\'[\'Ainsley\',\'Redshaw\']\':\'2005-10-13\',\'[\'Jaman\',\'Mcdade\']\':\'2001-02-03\'}', '[\'2001-09-06\',\'2015-04-20\']', '[\'2009-06-13\',\'2000-08-20\',\'2009-06-13\']', '{\'2010-01-07\':\'[\'[\'Cristen\',\'Clairmont\']\',\'[\'Chungwo\',\'Bellehumeur\']\']\',\'2000-08-20\':\'[\'[\'Jack\',\'Harper\']\',\'[\'Victoria\',\'Olsen\']\']\'}', 'Them envied them and blue of death here thought, for and worthless it tasted of rice-cake, eternal chain the sin very smart brown and pleasantly.'),
(7, 'Arloli', '[\'Arun\',\'Lett\']', '[\'[\'Digby\',\'Saboorian\']\',\'[\'Osmond\',\'Malkani\']\']', '[\'+22 172 317 658\',\'+73 792 625 589\']', '[\'mariam.talbert@gmail.com\',\'malik.westphal@hotmail.com\']', '{\'+63 363 830 663\':\'Groves Store\',\'+66 935 649 533\':\'Lotan University\'}', '2001-02-03', '{\'[\'Malcolm\',\'Beech\']\':\'2005-10-13\',\'[\'Ainsley\',\'Redshaw\']\':\'2005-10-13\'}', '[\'2010-01-07\',\'2010-03-15\']', '[\'2009-06-13\',\'2015-04-20\',\'2010-03-15\']', '{\'2001-09-06\':\'[\'[\'Brigid\',\'Conrath\']\',\'[\'Kimmi\',\'Sleeman\']\']\',\'2010-03-15\':\'[\'[\'Jack\',\'Harper\']\',\'[\'Victoria\',\'Olsen\']\']\'}', 'Pleasure cannot love for two old could accept, don\'t see whatever for wealth the brushwood for finding. Lust like my own search his ear, was quick to miracles can be spared him unmoved.'),
(8, 'Oxemariahut', '[\'Neetu\',\'Niedzwiecki\']', '[\'[\'Krzysztof\',\'Torrens\']\',\'[\'Natver\',\'Haugrud\']\']', '[\'+86 106 939 328\',\'+88 608 856 793\']', '[\'rozele.szaran@outlook.com\',\'darby.foong@mail.com\']', '{\'+80 799 849 107\':\'Buscarino Software\',\'+89 781 326 591\':\'Kalechstein Fashion\'}', '2015-04-20', '{\'[\'Ainsley\',\'Redshaw\']\':\'2010-03-15\',\'[\'Malcolm\',\'Beech\']\':\'2002-10-22\'}', '[\'2005-10-13\',\'2002-10-22\']', '[\'2000-08-20\',\'2005-10-13\',\'2010-01-07\']', '{\'2002-10-22\':\'[\'[\'Digby\',\'Saboorian\']\',\'[\'Osmond\',\'Malkani\']\']\',\'2010-01-07\':\'[\'[\'Digby\',\'Saboorian\']\',\'[\'Osmond\',\'Malkani\']\']\'}', 'Loudly clapped her house servants the lands of despair. Myth this have delighted him walking swiftly along, somehow happened inside and precocious words exclaimed. These reports only separated and regained his body.'),
(9, 'Rorykhezri', '[\'Ainsley\',\'Redshaw\']', '[\'[\'Cristen\',\'Clairmont\']\',\'[\'Chungwo\',\'Bellehumeur\']\']', '[\'+95 284 102 617\',\'+34 382 292 758\']', '[\'sika.gebrael@yahoo.com\',\'youwen.morrissette@live.com\']', '{\'+97 942 612 374\':\'Mednick Company\',\'+97 799 126 131\':\'Morissette Fund\'}', '2009-06-13', '{\'[\'Malcolm\',\'Beech\']\':\'2001-09-06\',\'[\'\',\'\']\':\'2002-10-22\'}', '[\'2010-03-15\',\'2001-02-03\']', '[\'2015-04-20\',\'2001-09-06\']', '{\'2005-10-13\':\'[\'[\'Naser\',\'Cordy\']\',\'[\'Nataline\',\'Konopka\']\']\',\'2008-06-03\':\'[\'[\'Cary\',\'Seetharaman\']\',\'[\'Lida\',\'Lewellen\']\']\'}', 'Interrupted him disregard him many new rules, day when bathing it which were willing. Source spring from a parable of thought from you, wants to life than in himself completely never one-sided.'),
(10, 'Evittiuman', '[\'Zouheir\',\'Lanier\']', '[\'[\'Brigid\',\'Conrath\']\',\'[\'Kimmi\',\'Sleeman\']\']', '[\'+90 768 578 460\',\'+38 524 774 907\']', '[\'takako.walchli@gmail.com\',\'clevon.miranda@yahoo.com\']', '{\'+45 794 618 172\':\'Blethen Incorporated\',\'+67 302 843 143\':\'Stegman Limited\'}', '2009-06-13', '{\'[\'Kirtikumar\',\'Sepko\']\':\'2010-01-07\',\'[\'Malcolm\',\'Beech\']\':\'2000-08-20\'}', '[\'2015-04-20\',\'2010-03-15\',\'\']', '[\'2005-10-13\']', '{\'2002-10-22\':\'[\'[\'Cristen\',\'Clairmont\']\',\'[\'Chungwo\',\'Bellehumeur\']\']\',\'2008-06-03\':\'[\'[\'Brynn\',\'Valvasori\']\',\'[\'Ayako\',\'Meese\']\']\'}', 'Nodded all important letters and audacious were waiting, stared at our hair with high canopy of sleep. Wavered to depart from the courtesan\'s greeting.');

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
('8dbdda48-fb87-48d6-746f-1965824e966a', 0, 1, 2, 3, 4, 5, 6, 7, 8, 1.1, 2.2, 'Hello world!', 'Weaver', '2001-02-03', '2001-02-03 04:05:06.789', '123456781234567891234567812345678', 'fourth_2001-02-03 04:05:06.789', 'Much doing so without distrust. Image and cheerfulness of enlightenment. His loud screams for finding, stayed where would force you once more deeply thinking of.', 'Soy de títiro imitando a ciprio le diese, aquestas naos hizo peces de este nuestro ayuntamiento venturero. Cavernas altas y gesto el vicio.', 'Vos jours vainqueurs en riant très souvent par instants, l\'oubli noir ou telle forme des râles.', 'Pro a facta tulerant vici confirmant, primum permitteret earum metiri pollicitus ut suo sustinerent. Ambiorige et quae et quod facere poenas est sustentarent.'),
('b858c01e-f860-43ed-b854-e36236fb122f', 1, 55, 56, 371, 231, 637, 281, 833, 319, 65.74, 47.75, 'Anginklewes', 'Lovegrove', '2010-01-07', '2005-07-14 15:10:22', '1005d4ee45e87197a45f', 'fourth_2005-07-14 15:10:22', 'Looked down under its drawing so clearly, finding his sleep properly again. Fully become tired growing tired mouth which can fast.', 'Guiada de formión filósofo escogido, amorosos del sarmático oceano un monte tú haces e indicios.', 'S\'écroule en souriant l\'espoir immense espoir, dormir et riant lui l\'on dort son assomption.', 'Qui qui medio nonnulli accepit. Ea pertinerent misit maximeque bellum egressa germani. Eorum cum enim haeduo nostrae supra aeduus in.'),
('37127a31-a298-437d-0014-4b8d9396572b', 1, 2, 63, 458, 294, 433, 664, 973, 566, 26.97, 30.15, 'Mukundo', 'Huestis', '2010-03-15', '2015-03-12 16:09:24', '0b37c174a7aae14d72cb', 'third_2010-03-15', 'Cannot deny my beard have satisfied with mockery, myth this foolishness to feed him thinking of.', 'Gloria eterna pena de alejandro y gira, preguntó mas fuéle dada grande crea. Pensamientos se puede y luego ordena cómo corta el asiento.', 'L\'alouette a fallu pourtant saura vous êtes, vagissant et tournez souvent si naguères. Avides empressés fourmillants et pas la pâture suprême effort.', 'Primam mediis summittit caesar versabantur, suos accurrit disponere legionibus gesserat. Parte finibus se conquieverat et conspexit.'),
('e9cc3d5e-8f58-411d-fa2e-3bad4d50ced5', 0, 52, 29, 532, 805, 810, 133, 145, 642, 33.65, 39.22, 'Esoken', 'Robins', '2009-06-13', '2005-11-11 14:15:10', '32a6db3a3e6d55d02c90', 'fourth_2005-11-11 14:15:10', 'Until a priest and tenderness his hands long time, warrior gives me here thought wondrous teachings. Not perished nor any kind soft bed, love without passion of lust had turned slowly getting lost.', 'Entretiene la seca flor de clavo ardiente, recibe al sonar de mimosa.', 'Bruit mystérieux de nuits d\'hercules, paraît parfois on suit tes noires tresses, bienveillamment souriront aux girouettes détail fin vaisseau. Faisait un trône impérial toute illusion céleste.', 'Se ex et res acceptis magetobrigam, quam iam exsertis titum facto videret possent hibernis insulae, huius quod arar subsequatur virtutis suebis morentur fossamque praeter. Ac velit in praepositus nec diebus locus in.'),
('3e0c0b21-5c61-4ae3-2b1a-b861c8a916a1', 1, 12, 33, 571, 74, 427, 895, 434, 30, 16.99, 62.5, 'Aplemariw', 'Claggett', '2000-08-20', '2012-10-18 05:56:03', '717f7485c0ee4f7fa445', 'second_Claggett', 'Then I even and effects, having had seemed now on. Full breast when my thoughts, next to seek other boys and disappointment.', 'Mensajera del medio la rica seda. Basta por salvar su agua fría.', 'Surtout c\'est l\'extase austère du filou sournois, recuit à voir gai sur l\'eau des sabbats. Errez funestes et bleus becs de l\'acteur.', 'Profectos nullas vallo constanter hostibus dixisse et imperare et, sudes pacis quos intermittit culpa studio illustrem vehementissimo quid. Obsides incitato etiam hiemare publice ostendimus se suam se, circiter comportaverant confirmati senonibus oppidani hortante.'),
('756159d0-a654-4497-a59f-8db99ffe2aea', 1, 81, 34, 506, 259, 216, 681, 814, 29, 65.95, 65.73, 'Ericicy', 'Lakins', '2005-10-13', '2003-09-15 06:31:58', '6f25d1f6755090ebad66', 'second_Lakins', 'Should I listen to discuss possibly more quiet smile. Left and ridiculous to kill and would you force him, never fully understanding what actions to them. Knowing it together and dreary life.', 'Poseeréis todos mande acometer cielo levantando algo cumplida, piense que caer al estado más hermosa. Descubrirá su diosa a aquesta gente.', 'Courent sur pied sec de boue, homme vers quels baisers froids où s\'élançait et l\'encens rare. Elle souriait d\'aise et plonge tes cargaisons de pantin. Né dans mon être hélas de taches de l\'humanité frivole.', 'Ut domum ut quaeque calonum ac tuendi ex italiam gallis. His milium si quantasvis titurius caede nullam civitati in, antea longe pars coicere eum in ipse cum ostenderunt. Desperare controversias beneficiis ut prohiberent compulerunt se et tantum cohortium.'),
('294563a9-00d9-4711-6f02-f1b555c600d5', 1, 51, 98, 274, 690, 465, 150, 122, 103, 65.55, 84.29, 'Emelinejy', 'Blazer', '2002-10-22', '2001-12-13 21:14:24', '33e7701480fec866d359', 'third_2002-10-22', 'Deaf and gathered dust in hut of humans, seeing images appeared on earth.', 'Desharían con manjares excelentes producidos, ligeros y espumosas ondas inquïetas ondas inquïetas.', 'Habitant de ce schisme têtu. Attentif à l\'amour me servira de reptiles, frottés que dévore une fourmilière elle dans l\'extase. L\'holocauste sacré du lait de l\'azur taciturne.', 'Duplicavit milium proponerentur in praemia, videretur acciperent eos in acceptis eum. Salute electa intercipiuntur amicitiae prima, cum in si paulum premerentur.'),
('03deb1d4-bd28-4478-96d3-908fddf4d75c', 0, 17, 67, 732, 837, 880, 305, 104, 547, 29.78, 77.97, 'Undlatas', 'Gioffre', '2015-04-20', '2009-10-02 10:31:34', '01d7dea87d31cfd8f582', 'first_Undlatas', 'Looking into him even closer to speak, takes everyone different from now I\'m travelling.', 'Esto pasaba en bien informado soy aquel su palacio, certificarte que nuestros se verá cuajado enjuto. Cuales verás las boreales ondas al flaco cuerpo muerto sea. Ningún grande rica y adulterios.', 'Deux silvains hilares à droite au pays des démons. Lasse elle vous semble bercé par quelles virgules.', 'Testudines arcesseret senatus remorum impedimenta finire, opportuno omnino habebat post milia signo hostium, partem inferre cum dividit nuptum castris.'),
('2b7fc079-e9ae-4138-b1ce-fbee1f37d4b2', 1, 48, 50, 840, 901, 550, 490, 818, 933, 40.34, 17.71, 'Adtkuralu', 'Shankar', '2008-06-03', '2013-07-01 03:20:23', 'e060a7dd8e5dc3c68fc3', 'second_Shankar', 'Join the foot of dust in holiness of disgust, propelling themselves away thousands of, mumbled a piece of patience when listening to earthly things. Image the happy he owned a gift.', 'Venciendo el bando mujeril que prestamente, respóndeles de maravilla fatal no quisiera quizás tenía vista.', 'S\'abattent sur d\'autres amours sont comme, lesbos entre plein de mystère. Paris n\'est meilleur de nous mettrons noire rouge encor.', 'Iam sui quod milia premerent itaque de remorum qui, si duritiae et praeposuit proprios.'),
('1d9dafa7-7c3a-44d7-6649-d2d1b5d0a84d', 1, 21, 48, 274, 524, 290, 963, 73, 79, 79.75, 84.82, 'Ermoserellop', 'Dipietro', '2001-09-06', '2012-04-06 06:46:06', '8515b127084d888d9bef', 'fourth_2012-04-06 06:46:06', 'Always get to pass through water it told you say, straightened up all beautiful woman. Two hours and strongly living by love.', 'Un valle bajo estado humilde manto, comunes la mezquina y fortaleza.', 'Baignait nerveusement ses deux et bananes, ainsi quand maintenon jetait sur bord et parfums lourds tombereaux.', 'Esse adfligunt ad his navibus funditoribus caesar terra, eventum tanta tempore exigua principes.');

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
(1057134854629068182, 'f24e7b23-a91e-4f02-35f0-d6c09bd24ca3', 'Ruzicka', 64, 'Stared at the hedge without making any other, made several bows with nothing for him. Courtesan has got him with much stupidity through life, glance turned slowly it are listening with defamation. Held against them my longing to live.'),
(452271120344735942, '27e14dba-8cf8-4bef-46b8-20ce82405872', 'Showers', 876, 'To feel in heat and waters were made yesterday, she\'ll die ten thousand any women with salutations. Death and concealed still recognise me about.'),
(7917634406704723241, '86e12337-09fe-4d86-b55e-b158f3b98e97', 'Spohn', 184, 'What\'s the sky turned back in magic spells, perhaps it laugh at our heart hurt you. While he started crying miserably and she asked. Their relative positions \'ere the reason why I been, according to cruise on water he read this breast.'),
(5930136766772685422, '7ce74f6e-6f98-4369-0907-aed5729cf518', 'Sourour', 276, 'We perhaps benevolent perhaps reciprocate it said, times to humans in no imitation no daemons, conducted his future his equal yes and spoke. We\'ll continue demonstrating his soul without any further.'),
(5477995814574864259, '77b7b67f-5feb-4696-e39c-4c3163e89fd7', 'Gobeil', 19, 'Pearls he ever a boy looked inside of desires. Whispered quietly flowing to participate in one\'s thoughts, it knows what makes when losses occurred to servants. Continued what his people look for food to friend, apparently he now is red is small.'),
(8845244516171056477, '5b159add-ae67-49b0-4969-55146c5cc907', 'Bilodeau', 364, 'Most of failing or ever loved any given, worry said no never convince his chin. Came towards this deepest meditation holding your eyes.');

CREATE TABLE `VALUE_DATA` (
  `Uuid` VARCHAR(36) NOT NULL, 
  `ValueId` BIGINT NULL, 
  `ValueUuid` VARCHAR(36) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `VALUE_DATA` (`Uuid`, `ValueId`, `ValueUuid`) VALUES
('a6ca7c84-002d-4779-8a32-03943497745b', 3344523601393165508, '8b04d5e3-775d-298e-7845-5efc5ca404d5'),
('aaea97b7-d65b-4174-bb2d-6264f5fecf08', -6907789044519798771, 'a9f0e61a-137d-86aa-9db5-3465e0801612'),
('cd1f598c-b776-47f6-f17b-b0ca6bc06583', -5292141111288023615, 'dd5c8bf5-1558-ffcb-e500-7071908e9524'),
('583fec5f-351e-42d4-d043-ecf7aabb6102', -5359923222225123686, '0883a652-0e6e-b6c9-304d-cfb71034d053'),
('7d9aeca5-39a7-4c6c-ebf9-97f0ee154f14', -7654305769731274948, 'dd5c8bf5-1558-ffcb-e500-7071908e9524'),
('73c394fd-929c-40cf-baef-d9c65ea89dbf', 8845244516171056477, '27e14dba-8cf8-4bef-46b8-20ce82405872'),
('b416a652-95a6-4d58-5b40-f555662b1222', 452271120344735942, 'a9f0e61a-137d-86aa-9db5-3465e0801612'),
('7dbdf006-c796-4db9-5a4e-e0642ad7e747', 8845244516171056477, 'dd5c8bf5-1558-ffcb-e500-7071908e9524'),
('6ce159fa-836d-4b0e-2ece-61239931c6f0', 3344523601393165508, 'f24e7b23-a91e-4f02-35f0-d6c09bd24ca3'),
('895e8bb6-8849-422e-ac4b-5f9b3b580b8a', -6907789044519798771, '27e14dba-8cf8-4bef-46b8-20ce82405872');

ALTER TABLE `COMPOUND`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `SIMPLE`
  ADD PRIMARY KEY (`Uuid`);

ALTER TABLE `VALUE`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `VALUE_DATA`
  ADD PRIMARY KEY (`Uuid`);
