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
(1, 5, 4, 'image-and-no-oar-and-life-that-line', 'Image and no oar and life that line.', 'A pilgrim myself that supple willingness delights my glance, wants to such trifles to walk on. Senses he loved any given me yet, if ten years simply believed in secrets. Once told the gate sat firmly concentrated.', 'geraende.jpg', '2007-06-28'),
(2, 3, 3, 'up-to-their-law-of-a', 'Up to their law of a.', 'Them up with desire is his chest, wisdom that she called timidly for so venerable one. Black hair like being seen came without an error.', 'ingebour.jpg', '2010-04-12'),
(3, 6, 1, 'straightened-up-just-know-people-own', 'Straightened up just know people own.', 'Glance pleases the woman who at her about you, being served food even now is better. Lust for a time mortal was the evening\'s ablution.', 'kaniadon.png', '2001-11-04'),
(4, 1, 1, 'accustomed-to-wait-if-wasn-t-helping-you', 'Accustomed to wait if wasn\'t helping you.', 'Goal stood the beats in you mean, touched shoulder embraced once and inside and here thought. But in living strongly living joy of him.', 'ichilciu.jpg', '2001-08-23'),
(5, 7, 5, 'their-refuge-with-contracted-pupils-begging-ones', 'Their refuge with contracted pupils begging ones.', 'To it together all dependencies by him. Entire path are they have the wish of thirst, even he hoped to side to himself. His being afraid of how much sin. More of in many austere and ate the uncertain.', 'markuseu.png', '2005-06-17'),
(6, 7, 3, 'which-today-already-learning', 'Which today already learning.', 'Who revel in loops perhaps it to us. Held a invited me with your words behind him, you\'ll again disgust which there young face.', 'ligorzic.png', '2012-10-19'),
(7, 4, 3, 'sinner-which-the-ascetics-nor-self-castigation-so-good', 'Sinner which the ascetics nor self-castigation so good.', 'Loudly and spoke for example hadn\'t been strange. Senses were brothers their transitoriness in fine clothes, deep sleep he searches for possession and lazy.', 'arleerab.png', '2008-12-26'),
(8, 1, 5, 'nevertheless-broken-both-masters-of-these-teachings', 'Nevertheless broken both masters of these teachings.', 'Didn\'t you make you write the pike stirred up, these verses too many to spare your son\'s upbringing. They\'ve become great urge to beautiful learned nothing, he\'s strong the night\'s last hut were a man.', 'acejorau.gif', '2003-10-23'),
(9, 3, 4, 'teachings-to-satisfy-his-suffering', 'Teachings to satisfy his suffering.', 'Indignation is near it turned black snake was broken, bent down in circles we won\'t for riches. Day shone always good fortune is waiting, I\'ve lost a passionately painful confession of oneness, exalted spoke the cistern the evening\'s ablution.', 'agulliny.png', '2002-01-10'),
(10, 2, 1, 'fully-become-rich-people-can-t', 'Fully become rich people can\'t.', 'I\'m losing high bright robe bearing these verses, I would advise me down before that teachings, late at the pestilence and angry and stupid. Many secrets so said who walked through her eyelids.', 'asnevero.gif', '2014-02-04'),
(11, 5, 5, 'long-sequence-of-such-hair', 'Long sequence of such hair.', 'Someone always thinks of faces rested flowed on foot, stone by sex by them he dreamed this. Loudly clapped her cheek turned back inside of the.', 'soubeppy.gif', '2007-10-10'),
(12, 4, 3, 'that-kind-his-death-the-salvation', 'That kind his death the salvation.', 'Pleasure and stupid are so clear voice, son with much longer used the gods. Tales and casually as animals too much. Enchantment which might not satisfied from old man, saw people whose smile quietly looked back inside.', 'earlekur.jpg', '2010-09-12'),
(13, 7, 1, 'better-teachings-are-some-gamblers-with-him', 'Better teachings are some gamblers with him.', 'Body this time of everything shown everything the sleep, consciousness the soul had slightly weak at the bank. Understood them quickly I couldn\'t recognise him.', 'odelebob.png', '2008-07-07'),
(14, 3, 4, 'touched-a-syllable-which-contained-in-your-child', 'Touched a syllable which contained in your child.', 'Whenever they crossed a daze he thought, to draw some moments a meaning was necessary. Carefully he possessed so affectionately to do nothing else, gave advice but without possession his business-deals with defamation. You\'ll hear my speech not let his advice.', 'oskellab.jpg', '2004-05-12'),
(15, 2, 4, 'distorted-from-community-were-one-the-heron-s-death', 'Distorted from community were one the heron\'s death.', 'Wonderful sleep nor young man went on foot. Knew deep in perfect equanimity his actions, river who walked through him by he stopped suffering. Won\'t for watching waited for twenty-eight days.', 'alainelu.jpg', '2005-10-21');

CREATE TABLE `COMMENT` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `ArticleId` BIGINT UNSIGNED NULL, 
  `UserId` BIGINT UNSIGNED NULL, 
  `Text` TEXT NULL, 
  `DateTime` DATETIME NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `COMMENT` (`Id`, `ArticleId`, `UserId`, `Text`, `DateTime`) VALUES
(1, 15, 2, 'Stopped on new something cooked rice, himself down and no goal. Nothing when woke up impetuously hunting. She him at he replied.', '2000-08-20 03:36:11'),
(2, 4, 5, 'Let them too learn this, at your wondrous words sound of misery, pearls he continued but that with dice.', '2004-06-23 17:55:31'),
(3, 12, 3, 'Truly searching man walking silently, sacrifices and grief since then, even a dice-gambler the deep sleep. Felt nothing will return was you.', '2004-06-20 06:56:53'),
(4, 1, 2, 'Who told about what shines a teacher, daily at a smile with great secret.', '2008-08-16 16:13:07'),
(5, 5, 3, 'Warrior gives strength his trip, one day\'s journey away out badly. No daemons there he share his way.', '2015-09-21 13:21:39'),
(6, 10, 3, 'Softly and mountains which these things, will enter the father thinking the pilgrim. Opened the year after the business, of sloth and fears the poison.', '2012-08-12 22:56:11'),
(7, 9, 4, 'Ah you may see him, were of talk about you.', '2005-12-22 18:13:58'),
(8, 1, 4, 'Straightened up strong hunger taught him dead, I\'m asking to enlightenment it my brothers.', '2000-12-18 23:08:38'),
(9, 15, 2, 'Made a lack clothes are and beggar, down next morning a pilgrimage, you\'ll soon he left in poverty.', '2012-12-25 14:08:49'),
(10, 8, 3, 'Even he as it out, clothes fine oil in words. Had heard them found to lose him.', '2001-04-25 23:29:08'),
(11, 14, 1, 'Previous lives the verses in heat. I\'ll stop him like this, occasionally dreaming at our foolishness. I called himself a resolution.', '2004-01-08 21:42:15'),
(12, 1, 4, 'Wondrous teachings you\'ve become his bread, you\'re stronger than others more to live. Sir always led through so good.', '2012-07-04 17:56:55'),
(13, 4, 2, 'Possessions of two old in you. Conducted him don\'t find a man.', '2003-12-07 02:01:31'),
(14, 3, 4, 'There always expect the hours looked inside, look every child could tell. Speak a jaguar and your indulgence. Many things have their transitoriness in him.', '2005-11-22 07:31:42'),
(15, 10, 5, 'Deaf and holy source of this, exclaimed indignantly but just listening.', '2002-05-20 09:06:29'),
(16, 13, 5, 'Won\'t and slept in secrets. Often I shall find could tell, before a woman again I thought.', '2014-08-20 05:37:30'),
(17, 4, 4, 'Flesh waned from her mistress\'s ear, wanted to those moments a dream.', '2002-08-21 16:11:24'),
(18, 2, 3, 'Down before seen this further, awakened I have admired you. Bad people are smart brown, people like them as well.', '2009-08-17 13:20:28'),
(19, 7, 5, 'For telling me for him, ah most hurriedly walking along. Speaking still remained forever that you.', '2004-08-24 03:24:56'),
(20, 15, 4, 'I\'m fighting for a saint. He owned a bow down by him, at bottom already standing in ear. Anxiety in motion will not know.', '2002-09-08 22:57:52'),
(21, 11, 3, 'Mumbled a source in my thoughts. Passed on all elements of this birth.', '2013-02-23 18:56:28'),
(22, 11, 2, 'Venerable father realized that time, does not bear any will receive thanks.', '2014-12-01 09:57:05'),
(23, 11, 1, 'Even fish jumped in everything, wondrous detours it out and shameful life. With was willing to destroy himself.', '2012-05-23 16:03:48'),
(24, 3, 2, 'Never one-sided which a father, slowly walking on chance not died, conducted him alone in it.', '2013-03-07 20:36:14'),
(25, 13, 3, 'Himself appeared and gathered his ear, will study and best thought since then.', '2002-12-21 13:26:23'),
(26, 5, 5, 'Willingness my cousin in this objection, indignation is good he speak. Once as it laughed clearly. Shimmered reddishly in perfect in such jokes.', '2007-06-04 16:36:30'),
(27, 6, 1, 'Times always led into deception called upon, since those feats to speak, listened up gave copper-coins to remember this.', '2003-12-01 03:24:09'),
(28, 2, 4, 'Other one spoke his arms folded, full height when buying bananas.', '2002-12-10 20:45:43'),
(29, 14, 5, 'Someone might easily thus childlike people, occasionally they used to attach to die, don\'t know what you\'re seeing that obstacle. Knew more fell silent for me.', '2002-12-24 22:53:33'),
(30, 12, 5, 'Had dreamt of just too modest, your exalted one whose voice sounded sweet. Even better opinion of oneness.', '2009-02-06 17:15:07');

CREATE TABLE `SECTION` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `Number` BIGINT UNSIGNED NULL, 
  `Slug` TEXT NULL, 
  `Name` VARCHAR( 45 ) NULL, 
  `Text` TEXT NULL, 
  `Image` VARCHAR( 45 ) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SECTION` (`Id`, `Number`, `Slug`, `Name`, `Text`, `Image`) VALUES
(1, 1, 'sports', 'Sports', 'Day before him if once seen me. Rose stepped forward once said but salvation as `learning\', anxiety in silence for sale welcome my hair. Cared little pleasures of dice the advice received advice.', 'mulerrek.png'),
(2, 2, 'gaming', 'Gaming', 'Fled today how still had given upper garments. If there thus this as clearly his impending death. Among his worldly and clear voice talking about it. Black hair like to nurse him very reason why.', 'igharede.png'),
(3, 3, 'entertainment', 'Entertainment', 'Hasn\'t it hurrying suffering a sound reached them, among carters and laughed and this hour. Glance with fear he fasted for them, business he chose I asked to sleep.', 'celiawit.gif'),
(4, 4, 'science', 'Science', 'People can after midnight being alive after year, did his farewell from our business was awaiting you. Everything that love of inhaling of pondering, senses bring him with verses all perceived it.', 'naudinaf.gif'),
(5, 5, 'history', 'History', 'Always good is left me to come said quietly. Whispered a fish costs and ultimate part, whenever embarrassment and essence of quiet the oneness.', 'itkannes.jpg'),
(6, 6, 'travel', 'Travel', 'Purpose of being astonished like stars beautiful pleasure-garden, thinking his way delicious or in confirmation. Could win his tenderness his bowl of rebirths.', 'basillyl.png'),
(7, 7, 'finance', 'Finance', 'Any specific intention regarded as animals of sloth, say friend just slowly lose its own soul. Said to save him across a garden, entered for about money filled her friend. Language would you believe out and denial.', 'ersipemo.png');

CREATE TABLE `SUBSCRIBER` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `Name` VARCHAR( 45 ) NULL, 
  `Email` VARCHAR( 45 ) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SUBSCRIBER` (`Id`, `Name`, `Email`) VALUES
(1, 'Racz', 'charlie.buckley@mail.com'),
(2, 'Dao', 'nikky.aboussouan@hotmail.com'),
(3, 'Ludwick', 'aubry.shafik@live.com'),
(4, 'Caputo', 'derek.vanlaten@outlook.com'),
(5, 'Mciver', 'kakalina.milakovic@hotmail.com');

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
(1, 'Rick', 'Deckard', 'rick.deckard@mail.com', 'rick.deckard', 'b-263-54', '+82 132 750 584', 'Cline Drive', 'Cedar Fort', '5322', 'Massachusetts', 'Namibia', 'Boutilier Logic', 1),
(2, 'Rachael', 'Tyrell', 'rachael.tyrell@outlook.com', 'rachael.tyrell', 'nexus-7', '+23 253 376 566', 'Aston Alley', 'Kure Beach', '8751', 'Ontario', 'Samoa', 'Adcox Channel', 0),
(3, 'Arthur', 'Dent', 'arthur.dent@gmail.com', 'arthur.dent', '42', '+38 277 633 717', 'Collins Drive', 'Sky Londa', '6866', 'Montana', 'Kyrgyzstan', 'Chagnon Consulting', 0),
(4, 'Ramaprakash', 'Jong', 'ramaprakash.jong@outlook.com', 'ramaprakashjong', 'ae1nn*lowR', '+17 846 576 607', 'Milakovic Alley', 'Clarkson Valley', '8323', 'North Carolina', 'Philippines', 'Kiefer Point', 1),
(5, 'Cheeyin', 'Sargent', 'cheeyin.sargent@outlook.com', 'cheeyinsargent', 'ennargO5!os', '+61 938 836 872', 'Nicandro Alley', 'Port William', '4911', 'Nunavut', 'Macau', 'Potter Depot', 0);

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

