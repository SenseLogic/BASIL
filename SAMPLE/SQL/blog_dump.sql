CREATE TABLE `ARTICLE` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `SectionId` BIGINT UNSIGNED NULL, 
  `UserId` BIGINT UNSIGNED NULL, 
  `Slug` TEXT NULL, 
  `Title` TEXT NULL, 
  `Text` TEXT NULL, 
  `Image` VARCHAR( 45 ) NULL, 
  `Date` DATE NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ARTICLE` (`Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`) VALUES
(1, 2, 1, 'pearls-he-the-hidden', 'Pearls he the hidden.', 'Waiting opened mouth twitched with his path. Weren\'t you yesterday wear beautiful river he a standstill, us friend wouldn\'t we both perceived it. People to think away by annihilating his salvation, willingness delights my father\'s hut offered him.', 'kelceymo.gif', '2008-05-09'),
(2, 6, 1, 'love-seems-to-confess-that-my-hair', 'Love seems to confess that my hair.', 'Deeply when walked towards the position of age. Silently went outside of other travellers seeing it, while bowing for possessions what of unsatisfiable desire, distant target one look from all existence.', 'orsurbal.gif', '2015-08-06'),
(3, 5, 5, 'beautiful-life-his-hand', 'Beautiful life his hand.', 'I\'ll never any time in hot scent of light. Among his perfumed waters were not meet on bed, indeed was akin to those childlike person lose him, goal there yesterday and salvation by letter.', 'dameaneg.gif', '2007-12-04'),
(4, 3, 5, 'evening-and-dreary-life', 'Evening and dreary life.', 'Evening and heard its surface the solely important thing. Scent of desire and they built the glory. Against will obtain salvation as much longer, myth ran somewhere far another for two young face. Curious more then returned to dissect myself to serve.', 'isterliw.png', '2012-10-08'),
(5, 7, 2, 'we-ll-hear-my-father', 'We\'ll hear my father.', 'Purpose and washing clothes with in any other, purpose of disgust felt its meaning everything they commanded. Interrupted him still he stared into his senses.', 'riaseron.gif', '2009-07-23'),
(6, 6, 3, 'smile-those-childlike-people', 'Smile those childlike people.', 'Day informed the reached our exercises required, smart had again after having looked inside, walking in those things asked about words. Bold is present time that she found that you. Haven\'t you\'ve spoken to fill the garden.', 'ansersim.jpg', '2010-10-23'),
(7, 6, 2, 'hasn-t-it-possible-the-window-of-questions', 'Hasn\'t it possible the window of questions.', 'Scent of me asking you be dead, what\'s the shy one time out its start over, of unsatisfiable desire and river shall become silent.', 'dottievu.png', '2010-02-25'),
(8, 1, 4, 'years-ago-possibly-have-had-come-said', 'Years ago possibly have had come said.', 'Beckoned him shines a seeming contradiction is waiting, exalted one only slowly she not part with desire. Sleep he talked about me honourable one, smiling face lying in return from me.', 'damerlty.jpg', '2007-02-13'),
(9, 3, 2, 'gives-strength-and-tenderness-in-heat', 'Gives strength and tenderness in heat.', 'Shouldn\'t I not possible the bananas lying and advice, got to smash the as far too modest. Language would force him being without thinking.', 'malorylu.png', '2004-09-20'),
(10, 2, 3, 'soon-afterwards-insight-came-without-possessions', 'Soon afterwards insight came without possessions.', 'Teachings that I\'m telling me exclaimed loudly, placed two bananas lying in beautiful pleasure-garden, don\'t force you write something of rebirths. Many questions he used to occupy them.', 'gennadum.png', '2001-03-19'),
(11, 1, 3, 'it-s-a-wrong-path', 'It\'s a wrong path.', 'Early in bondage kneeling and setting over again, than learning from myself yesterday I too many voices. Enchantment which many wrinkles of rice-wine or anything.', 'aurepica.gif', '2001-02-27'),
(12, 2, 5, 'moderate-living-for-abode-had-conducted-him', 'Moderate living for abode had conducted him.', 'Mute his opinions they are searching for one dwells, exalted teachings son appeared and overcoming the oneness. Saw him linen for whatever purpose of that. Senses which you for sensual lust was thinking.', 'cupithyu.gif', '2003-02-12'),
(13, 1, 4, 'nevertheless-glad-about-that-lovers-loving-agreement-with', 'Nevertheless glad about that lovers loving agreement with.', 'Cared little once again to you like, they\'ve become also got him in contemplation washing clothes. Evening had occurred let everything died a thirsty man, entire game and be passed by any different nest.', 'carausti.jpg', '2006-07-25'),
(14, 7, 3, 'fine-food-this-from-my-thirst-any-given', 'Fine food this from my thirst any given.', 'Were often again to its ugliness here for you, finding his dormant spirit was following day. Questions but without the passion but feel his mouth.', 'isdollex.png', '2011-04-17'),
(15, 7, 4, 'questions-but-rather-many-verses-in-poverty', 'Questions but rather many verses in poverty.', 'Enjoyed his greatness only deceptively my senses, softly he hung over and penetrated by great knowledge, won\'t make offerings was filled his counterpart. World not learn it possible without words exclaimed, their goat stood at some small it so.', 'allalloq.gif', '2008-03-18');

CREATE TABLE `COMMENT` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `ArticleId` BIGINT UNSIGNED NULL, 
  `UserId` BIGINT UNSIGNED NULL, 
  `Text` TEXT NULL, 
  `DateTime` DATETIME NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `COMMENT` (`Id`, `ArticleId`, `UserId`, `Text`, `DateTime`) VALUES
(1, 1, 5, 'Same short escape of that, was in house from horror.', '2009-02-24 12:12:31'),
(2, 13, 1, 'Possessions and holiness of words, knew and horror in perfumed waters.', '2011-01-08 00:09:36'),
(3, 7, 4, 'Just woken up I not answer, hours looked over as this river farewell.', '2013-03-08 03:28:51'),
(4, 1, 1, 'Bowed touching the friend with salutations, didn\'t you should know less smart said, down before we you again. Smart had aged very much of patience.', '2002-07-24 06:54:56'),
(5, 6, 3, 'There who gambled away tens of words, has kept him it slowly walking silently. Told him smiled tiredly and effects.', '2000-05-06 09:04:00'),
(6, 2, 2, 'Be an opinion of rice is present, ferryman listened to stay with doubt. Past not give and willingly be bed, cared little boy give so much.', '2013-10-28 18:46:24'),
(7, 14, 5, 'Bid his days to worship in thinking. Let\'s practise meditation according to glance realized, propelling themselves all lacks completeness roundness oneness.', '2010-02-06 04:29:29'),
(8, 7, 2, 'Source ran without learning from foolishness, wouldn\'t you already taken away. Was happening to duties of light.', '2012-08-27 23:07:35'),
(9, 15, 2, 'Ah you never come back, said in a dark waters, shimmered reddishly in his sexuality moving. Curious people with dice while asking.', '2006-10-05 07:06:25'),
(10, 11, 4, 'Fell silent until nothing let his actions, laughed this I prefer the passenger spoke.', '2009-11-20 20:27:26'),
(11, 4, 4, 'Truly wanted to divide it tasted bitter, made it resembled another for himself. Entered a male sheep following day, others but still fighting for them.', '2010-03-01 04:21:56'),
(12, 14, 2, 'Warrior gives merchandise in memory. Simply thus alien to devour him, but suffering good he saw. Years losing and called the fisher fish.', '2012-02-15 08:49:05'),
(13, 10, 2, 'Know people across a comedy a gift, fled that therefore good things to kiss.', '2014-06-08 19:37:58'),
(14, 4, 1, 'Speaking she saw none of thoughts, entire life fading eyes his landlords business. We be indeed been thus childlike people.', '2011-12-23 07:07:20'),
(15, 8, 1, 'Way each of having been fleeting, stayed with painful fervour biting and hastiness. Name of exhaled the fire.', '2005-11-28 16:31:27'),
(16, 3, 4, 'Shall become entities and was filled with, secretly he walked again bowed touching him.', '2013-10-12 20:00:47'),
(17, 7, 4, 'Smart and knowledge that perfected one, senses if wasn\'t helping you, simply believed in former times a parable. Hasn\'t it appears to proceed swiftly along.', '2012-04-20 05:28:22'),
(18, 2, 4, 'Still admitting and at my hair. Ate his nor waiting how do this.', '2015-10-05 19:03:19'),
(19, 4, 2, 'Easily perishing things you pilgrims do it. Rarely spoke what about a right away.', '2015-09-05 15:29:13'),
(20, 3, 4, 'Should think of humans in confirmation. Greed from under my senses, soul had never satisfied with this, made when what his error.', '2002-08-06 16:33:34'),
(21, 1, 4, 'Exchanged some way against hunger, attentively perceived the run-away in everything.', '2008-05-08 17:28:29'),
(22, 7, 4, 'Full breast when my pilgrimage. This sleepless man had asked amusedly, travellers felt hope every one thing, their tough against hunger and tired.', '2014-10-23 10:57:11'),
(23, 7, 3, 'Read them shared their life as true, his slim hips and there.', '2002-12-20 11:50:33'),
(24, 15, 3, 'Forgive me joy of misery, knew nothing will begin the ultimate thirst. Owned a gap which seemed near it.', '2015-04-23 06:45:29'),
(25, 7, 1, 'This she held the order to me. Whenever it not waste words, someone is necessary nothing else.', '2008-08-01 01:53:14'),
(26, 3, 1, 'Merchant who is dangerous to capture it, wound this perfected ones a river. Putting me down before that my father.', '2006-10-07 08:31:23'),
(27, 13, 4, 'On an entire life isn\'t it. Listen up then the wrists, shall not any sleep properly again. Wants to kiss it is.', '2004-11-09 07:46:04'),
(28, 14, 3, 'Other hand over his hut farewell to, glance and obtain a thought. Thus similar he can prosper, you\'ve got there before I do.', '2002-07-28 08:26:42'),
(29, 2, 1, 'Majority of simultaneousness above glowing with this, against its secrets so right, travellers and washing his merchandise and wait.', '2014-04-28 12:20:39'),
(30, 5, 1, 'Wheel of men they got lost. Propelling themselves away by simpler means.', '2010-04-23 17:55:35');

CREATE TABLE `SECTION` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `Number` BIGINT UNSIGNED NULL, 
  `Slug` TEXT NULL, 
  `Name` VARCHAR( 45 ) NULL, 
  `Text` TEXT NULL, 
  `Image` VARCHAR( 45 ) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SECTION` (`Id`, `Number`, `Slug`, `Name`, `Text`, `Image`) VALUES
(1, 1, 'sports', 'Sports', 'Non-eternal things asked timidly fled to be alive. Silently the rig-veda being without judgement without substance, being indestructible part from most shameful life. Bold is this happened to reproach him teach them.', 'rucingto.jpg'),
(2, 2, 'gaming', 'Gaming', 'Being separated from men were able to her, walked wore the fields nobody will be. Wheel of others tell her as true, by hyaenas was inevitable inescapable was sitting here thought. Wonderful verses brown and mock the sacrifices and here.', 'brittniv.gif'),
(3, 3, 'entertainment', 'Entertainment', 'Say this hand touching his slim hips, which have teachers that he ran down his situation. Just know where from festering wounds dripped from suffering.', 'letertse.gif'),
(4, 4, 'science', 'Science', 'I\'ll give you that has taken away. Monk and monks on wherever because I do. Turned gray for its midst of the.', 'onnabeni.jpg'),
(5, 5, 'history', 'History', 'Clothes which his friend\'s face the visible, hut and disbelievers said this bright robe with desire. Shouldn\'t I saw all this these reports, yoga-veda shall please you said if you\'re on shoulder. Meditation he wrestled in blissfulness did you just consider.', 'velissle.png'),
(6, 6, 'travel', 'Travel', 'Wheel once said then speak a whisper. Let me away out business-affairs they do right, must not really found that he said. Near perfection before his other loving another person\'s life. Smile shone or mask was rolling about words.', 'hamepfeu.jpg'),
(7, 7, 'finance', 'Finance', 'You\'ve heard their way as novices taken his course. Daily in himself mocking himself mocking me to her. Went outside and joy without fear and beautifully, childlike face there with grief boiled over again. Offerings was standing here how everything for quite right.', 'eesmalos.jpg');

CREATE TABLE `SUBSCRIBER` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `Name` VARCHAR( 45 ) NULL, 
  `Email` VARCHAR( 45 ) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SUBSCRIBER` (`Id`, `Name`, `Email`) VALUES
(1, 'Degan', 'bodo.hilberman@hotmail.com'),
(2, 'Padgett', 'lorinda.vickers@outlook.com'),
(3, 'Vanneste', 'franza.pashmineh@outlook.com'),
(4, 'Grauer', 'lee.fleuchaus@live.com'),
(5, 'Alperovich', 'adelaida.mccusker@outlook.com');

CREATE TABLE `USER` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `FirstName` VARCHAR( 45 ) NULL, 
  `LastName` VARCHAR( 45 ) NULL, 
  `Email` VARCHAR( 45 ) NULL, 
  `Pseudonym` VARCHAR( 45 ) NULL, 
  `Password` VARCHAR( 45 ) NULL, 
  `Phone` VARCHAR( 45 ) NULL, 
  `Street` TEXT NULL, 
  `City` VARCHAR( 45 ) NULL, 
  `Code` VARCHAR( 45 ) NULL, 
  `Region` VARCHAR( 45 ) NULL, 
  `Country` VARCHAR( 45 ) NULL, 
  `Company` VARCHAR( 45 ) NULL, 
  `ItIsAdministrator` TINYINT UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `USER` (`Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`) VALUES
(1, 'Rick', 'Deckard', 'rick.deckard@mail.com', 'rick.deckard', 'b-263-54', '+66 604 681 349', 'Mannion Lane', 'Titusville', '6680', 'Arizona', 'Panama', 'Dendi Security', 1),
(2, 'Rachael', 'Tyrell', 'rachael.tyrell@outlook.com', 'rachael.tyrell', 'nexus-7', '+40 627 291 171', 'Lightfoot Boulevard', 'Clay', '2097', 'Michigan', 'New Zealand', 'Menzies Club', 0),
(3, 'Arthur', 'Dent', 'arthur.dent@gmail.com', 'arthur.dent', '42', '+35 102 880 323', 'Otoole Street', 'New Canton', '3917', 'Maine', 'United Arab Emirates', 'Vempati Associates', 0),
(4, 'Loree', 'Byrgesen', 'loree.byrgesen@yahoo.com', 'loreebyrgesen', '0tiLm.mip', '+34 705 190 510', 'Pichocki Lane', 'Point Pleasant', '7302', 'Kansas', 'South Sudan', 'Quinn Online', 0),
(5, 'Gama', 'Venguswamy', 'gama.venguswamy@mail.com', 'gamavenguswamy', 'Tg9oly:', '+59 388 444 312', 'Helstab Boulevard', 'Canal Fulton', '4515', 'Yukon', 'Kuwait', 'Simms Team', 1);

ALTER TABLE `ARTICLE`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `COMMENT`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `SECTION`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `SUBSCRIBER`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `USER`
  ADD PRIMARY KEY (`Id`);
