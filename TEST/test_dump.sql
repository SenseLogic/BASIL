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
(1, 'Belgium', '[\'Malcolm\',\'Beech\']', '[\'[\'Jack\',\'Harper\']\',\'[\'Victoria\',\'Olsen\']\']', '[\'12345678\',\'23456789\']', '[\'jack.harper@gmail.com\',\'victoria.olsen@outlook.com\']', '{\'12345678\':\'Warner Bros\',\'23456789\':\'Universal Pictures\'}', '2007-11-23', '{\'[\'Melisa\',\'Truelove\']\':\'2004-01-25\',\'[\'Rosabelle\',\'Dulin\']\':\'2003-02-04\'}', '[\'2013-01-10\',\'2004-03-13\']', '[\'2003-02-04\']', '{\'2007-11-23\':\'[\'[\'Sidone\',\'Bradyhouse\']\',\'[\'Seline\',\'Symons\']\']\',\'2009-05-17\':\'[\'[\'\',\'\']\',\'[\'\',\'\']\']\'}', '{}'),
(2, '', '[\'\',\'\']', '[\'[\'\',\'\']\',\'[\'\',\'\']\']', '[\'\',\'\']', '[\'rick.deckard@gmail.com\',\'dave.holden@outlook.com\']', '{\'12345678\':\'\',\'23456789\':\'\'}', '2014-07-13', '{\'[\'Ved\',\'Traceymccabe\']\':\'2009-05-17\',\'[\'Rosabelle\',\'Dulin\']\':\'2009-05-17\'}', '[\'2004-03-13\',\'2014-07-13\']', '[\'2014-07-13\',\'2000-10-21\']', '{\'2003-02-04\':\'[\'[\'Irish\',\'Nagai\']\',\'[\'Tricord\',\'Lucente\']\']\',\'2014-11-28\':\'[\'[\'Sidone\',\'Bradyhouse\']\',\'[\'Seline\',\'Symons\']\']\'}', ''),
(3, 'ESCAWA', '[\'Melisa\',\'Truelove\']', '[\'[\'Olusola\',\'Huber\']\',\'[\'Bren\',\'Foos\']\']', '[\'+59 953 373 446\',\'+28 690 547 561\']', '[\'darrelle.jonczak@outlook.com\',\'krzysztof.schirtzinger@live.com\']', '{\'+61 477 568 658\':\'Lagace Factory\',\'+52 325 811 225\':\'Jak Fx\'}', '2014-07-13', '{\'[\'Polly\',\'Boschin\']\':\'2004-03-13\',\'[\'Rosamund\',\'Thorsen\']\':\'2014-11-28\'}', '[\'2007-11-23\',\'2004-01-25\']', '[\'2007-11-23\',\'2001-02-03\']', '{\'2004-01-25\':\'[\'[\'Misty\',\'Sydor\']\',\'[\'Charmion\',\'Holmquist\']\']\',\'2004-03-13\':\'[\'[\'Irish\',\'Nagai\']\',\'[\'Tricord\',\'Lucente\']\']\'}', 'Aren\'t you so venerable teachings that my very day, wound was silent in reaching the pursuer, times all thoughts just too that goal. Looking at that I\'ve never touched the teachers.'),
(4, 'KEMPERTY', '[\'Polly\',\'Boschin\']', '[\'[\'Rizwan\',\'Couse\']\',\'[\'Ulrika\',\'Richlark\']\']', '[\'+70 381 898 657\',\'+68 464 315 367\']', '[\'melita.atl@hotmail.com\',\'elfie.neubauer@gmail.com\']', '{\'+96 972 902 486\':\'Allaman Group\',\'+18 883 627 334\':\'Storey Online\'}', '2014-11-28', '{\'[\'Nagaraj\',\'Peng\']\':\'2004-01-25\',\'[\'Melisa\',\'Truelove\']\':\'2014-07-13\'}', '[\'2013-01-10\',\'2014-11-28\']', '[\'2014-11-28\']', '{\'2014-07-13\':\'[\'[\'Sheryl\',\'Labelle\']\',\'[\'Karyn\',\'Hargadon\']\']\',\'2001-02-03\':\'[\'[\'Sidone\',\'Bradyhouse\']\',\'[\'Seline\',\'Symons\']\']\'}', 'Sinner which goal attracts him without substance. River about where are such shoes pretty at hers, yoga-veda shall know the acts of salvation, day informed the disgust and robbers have admired you.'),
(5, 'ATTHIDGE', '[\'Kiki\',\'Catering\']', '[\'[\'Tatiania\',\'Jarvah\']\',\'[\'Francine\',\'Lapre\']\']', '[\'+92 215 807 754\',\'+75 249 138 787\']', '[\'moray.biage@live.com\',\'anneke.rakesh@mail.com\']', '{\'+79 838 225 420\':\'Philion Company\',\'+96 315 106 935\':\'Levin Central\'}', '2007-11-23', '{\'[\'Amabel\',\'Dippolito\']\':\'2004-01-25\',\'[\'Malcolm\',\'Beech\']\':\'2001-02-03\'}', '[\'2000-10-21\',\'2013-01-10\']', '[\'2004-03-13\',\'2013-01-10\',\'2000-10-21\']', '{\'2014-11-28\':\'[\'[\'\',\'\']\',\'[\'\',\'\']\']\',\'2014-07-13\':\'[\'[\'Tatiania\',\'Jarvah\']\',\'[\'Francine\',\'Lapre\']\']\'}', 'Do it necessary came through his goal. Near perfection of exhaled the spoke for riches. The singing voice in living joy in thinking.'),
(6, 'ALBRASHULOW', '[\'Rosabelle\',\'Dulin\']', '[\'[\'Sheryl\',\'Labelle\']\',\'[\'Karyn\',\'Hargadon\']\']', '[\'+88 557 523 401\',\'+71 331 947 205\']', '[\'evelien.technosoft@outlook.com\',\'michaelina.khadbai@outlook.com\']', '{\'+60 334 776 117\':\'Amarsi Bank\',\'+17 482 334 988\':\'Sy Bank\'}', '2004-01-25', '{\'[\'Malcolm\',\'Beech\']\':\'2004-03-13\',\'[\'Amabel\',\'Dippolito\']\':\'2003-02-04\'}', '[\'2007-11-23\',\'2003-02-04\']', '[\'2014-11-28\',\'2009-05-17\']', '{\'2000-10-21\':\'[\'[\'\',\'\']\',\'[\'\',\'\']\']\',\'2001-02-03\':\'[\'[\'Irish\',\'Nagai\']\',\'[\'Tricord\',\'Lucente\']\']\'}', 'Leaned to abstain from these people see everything, you aren\'t capable of no teaching a mother\'s funeral. Kindly he needed lust though the terrible words, tomorrow and setting over I think if time mortal.'),
(7, 'ENBEKI', '[\'Amabel\',\'Dippolito\']', '[\'[\'Irish\',\'Nagai\']\',\'[\'Tricord\',\'Lucente\']\']', '[\'+60 865 755 222\',\'+88 110 668 757\']', '[\'radford.hastings@live.com\',\'toyanne.intemann@gmail.com\']', '{\'+88 341 735 710\':\'Stainback Fx\',\'+91 656 682 782\':\'Vonderhaar Insurance\'}', '2009-05-17', '{\'[\'Kiki\',\'Catering\']\':\'2003-02-04\',\'[\'Polly\',\'Boschin\']\':\'2004-03-13\'}', '[\'2014-07-13\',\'2014-11-28\',\'\']', '[\'2003-02-04\',\'2013-01-10\',\'2014-07-13\']', '{\'2007-11-23\':\'[\'[\'Tatiania\',\'Jarvah\']\',\'[\'Francine\',\'Lapre\']\']\',\'2014-11-28\':\'[\'[\'Rizwan\',\'Couse\']\',\'[\'Ulrika\',\'Richlark\']\']\'}', 'Quietly lowered glance and screamed in thought, never come and willingly be any other. Read the seat by letter by one\'s breath, arriving at which filled every intention regarded as ever, indignant he at every hour my name.'),
(8, 'EHLIVI', '[\'Ved\',\'Traceymccabe\']', '[\'[\'Sidone\',\'Bradyhouse\']\',\'[\'Seline\',\'Symons\']\']', '[\'+53 290 458 635\',\'+93 722 112 162\']', '[\'elinore.santiago@mail.com\',\'alethea.wu@mail.com\']', '{\'+87 748 106 401\':\'Caterina Team\',\'+26 950 200 104\':\'Brasset Agency\'}', '2009-05-17', '{\'[\'Malcolm\',\'Beech\']\':\'2004-03-13\',\'[\'Nagaraj\',\'Peng\']\':\'2009-05-17\'}', '[\'2003-02-04\',\'2000-10-21\']', '[\'2009-05-17\']', '{\'2003-02-04\':\'[\'[\'Sidone\',\'Bradyhouse\']\',\'[\'Seline\',\'Symons\']\']\',\'2009-05-17\':\'[\'[\'\',\'\']\',\'[\'\',\'\']\']\'}', 'Bid him apart not fall without food without distrust. Any will keep him do at that line, broke loose embraced wrapped up gave his son.'),
(9, 'OINTAJSKIB', '[\'Rosamund\',\'Thorsen\']', '[\'[\'Misty\',\'Sydor\']\',\'[\'Charmion\',\'Holmquist\']\']', '[\'+57 774 355 692\',\'+35 996 215 986\']', '[\'stacia.dayal@gmail.com\',\'feynman.dunbar@mail.com\']', '{\'+24 315 665 634\':\'Dziawa Store\',\'+51 820 217 349\':\'Marsden Online\'}', '2003-02-04', '{\'[\'Rosamund\',\'Thorsen\']\':\'2001-02-03\',\'[\'Ved\',\'Traceymccabe\']\':\'2014-07-13\'}', '[\'2001-02-03\',\'2009-05-17\']', '[\'2001-02-03\']', '{\'2014-11-28\':\'[\'[\'Sidone\',\'Bradyhouse\']\',\'[\'Seline\',\'Symons\']\']\',\'2001-02-03\':\'[\'[\'Sidone\',\'Bradyhouse\']\',\'[\'Seline\',\'Symons\']\']\'}', 'Nodded in one are learning all life, broke loose embraced him court for nothing, early in each big loss his mother\'s funeral. Propelling themselves with perfect man made to opinions.'),
(10, 'AABASAALEYN', '[\'Nagaraj\',\'Peng\']', '[\'[\'Karna\',\'Samieian\']\',\'[\'Gabbi\',\'Tabalba\']\']', '[\'+99 960 559 644\',\'+66 311 846 998\']', '[\'theda.gowland@mail.com\',\'randie.willemsen@mail.com\']', '{\'+88 962 203 838\':\'Setiawan Software\',\'+23 262 148 295\':\'Petrea Limited\'}', '2007-11-23', '{\'[\'\',\'\']\':\'2014-07-13\',\'[\'Rosamund\',\'Thorsen\']\':\'2007-11-23\'}', '[\'2013-01-10\',\'2003-02-04\']', '[\'2004-01-25\',\'2004-01-25\']', '{\'2004-01-25\':\'[\'[\'Irish\',\'Nagai\']\',\'[\'Tricord\',\'Lucente\']\']\',\'2014-07-13\':\'[\'[\'Sidone\',\'Bradyhouse\']\',\'[\'Seline\',\'Symons\']\']\'}', 'Even conscious anxiety in error that began the self, smiling brightly and beautiful colour and offerings, looking for hours of wishing empty rumours.');

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
  `Blob` BLOB NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SIMPLE` (`Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Name`, `Date`, `DateTime`, `Blob`) VALUES
('8dbdda48-fb87-48d6-746f-1965824e966a', 0, 1, 2, 3, 4, 5, 6, 7, 8, 1.1, 2.2, 'Hello world!', 'Millward', '2001-02-03', '2001-02-03 04:05:06.789', '123456781234567891234567812345678'),
('a9900a24-d6a5-4e07-703f-a6cc0a3f3f8d', 1, 15, 54, 733, 746, 339, 286, 761, 543, 35.74, 70.52, 'Verettetsa', 'Gorzocoski', '2014-11-28', '2004-12-25 13:12:55', 'e37a0037098fcba34d18'),
('1364f7ed-4cf3-49dc-e037-d66bec5aafc8', 0, 21, 43, 755, 806, 602, 303, 737, 910, 21.35, 91.23, 'Linato', 'Amick', '2007-11-23', '2007-01-07 07:59:37', 'b434a7e834dd40882895'),
('8a1f13f6-9d42-4f8c-a845-5cc49a1492e5', 0, 22, 81, 191, 546, 455, 110, 66, 629, 94.68, 30.97, 'Icochaab', 'Reitlingshoefer', '2013-01-10', '2010-09-05 07:24:17', 'af0b2d9e8074aaa16a7c'),
('81bd10f1-bd55-486d-d7a7-9aaa0c3c6347', 0, 25, 48, 844, 30, 469, 766, 368, 572, 20.68, 92.25, 'Rebecca', 'Yenilmez', '2004-03-13', '2000-04-23 17:13:52', '36a92d1cbcaedb3554b4'),
('a3e07b68-e081-41fa-fb12-8699bccfbe23', 0, 70, 24, 285, 363, 159, 283, 908, 223, 56.31, 17.28, 'Orcovo', 'Gasparotto', '2003-02-04', '2012-02-27 05:35:09', '72f48966de6310b78bd2'),
('54096725-ec0d-4614-d475-d170ad4003f3', 1, 79, 26, 4, 998, 702, 284, 296, 894, 30.37, 27.52, 'Icheragemba', 'Arnon', '2000-10-21', '2007-12-20 22:15:51', 'ca83e58a2b00431b95ad'),
('4a5cd0f1-eed8-4e17-1580-bb9cb51c4763', 1, 57, 70, 330, 846, 82, 862, 8, 422, 12.59, 96.35, 'Mulecsni', 'Keitel', '2004-01-25', '2004-07-11 00:42:16', 'ecddba52ba846e1704fd'),
('41594b42-191c-49df-58cd-c0f60a0f773e', 0, 12, 16, 199, 716, 1000, 805, 298, 202, 30.15, 53.48, 'Opehineera', 'Dolson', '2014-07-13', '2003-04-16 02:16:16', 'df11bb84955cc6cd8acd'),
('8ebfb2fa-35ea-477e-48dc-9ea82e0b9db3', 1, 100, 39, 511, 665, 577, 517, 688, 892, 25.1, 45.97, 'Inyardi', 'Sohota', '2009-05-17', '2015-03-07 13:07:08', '93014dbed0cd51ab7cec');

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
(3365564148586828553, '499ef008-6822-4474-dca0-75836093ccde', 'Fedyk', 87, 'Enchantment which wondrously reminded him became unbearable, tales and kept my clothes on earth, nevertheless glad about a visitor for one another. His shoulder embraced wrapped up whether living by him, whenever embarrassment and impatiently heading no more from him.'),
(3553912058811275597, 'aa4449a0-2be6-4109-a54f-544c9aad8c39', 'Doud', 441, 'Wavered to spring of himself the pain through enlightenment. Bid his tenderness his long months passed quickly, friend now starting to leave your plan.'),
(4765225819718682886, 'c121635a-0812-4147-ea86-d82ebfc02e2f', 'Benedek', 816, 'Truly I cannot deny my many years of that, high stakes that art of blessing spoke for both. Perhaps reciprocate it he perhaps what of him, weren\'t you force him none but tell you did. Love to provide him drop by and sorrow.'),
(2336239331114161006, '13b6c30c-73e3-4726-1d86-0be284b2b1e5', 'Berrisford', 371, 'Tears he could you say and the, beautiful aren\'t satisfied a carp with sky-blue ones. Whom I called timidly fled by all people can\'t.'),
(8533319557080811804, 'f0a2baa1-ae4e-4d12-6137-cf4c7cec237e', 'Benzick', 467, 'Old could hurt you venerable teacher I knew. Isn\'t forced upon people are becoming to me, thus much interests may I searched I been, tears he put out this my own. There perhaps what makes them in and beautifully.'),
(6198039801471847043, '4f81ef29-fbf7-49d0-731e-af4769c0fada', 'Gause', 464, 'Possessions of eternity of merchandise the path. Shouldn\'t I stayed where would not come said, body full the past and your fare.');

CREATE TABLE `VALUE_DATA` (
  `Uuid` VARCHAR(36) NOT NULL, 
  `ValueId` BIGINT NULL, 
  `ValueUuid` VARCHAR(36) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `VALUE_DATA` (`Uuid`, `ValueId`, `ValueUuid`) VALUES
('b1c75e3b-f21b-4be7-a931-04c2b3287f37', 3344523601393165508, '8b04d5e3-775d-298e-7845-5efc5ca404d5'),
('0eb095e6-23f0-4957-a573-76c2a9b4cf4e', -6907789044519798771, 'a9f0e61a-137d-86aa-9db5-3465e0801612'),
('225cc580-7ccd-42b4-99d4-30704263420a', -5292141111288023615, 'dd5c8bf5-1558-ffcb-e500-7071908e9524'),
('f92660ce-bc8a-48e3-5473-b1fc97b3a7d3', -5359923222225123686, '0883a652-0e6e-b6c9-304d-cfb71034d053'),
('c08d904a-393f-4e6d-38cb-af689c2e80fc', 3553912058811275597, 'a9f0e61a-137d-86aa-9db5-3465e0801612'),
('4308eec0-7969-4e82-5402-8ae211ccdbd3', 3553912058811275597, 'a9f0e61a-137d-86aa-9db5-3465e0801612'),
('4f9a0f37-6a60-4643-8873-953facddae9d', -5292141111288023615, 'c121635a-0812-4147-ea86-d82ebfc02e2f'),
('f61372a3-e63c-4868-ba78-8fd669f485a2', -6907789044519798771, 'a9f0e61a-137d-86aa-9db5-3465e0801612'),
('145ffa1d-83f1-4720-8a53-ea13cbabc449', 2336239331114161006, '499ef008-6822-4474-dca0-75836093ccde'),
('b21cfe2a-7f4c-4607-17b9-6fd02c977d24', 3344523601393165508, '499ef008-6822-4474-dca0-75836093ccde');

ALTER TABLE `COMPOUND`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `SIMPLE`
  ADD PRIMARY KEY (`Uuid`);

ALTER TABLE `VALUE`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `VALUE_DATA`
  ADD PRIMARY KEY (`Uuid`);

