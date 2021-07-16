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
(1, 'Belgium', '[\'Malcolm\',\'Beech\']', '[\'[\'Jack\',\'Harper\']\',\'[\'Victoria\',\'Olsen\']\']', '[\'12345678\',\'23456789\']', '[\'jack.harper@gmail.com\',\'victoria.olsen@outlook.com\']', '{\'12345678\':\'Warner Bros\',\'23456789\':\'Universal Pictures\'}', '2012-12-24', '{\'[\'Nell\',\'Norfleet\']\':\'2007-06-02\',\'[\'Gerben\',\'Verhoeven\']\':\'2015-08-24\'}', '[\'2001-02-03\',\'2007-06-02\']', '[\'2015-11-02\']', '{\'2014-06-19\':\'[\'[\'Noelyn\',\'Hoskin\']\',\'[\'Darrelle\',\'Blake\']\']\',\'2015-08-24\':\'[\'[\'Sondra\',\'Martincello\']\',\'[\'Celene\',\'Escher\']\']\'}', '{}'),
(2, '', '[\'\',\'\']', '[\'[\'\',\'\']\',\'[\'\',\'\']\']', '[\'\',\'\']', '[\'rick.deckard@gmail.com\',\'dave.holden@outlook.com\']', '{\'12345678\':\'\',\'23456789\':\'\'}', '2006-06-15', '{\'[\'Leisee\',\'Baggermanwebster\']\':\'2006-06-15\',\'[\'Katrine\',\'Cadd\']\':\'2001-02-03\'}', '[\'2015-11-02\',\'2007-06-02\']', '[\'2014-06-19\',\'2007-06-02\']', '{\'2014-06-19\':\'[\'[\'Jack\',\'Harper\']\',\'[\'Victoria\',\'Olsen\']\']\',\'2015-11-02\':\'[\'[\'Sondra\',\'Martincello\']\',\'[\'Celene\',\'Escher\']\']\'}', ''),
(3, 'Erreko', '[\'Duc\',\'Piette\']', '[\'[\'Noelyn\',\'Hoskin\']\',\'[\'Darrelle\',\'Blake\']\']', '[\'+86 885 830 958\',\'+24 718 737 948\']', '[\'sinh.bakhach@outlook.com\',\'zafer.salvato@live.com\']', '{\'+14 999 336 306\':\'Ide Associates\',\'+82 765 162 565\':\'Ficco Team\'}', '2015-08-24', '{\'[\'Tetsuya\',\'Terrell\']\':\'2015-08-24\',\'[\'Duc\',\'Piette\']\':\'2014-06-19\'}', '[\'2001-02-03\',\'2015-11-02\']', '[\'2015-11-02\']', '{\'2014-06-19\':\'[\'[\'Emelita\',\'Zeng\']\',\'[\'Furrukh\',\'Mihara\']\']\',\'2015-08-24\':\'[\'[\'Selena\',\'Dambenieks\']\',\'[\'Vax\',\'Millar\']\']\'}', 'Made friends like humidity entering the monks, write very divinity\'s way said and why his father. All except for several times for it, also lives of others but simultaneously and asked himself, since he stood not last teacher the shore.'),
(4, 'Warorvud', '[\'Tetsuya\',\'Terrell\']', '[\'[\'Turus\',\'Diaz\']\',\'[\'Ash\',\'Cemensky\']\']', '[\'+42 581 944 640\',\'+97 389 449 237\']', '[\'ajmal.augeri@gmail.com\',\'emilio.ricks@hotmail.com\']', '{\'+92 446 524 420\':\'Marcheck Depot\',\'+69 198 254 459\':\'Ramsden Factory\'}', '2006-06-15', '{\'[\'Malcolm\',\'Beech\']\':\'2015-11-02\',\'[\'Franni\',\'Macmillanbrown\']\':\'2014-06-19\'}', '[\'2009-03-17\',\'2015-08-24\']', '[\'2006-05-25\',\'2006-05-25\']', '{\'2014-06-19\':\'[\'[\'\',\'\']\',\'[\'\',\'\']\']\',\'2012-12-24\':\'[\'[\'Turus\',\'Diaz\']\',\'[\'Ash\',\'Cemensky\']\']\'}', 'Meditation according to seek knowledge had dreamt of, than force him had roared and teach me, straightened up just know my faithful man like them.'),
(5, 'Sidoney', '[\'Katrine\',\'Cadd\']', '[\'[\'Zahirul\',\'Hofstetter\']\',\'[\'Billy\',\'Longpre\']\']', '[\'+87 823 702 481\',\'+84 837 208 807\']', '[\'geoffrey.connorscronin@outlook.com\',\'leesa.rudzinski@live.com\']', '{\'+40 217 828 897\':\'Benavidez Dynamics\',\'+96 830 738 345\':\'Sutherland Vision\'}', '2007-06-02', '{\'[\'\',\'\']\':\'2015-11-02\',\'[\'Nell\',\'Norfleet\']\':\'2012-12-24\'}', '[\'2009-03-17\',\'2014-06-19\']', '[\'2009-03-17\']', '{\'2015-08-24\':\'[\'[\'\',\'\']\',\'[\'\',\'\']\']\',\'2009-03-17\':\'[\'[\'Jack\',\'Harper\']\',\'[\'Victoria\',\'Olsen\']\']\'}', 'As quenched it must not add his worries, purpose in talking which were getting lost again. Name any or wetness of blessing to servants. Conducted his praise you like my senses, lust like a smiling he made who come said.'),
(6, 'Leguffne', '[\'Gerben\',\'Verhoeven\']', '[\'[\'Beppie\',\'Capostagno\']\',\'[\'Alec\',\'Caputo\']\']', '[\'+93 243 548 249\',\'+89 574 147 154\']', '[\'emilie.klimas@yahoo.com\',\'parham.lanthier@live.com\']', '{\'+69 196 174 248\':\'Fagan Network\',\'+61 551 580 235\':\'Hjartarson Agency\'}', '2006-05-25', '{\'[\'Duc\',\'Piette\']\':\'2006-05-25\',\'[\'Malcolm\',\'Beech\']\':\'2001-02-03\'}', '[\'2006-08-13\',\'2006-05-25\']', '[\'2014-06-19\']', '{\'2006-06-15\':\'[\'[\'Turus\',\'Diaz\']\',\'[\'Ash\',\'Cemensky\']\']\',\'2006-08-13\':\'[\'[\'\',\'\']\',\'[\'\',\'\']\']\'}', 'Else from burdening himself fall asleep myself for yourself. Bad voices consisted of rage he left, is still he belong to had listened silently.'),
(7, 'Obeckerelga', '[\'Nell\',\'Norfleet\']', '[\'[\'Kailey\',\'Houghton\']\',\'[\'Loni\',\'Gleditsch\']\']', '[\'+45 927 758 937\',\'+18 476 154 398\']', '[\'atalanta.presner@hotmail.com\',\'christian.blakeslee@hotmail.com\']', '{\'+44 611 208 920\':\'Laurent University\',\'+69 955 749 268\':\'Wikkerink Online\'}', '2009-03-17', '{\'[\'Malcolm\',\'Beech\']\':\'2006-06-15\',\'[\'Katrine\',\'Cadd\']\':\'2015-11-02\'}', '[\'2006-08-13\',\'2012-12-24\']', '[\'2006-05-25\']', '{\'2006-06-15\':\'[\'[\'Sondra\',\'Martincello\']\',\'[\'Celene\',\'Escher\']\']\',\'2006-05-25\':\'[\'[\'Sondra\',\'Martincello\']\',\'[\'Celene\',\'Escher\']\']\'}', 'Son would help but even conscious anxiety in everything, willingness delights my reward of burning rays of robbers. They shall spent the silently into rain and forgetfulness.'),
(8, 'Imbehallop', '[\'Caro\',\'Tull\']', '[\'[\'Selena\',\'Dambenieks\']\',\'[\'Vax\',\'Millar\']\']', '[\'+95 284 220 763\',\'+64 358 324 565\']', '[\'jay.bussey@gmail.com\',\'mercie.fleming@mail.com\']', '{\'+16 215 908 673\':\'Lavecchia Fashion\',\'+71 333 346 428\':\'Reichman Team\'}', '2012-12-24', '{\'[\'Gerben\',\'Verhoeven\']\':\'2006-08-13\',\'[\'Leisee\',\'Baggermanwebster\']\':\'2012-12-24\'}', '[\'2001-02-03\',\'2015-08-24\',\'\']', '[\'2001-02-03\']', '{\'2001-02-03\':\'[\'[\'Sondra\',\'Martincello\']\',\'[\'Celene\',\'Escher\']\']\',\'2012-12-24\':\'[\'[\'Emelita\',\'Zeng\']\',\'[\'Furrukh\',\'Mihara\']\']\'}', 'Shouldn\'t I also saw one helping you, smile she received thanks returned to breathe, heard its brow a penitent stood for knowledge.'),
(9, 'Orever', '[\'Leisee\',\'Baggermanwebster\']', '[\'[\'Emelita\',\'Zeng\']\',\'[\'Furrukh\',\'Mihara\']\']', '[\'+25 240 273 526\',\'+82 187 339 900\']', '[\'derin.wyant@outlook.com\',\'dayna.ashbee@outlook.com\']', '{\'+60 539 465 941\':\'Rutland Dynamics\',\'+19 219 317 387\':\'Desalis Network\'}', '2015-08-24', '{\'[\'Gerben\',\'Verhoeven\']\':\'2015-11-02\',\'[\'Franni\',\'Macmillanbrown\']\':\'2015-08-24\'}', '[\'2014-06-19\',\'2006-05-25\']', '[\'2015-08-24\',\'2009-03-17\']', '{\'2006-06-15\':\'[\'[\'Noelyn\',\'Hoskin\']\',\'[\'Darrelle\',\'Blake\']\']\',\'2015-11-02\':\'[\'[\'Emelita\',\'Zeng\']\',\'[\'Furrukh\',\'Mihara\']\']\'}', 'Consciousness the motionless his rice-bowls took a lot, laughed surely I might come are now emptiness. Mute and divine grace to expect it, not bring happiness felt encompassed by throwing out badly.'),
(10, 'Ellownop', '[\'Franni\',\'Macmillanbrown\']', '[\'[\'Sondra\',\'Martincello\']\',\'[\'Celene\',\'Escher\']\']', '[\'+55 967 666 579\',\'+40 390 685 459\']', '[\'raphaela.darrimon@yahoo.com\',\'kiersten.pelz@mail.com\']', '{\'+36 574 335 359\':\'Chesser Media\',\'+51 578 246 478\':\'Bereza Tech\'}', '2009-03-17', '{\'[\'Gerben\',\'Verhoeven\']\':\'2015-11-02\',\'[\'Duc\',\'Piette\']\':\'2012-12-24\'}', '[\'2006-08-13\',\'2009-03-17\',\'\']', '[\'2009-03-17\']', '{\'2012-12-24\':\'[\'[\'\',\'\']\',\'[\'\',\'\']\']\',\'2001-02-03\':\'[\'[\'Selena\',\'Dambenieks\']\',\'[\'Vax\',\'Millar\']\']\'}', 'Before on all foolish but salvation as it is. Being able to their worries or the father, salvation as had occupied his limbs his error. Until no driver of sickliness of misery.');

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
  `Option` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SIMPLE` (`Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`, `Option`) VALUES
('8dbdda48-fb87-48d6-746f-1965824e966a', 0, 1, 2, 3, 4, 5, 6, 7, 8, 1.1, 2.2, 'Hello world!', 'Labonte', '2001-02-03', '2001-02-03 04:05:06.789', '123456781234567891234567812345678', 'third_2001-02-03'),
('b6220fe8-d5ae-4ce8-2f66-2e024e0f2af6', 0, 66, 85, 7, 466, 658, 827, 818, 929, 22.03, 50.98, 'Robinettax', 'Tsang', '2006-05-25', '2004-10-21 09:28:12', '46cf840e0688a26a8f57', 'fourth_2004-10-21 09:28:12'),
('a358cdcc-1618-46bd-5144-7fda44a1206e', 1, 18, 53, 242, 754, 555, 684, 180, 915, 15.87, 79.23, 'Zywielerma', 'Schofield', '2009-03-17', '2006-02-03 10:32:11', '297787f507f89545cc41', 'third_2009-03-17'),
('6c646cbf-8033-4f38-71aa-2ab3db66c669', 1, 72, 44, 145, 791, 572, 740, 397, 657, 55.18, 81.48, 'Davina', 'Allahdin', '2015-08-24', '2008-04-16 10:29:31', '4e76d50228f133bc909f', 'first_Davina'),
('de1a074e-a410-4525-ef95-6cb39910a677', 0, 4, 10, 952, 127, 681, 277, 168, 39, 31.25, 15.96, 'Ittottelu', 'Bourbonnais', '2006-08-13', '2002-09-19 09:59:36', 'e48b42eb6d46b79e501b', 'third_2006-08-13'),
('7afb48b9-1895-4714-5f8f-cdff7fb68d66', 0, 2, 52, 596, 402, 918, 783, 493, 359, 69.44, 50.59, 'Vativcharo', 'Leiker', '2006-06-15', '2009-09-25 17:40:59', 'e7153ab5c8ef2ff6c27a', 'second_Leiker'),
('5aa44b78-469f-4e43-19ba-022524959522', 1, 67, 77, 862, 689, 706, 118, 914, 279, 69.75, 70.1, 'Dasesnileini', 'Fielden', '2007-06-02', '2002-08-27 13:30:40', '3578201667bb17f8f0c6', 'fourth_2002-08-27 13:30:40'),
('1f2ca609-eb98-4e6f-d5f2-2010a59b829c', 1, 40, 17, 360, 992, 870, 756, 751, 720, 28.47, 97.85, 'Ameliemak', 'Cruickshank', '2014-06-19', '2003-02-07 12:24:33', '7a35ad184caf7e708562', 'first_Ameliemak'),
('a2314c86-3421-44eb-a700-42c022e5edf2', 0, 64, 70, 602, 557, 131, 811, 415, 252, 45.86, 68.55, 'Anskilidewsu', 'Lavoie', '2015-11-02', '2009-02-27 12:26:13', '53594e942b01af24e1d1', 'fourth_2009-02-27 12:26:13'),
('c2a57928-fdba-4f70-3860-e7c12914f070', 1, 59, 4, 898, 502, 897, 876, 128, 678, 30.97, 91.71, 'Reicer', 'Barrington', '2012-12-24', '2004-09-03 23:58:47', '59b426c5fddaa505f5b4', 'first_Reicer');

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
(8828278782407144305, '79418953-1f64-48f3-e0df-78f375659ffa', 'Runyon', 391, 'Urged him worthless and whatever for fifteen days, heard him growing riches pursued the forests. Or to confess to devour him always used to. Apparently he left the singing bird captive in everything.'),
(3809890834738396522, 'f403c2e2-f3fd-4fb2-297d-4f2bdbfd4911', 'Ghatta', 776, 'Secretly he worked calmly sitting opposite of dice, of ran incessantly hit me say to smile. Laughed brightly red lips something honourable one thing, did many things have read a distant spot. The skinny and whose smile to side.'),
(877876505718499159, '2fb334d2-4033-42b7-0e81-7a39045b97b9', 'Posavad', 555, 'Been so that art well my self, and modesty becoming to wait calmly sitting. Rich foreign merchant forced upon him satisfy him.'),
(914283521589001029, '9c696461-4187-4b60-46e1-e199604dd707', 'Kasbow', 765, 'Somehow happened from sin or soap and laughed aloud, told him sit and sloth had fallen. Haven\'t expected any time said to scold him, may I recognise him just standing between evil words. We\'ll continue gambling he wouldn\'t like this.'),
(9206931627342855237, 'fe722fbb-e6c5-4063-9f79-b9e510feed1b', 'Noye', 331, 'Name of thoughts this song of dust, few breathes learned these pleasures these waters, made to much bearing his monks and money. With as well she played the noblemen no sleep.'),
(110209439141065655, '39a3e08a-4b86-4969-9fff-2ae45bd6cba8', 'Cecil', 593, 'Has remained within the light and ultimate thirst. Sadness as natural that then also take your love. Gave advice but when we refer to capture it.');

CREATE TABLE `VALUE_DATA` (
  `Uuid` VARCHAR(36) NOT NULL, 
  `ValueId` BIGINT NULL, 
  `ValueUuid` VARCHAR(36) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `VALUE_DATA` (`Uuid`, `ValueId`, `ValueUuid`) VALUES
('365798aa-8efa-4c6f-188c-6209c6615bc9', 3344523601393165508, '8b04d5e3-775d-298e-7845-5efc5ca404d5'),
('f2650551-8f9d-46bc-7168-e215a9c5193f', -6907789044519798771, 'a9f0e61a-137d-86aa-9db5-3465e0801612'),
('b553ed20-9b2e-44bc-f45e-99104e3c6a7f', -5292141111288023615, 'dd5c8bf5-1558-ffcb-e500-7071908e9524'),
('024546c8-26a8-4c70-4cba-dcce032b2783', -5359923222225123686, '0883a652-0e6e-b6c9-304d-cfb71034d053'),
('bd4bd900-e9ef-4086-05d0-70a48bd00119', -5292141111288023615, '2fb334d2-4033-42b7-0e81-7a39045b97b9'),
('25307066-ff7a-4eae-5727-8f70b364e118', 3809890834738396522, 'dd5c8bf5-1558-ffcb-e500-7071908e9524'),
('edb7e908-881a-4281-643b-88d440c368ab', -6907789044519798771, 'f403c2e2-f3fd-4fb2-297d-4f2bdbfd4911'),
('db6968f4-3029-460b-4932-9d21b9c526e7', -5292141111288023615, '39a3e08a-4b86-4969-9fff-2ae45bd6cba8'),
('896c91a3-66d7-4e01-2c81-2604eccba221', 914283521589001029, 'dd5c8bf5-1558-ffcb-e500-7071908e9524'),
('63b9475b-7a42-4112-0e60-4efb0401b408', -5292141111288023615, 'dd5c8bf5-1558-ffcb-e500-7071908e9524');

ALTER TABLE `COMPOUND`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `SIMPLE`
  ADD PRIMARY KEY (`Uuid`);

ALTER TABLE `VALUE`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `VALUE_DATA`
  ADD PRIMARY KEY (`Uuid`);
