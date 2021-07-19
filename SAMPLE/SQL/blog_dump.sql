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
(1, 3, 3, 'put-out-there-collapsed-and-merged-with-sadness', 'Put out there collapsed and merged with sadness.', 'Wheel once he after a wise one. Consciousness thus strongly living according to have observed him, false god when there still thus strongly and said. Distorted her garden and power he talked incessantly hit, same second time at our boat recognised it is.', 'ganenthi.gif', '2008-07-02'),
(2, 4, 4, 'nevertheless-glad-about-me-without-seeing-it', 'Nevertheless glad about me without seeing it.', 'Among strangers and regained his sexuality moving, learned wisdom from long hair on shoulder, proper it go as your son\'s upbringing. Warrior gives merchandise and hesitantly he felt.', 'adotaniu.png', '2012-12-24'),
(3, 1, 3, 'latter-had-pointed-him-back-inside', 'Latter had pointed him back inside.', 'Stood for several days by four or anything. Name the spring of questions but words, business he openly turned gray hairs among so clearly.', 'beromaby.gif', '2006-06-22'),
(4, 2, 2, 'walking-in-nothingness-stayed-the-joys-and-inwardly', 'Walking in nothingness stayed the joys and inwardly.', 'Will die ten times always good star of despair, venerable father his perfumed hair with love she admitted. Speak and quietly looked up felt nothing. Entered for permission my body to help you hear.', 'refimasy.gif', '2007-11-11'),
(5, 7, 4, 'else-might-easily-perishing-things-asked-timidly', 'Else might easily perishing things asked timidly.', 'Reached the stream a hidden smile quietly lamented quietly. Exclaimed if it away out from it, his course to his shoulder with it. Looking up from these days I\'ve also do. Good just standing here remember something on bed.', 'sauledde.png', '2015-03-24'),
(6, 5, 1, 'him-brightly-under-their-fearfulness', 'Him brightly under their fearfulness.', 'Beautiful or for ever saw song-bird in confirmation, I\'m travelling conducting wars suffering had laughed. Me their acts also by name the rice-field.', 'ielkemet.jpg', '2002-03-11'),
(7, 5, 5, 'takes-everyone-had-brought-him-asleep', 'Takes everyone had brought him asleep.', 'You\'ll see beloved the moment he ate his teachings, beautiful sir always existed in many worries, have deprive poisoned tortured myself alone like him. Young walking through her gifts for three years.', 'ighurtub.png', '2008-09-23'),
(8, 3, 4, 'quietly-and-suffering-searching-still-a', 'Quietly and suffering searching still a.', 'Broke loose embraced the depth of that goal, walked the runaway son with was following him safe. Remained as profitable if he is but just listening, source a bottomless pit him committed your river. Stayed for guests to have looked over her suffering.', 'ichuccip.png', '2005-01-25'),
(9, 2, 5, 'sun-again-now-suffered-the-glory', 'Sun again now suffered the glory.', 'Ablutions the head being served food this time, walking silently his opinions and to avoid evil. More how once again returned into him sad.', 'kimberli.jpg', '2006-12-10'),
(10, 6, 4, 'not-always-move-on-foot', 'Not always move on foot.', 'Enchantment which teacher the run-away in agreement with, mumbled a line which seems I not know. Followed it away neither meat nor consciousness, with grief since in fact that secret of.', 'ittickal.jpg', '2009-04-03'),
(11, 1, 3, 'stood-there-ever-would-watch-a-great', 'Stood there ever would watch a great.', 'Apparently he realized this seems I envy at him. Say this whole world thus new oar, seeing monks used the realisation the wrinkles and passion. Salvation by them fading away time loses its voice, told the harvest of desires were accepted a path.', 'inegalum.png', '2007-08-07'),
(12, 7, 2, 'left-and-lazy-official-in-on-this-world', 'Left and lazy official in on this world.', 'Fell silent war or whether time out from death. Let run along in living with two of enlightenment. Teachings and cavities in long sequence of love. Don\'t know I\'ve never listened with it, goal he lay there was knowledgeable of thirst.', 'ieneloud.png', '2001-12-28'),
(13, 3, 2, 'deeply-than-offerings-for-him', 'Deeply than offerings for him.', 'Or wherever because we learn precisely of grass, learned this be charged on loaned money. My destiny upon yourself away nobody knew infinitely meaningless.', 'ernorvan.jpg', '2008-12-03'),
(14, 5, 5, 'truly-right-to-my-glance-pleases-the-work', 'Truly right to my glance pleases the work.', 'Afterwards when buying bananas lying in your servant, won\'t feel life you my back inside, wouldn\'t like this game occupied his teachings.', 'arcamshe.png', '2006-03-21'),
(15, 7, 3, 'farewell-river-nothing-is-full', 'Farewell river nothing is full.', 'Ablutions the fragrant he in my cousin in. Monks of service before any other people\'s bread, she\'ll die mortal was carrion was shining back inside.', 'shorwany.jpg', '2003-09-16');

CREATE TABLE `COMMENT` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `ArticleId` BIGINT UNSIGNED NULL, 
  `UserId` BIGINT UNSIGNED NULL, 
  `Text` TEXT NULL, 
  `DateTime` DATETIME NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `COMMENT` (`Id`, `ArticleId`, `UserId`, `Text`, `DateTime`) VALUES
(1, 14, 5, 'Fully understanding what your work, which his venerable teachings passed by many. Lovely couldn\'t you must refuse, ah most base of sleep.', '2006-03-20 16:48:09'),
(2, 12, 5, 'Go on account of mockingly laughing gods, has stopped by giving me, sleep in charge of enlightenment. Laughed it back and peace.', '2000-06-24 05:38:48'),
(3, 12, 3, 'Thinking that is proud and felt it. Better than obey think spoke I been.', '2008-05-07 02:58:31'),
(4, 9, 5, 'Gives me the visible in poverty. Sounded full breast when bored by scolding. Which have followed the old in everything, different from foolishness used to.', '2007-06-01 06:23:29'),
(5, 3, 3, 'Now sensing his fists and tenacity, came over drifted through life, perhaps not scorn the more no time.', '2008-06-23 21:39:39'),
(6, 3, 1, 'Against an untouchable peace expressed in heat, wondrous it must not know.', '2013-11-04 05:20:01'),
(7, 14, 1, 'Any noise a monk stopped, kindly he lets himself tending towards death. Leapt in the penitents how rejecting, walked the vessel was simultaneous and said.', '2009-07-10 19:26:35'),
(8, 12, 5, 'Whom had halted the teachings, whenever he handed to experience, don\'t I not comprehend any further.', '2007-11-27 16:28:54'),
(9, 9, 2, 'Leapt in you planning to walk, you\'ve now began asked to relieve suffering. Waiting having no such hair, come and grab him was dead.', '2009-05-21 04:21:12'),
(10, 3, 5, 'Before this spirituality his spot. Afterwards insight but solely important thing, after a goal is your heart. Bent down and your child.', '2007-04-11 00:01:20'),
(11, 11, 2, 'Then I told him disregard him. Farewell from burdening himself all distress, spoke slowly lose a basket, sat for many like me.', '2005-03-05 15:28:21'),
(12, 9, 1, 'And duties of sounded sweet, near which keep you need. Whispered a who is fasting.', '2003-12-21 00:33:10'),
(13, 1, 5, 'To die mortal was listening to read, wisdom always like good being seen, this yellow robes under the fire. Will return was shimmering in confirmation.', '2004-02-17 23:51:07'),
(14, 6, 5, 'Enchantment which seemed tall and don\'t I, man I might oppose this. Sat down right so be proven. Made yesterday of among the.', '2000-02-06 13:51:46'),
(15, 6, 5, 'Walked on up to friend, non-eternal things we find peace.', '2015-07-16 20:40:07'),
(16, 5, 1, 'Though in himself of him. Lust in poverty and pleasantly, else he realized the cycle. Old loincloth and can think so.', '2014-01-17 13:11:12'),
(17, 2, 1, 'Cannot love it now shadow. Fully understanding it like you need.', '2013-08-27 19:32:34'),
(18, 4, 5, 'Failed to expect the current, boat for yours you\'ll see, himself who kept my hut could accept.', '2013-04-02 23:52:49'),
(19, 2, 1, 'You\'ve now that you\'ve become his hand, touched and it also die. You\'re seeing how much and rested, your keen eyes you\'re exclaimed will see.', '2004-11-18 03:02:30'),
(20, 15, 3, 'Nothing standing at he thought, cannot be ferried back and washing clothes. Enjoyed his birth magic flowed through enlightenment.', '2002-08-07 22:45:43'),
(21, 1, 1, 'Watched it possible without me. Clothes with them without clothes on gods. You\'ve thought sprang forth from you.', '2001-07-20 10:28:27'),
(22, 11, 1, 'Arriving at head differently the fire, followed the self that love a reality. Held the traveller after our foolishness, wouldn\'t take anything new rules.', '2000-10-22 17:23:25'),
(23, 9, 2, 'Passed through him conducted him, friend unstoppable like my many so much.', '2009-06-27 23:22:22'),
(24, 2, 4, 'Meditation was a drink for yours, been abused or foolish world.', '2007-09-27 03:04:28'),
(25, 12, 5, 'Accustomed to the smashing to him, sadness and ultimate part of him. Out into the community of sounded strange.', '2009-07-03 20:57:37'),
(26, 2, 5, 'Wants to anybody or broken an error. With high on this incarnation, fell silent love them too. Thanked him into her side to him.', '2012-10-15 16:38:32'),
(27, 3, 5, 'Than an angry with them all, soul slipped towards perfection and spoke.', '2014-11-07 23:26:13'),
(28, 6, 3, 'Goal each one blow of this. Nodded brushed his mockery some more question.', '2013-08-28 16:04:41'),
(29, 13, 4, 'Felt this night turned round in hut, always one this often with defamation. Business and half of it.', '2012-03-14 06:21:17'),
(30, 12, 5, 'Day held a fleeting pleasure, greeted one thing great respect. Spared him ran incessantly hit him. Putting himself by words exclaimed.', '2015-07-10 23:02:18');

CREATE TABLE `SECTION` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `Number` BIGINT UNSIGNED NULL, 
  `Slug` TEXT NULL, 
  `Name` VARCHAR( 45 ) NULL, 
  `Text` TEXT NULL, 
  `Image` VARCHAR( 45 ) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SECTION` (`Id`, `Number`, `Slug`, `Name`, `Text`, `Image`) VALUES
(1, 1, 'sports', 'Sports', 'Bid him solely important thing great thinkers do. Urged him against will begin my pilgrimage, behold here collected and bees had aged and forgetfulness.', 'imbledan.jpg'),
(2, 2, 'gaming', 'Gaming', 'Then threw it often I\'ll be blissful, death that time of reflection of rebirths, thinking he already half gray hairs among so long. Owned a perfected was heading for twenty-eight days, harmony knowledge this repetition this contradiction a drunkard.', 'enginala.jpg'),
(3, 3, 'entertainment', 'Entertainment', 'May be taken refuge to it like you, so leave all lacks completeness roundness oneness. Do not depending on slender legs greeting you.', 'offerfim.jpg'),
(4, 4, 'science', 'Science', 'That evil and cramps of wishing empty he dreamt, bad whether a happy have experienced suffering for finding, is for some time they lay hidden.', 'iscanneu.jpg'),
(5, 5, 'history', 'History', 'Another had made yesterday wear many worries, entered a shipment of taking becomes one without distrust. This both when every hour my pouch, lacked all a fateful circle is becoming a. Enchantment which these were offerings was deeply he asked.', 'okeknece.jpg'),
(6, 6, 'travel', 'Travel', 'Touched arm and learned harder on it, bent down his city-house he searches for yours. A desire of desire an ascetic and illusion.', 'cunarsag.jpg'),
(7, 7, 'finance', 'Finance', 'Takes everyone different life as such jokes. Gives me excellent but that you\'re right away, gave one might my path even closer, suddenly woke up just ready and said. Thoughts thus soul which contained in kissing which was.', 'onstitse.png');

CREATE TABLE `SUBSCRIBER` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `Name` VARCHAR( 45 ) NULL, 
  `Email` VARCHAR( 45 ) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SUBSCRIBER` (`Id`, `Name`, `Email`) VALUES
(1, 'Fluney', 'ysabel.conway@mail.com'),
(2, 'Fleishman', 'hartley.zuk@hotmail.com'),
(3, 'Abernathy', 'xenia.mcmonagle@yahoo.com'),
(4, 'Abella', 'alora.cividino@yahoo.com'),
(5, 'Khezri', 'nerta.cuthill@live.com');

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
(1, 'Rick', 'Deckard', 'rick.deckard@mail.com', 'rick.deckard', 'b-263-54', '+40 879 613 942', 'Patacki Court', 'Anthonyville', '1551', 'New Mexico', 'Canada', 'Forno Center', 1),
(2, 'Rachael', 'Tyrell', 'rachael.tyrell@outlook.com', 'rachael.tyrell', 'nexus-7', '+75 351 514 396', 'Cadtools Park', 'Montgomery', '6097', 'Yukon', 'East Timor', 'Howald Online', 0),
(3, 'Arthur', 'Dent', 'arthur.dent@gmail.com', 'arthur.dent', '42', '+33 305 153 991', 'Millar Alley', 'Manasquan', '5986', 'Delaware', 'Norway', 'Beilin Fx', 0),
(4, 'Virginia', 'Lillis', 'virginia.lillis@live.com', 'virginialillis', 'B7esrome@r', '+75 487 134 147', 'Formagie Boulevard', 'Ludden', '4698', 'Georgia', 'Grenada', 'Moreno Depot', 1),
(5, 'Vito', 'Gajowiak', 'vito.gajowiak@mail.com', 'vitogajowiak', 'eryRc&ke1ly', '+56 121 352 839', 'Layne Drive', 'Oglesby', '3041', 'Colorado', 'Malaysia', 'Tsai Studio', 0);

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
