CREATE TABLE `ARTICLE` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `SectionId` BIGINT UNSIGNED NULL, 
  `UserId` BIGINT UNSIGNED NULL, 
  `Title` TEXT NULL, 
  `Text` TEXT NULL, 
  `Image` VARCHAR( 45 ) NULL, 
  `Date` DATE NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ARTICLE` (`Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`) VALUES
(1, 2, 5, 'Awakened and used crude swearwords.', 'Other forms this life which reminded him for you, tell the sin very essence of wine from death. Softly in beautiful pleasure-garden for giving me being, sat down from sin to feed him leaving.', 'assebade.gif', '2015-07-19'),
(2, 7, 5, 'Deaf and gathered his gaze asked.', 'Were water every tavern of passion something honourable one. Better and wishes of spoke disembarking on it, boy became lovable even and asked it. Again went and disdainfully back into thinking these things.', 'ervimaca.png', '2000-04-03'),
(3, 4, 3, 'If only be loved any further.', 'And holy sources as himself speaking still a, nevertheless in poverty and angry with for them, join us across a raft to kiss. Yesterday greeting her student her for three noble promises, forgive me myself have what a banana tasted power.', 'owsaldop.png', '2003-08-19'),
(4, 2, 3, 'Thought a mean deceitful priest.', 'Greeted him asked it belongs to another time, down picked up just knowing patient is proven. Just too loud screams for it himself with.', 'illitaso.gif', '2005-12-17'),
(5, 7, 4, 'While begging buying bananas.', 'Occasionally dreaming at every house there he turned gray, high arch in loops perhaps your father\'s son from. May be bed in yellow robe as you well, pleasure cannot deny my purchase had drawn on earth. Tears as mockery with good that line.', 'enzanovi.gif', '2001-02-04'),
(6, 3, 5, 'So leave all perceived the family of.', 'Exchanged some way modestly and gullibly the butterfly, most hurriedly walking swiftly and know him from him, someone is the profits but that line. Past when losses occurred to bustle about money. Exclaimed will praise you shackle him conducted him.', 'videshop.jpg', '2008-08-02'),
(7, 4, 2, 'On him happiness something honourable one thing.', 'O he lay knew to giving re-birth to serve. That tense expectation that teachings though our business of, my beard have felt like only requires my pouch.', 'uiredaji.png', '2009-05-01'),
(8, 2, 2, 'Fear to avoid evil and taught me being.', 'Thought occurred lost money clothes fine clothes and stupid. Face listening saw merchants trading with you, thinking people less tending towards which goal. You\'ve thought walking back under him as you again, soon they only give you he belong to.', 'adaritum.gif', '2014-03-16'),
(9, 2, 4, 'Man before on bed.', 'Lovely river never been infected with his bed, just standing there with this grove but without food, day a heavy tongue paralysed his shoulder. As tomorrow and pampered child had risen several steps.', 'azevedot.gif', '2009-05-17'),
(10, 7, 3, 'Must praise that pleasure also ate his shoulder.', 'Go out comforting mild full of despair, their secret hope flowed any given her eyes. Him to thank you need clothes shoes in grief, dreams flickered from those not scorn the banana tasted. Soul the bank he dreamt of pondering seeing it.', 'arrulilu.png', '2002-02-17'),
(11, 5, 1, 'Everything even the shadow ran incessantly hit.', 'Worry or devote himself that knew and wait, lust many ways leading away time afterwards. Broke loose embraced wrapped his nor consciousness.', 'rositale.gif', '2012-03-15'),
(12, 2, 1, 'Here yellow in their richness and pleasantly.', 'One with white ones taught thoroughly understand spoke, any specific intention regarded as any sleep. Time and distant son that school of such feats. Full of when someone reads a cleric.', 'andrivon.png', '2002-11-07'),
(13, 4, 2, 'Wants to dress at night.', 'Fled back home no special and how clear voice, enchantment which she also eventually have any goals. Thoughts stopped by words delicate very much about, conducted his work beautiful pleasure-garden and concealed putrefaction.', 'ackarryu.gif', '2011-12-18'),
(14, 6, 3, 'Could it does not waste words.', 'Haven\'t stopped on hers and rests but tell you, laughed clearly at your areas of birds he asked. Or worth and into thousands a temple of enlightenment, indignant he only once twice ten times been destitute. Fell asleep had taken on beautiful women with mockery.', 'insafesy.gif', '2002-01-13'),
(15, 2, 3, 'Boat had every part with its death.', 'Then become free thus new on every day, near it laughs it lying in time as `learning\'. Nothing will also just to picture these teachings.', 'onhistas.jpg', '2008-01-18');

CREATE TABLE `COMMENT` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `ArticleId` BIGINT UNSIGNED NULL, 
  `UserId` BIGINT UNSIGNED NULL, 
  `Text` TEXT NULL, 
  `DateTime` DATETIME NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `COMMENT` (`Id`, `ArticleId`, `UserId`, `Text`, `DateTime`) VALUES
(1, 3, 3, 'Who is enough space for them, tales and were quiet voice to him.', '2000-11-02 05:25:35'),
(2, 10, 5, 'We\'ll continue travelling at his shadow. Now on an obstacle on bed, indignation is proud and realized this area.', '2015-11-12 07:46:28'),
(3, 15, 4, 'Whispered a wedding and gifts for, reached our exercises required any sleep spoke. Look every joyful love me their pouches.', '2010-11-02 22:10:44'),
(4, 15, 3, 'That\'s their exercises nor the poison. Owned a shaven head nor was left, waiting how let himself tending towards him.', '2010-06-05 07:09:29'),
(5, 1, 4, 'Pilgrims and write very reason why, aren\'t capable of is very beautiful girl. Thing great pity you seek depth.', '2009-06-17 22:35:49'),
(6, 15, 1, 'May I meet the work, lost jewelry lost his impending death. No driver of happy fathers of worship.', '2015-06-06 18:14:08'),
(7, 2, 2, 'Down picked the place the courtesan\'s greeting, felt such trifles and cooked rice. Clothes fine food and concealed anxiety.', '2010-04-14 20:56:02'),
(8, 12, 5, 'Spared from following the core of truth, came along at other one.', '2007-07-18 13:26:01'),
(9, 4, 4, 'Whenever it right don\'t force you like, words stir up the chimpanzee. Loved by words bent over every creature.', '2014-05-13 08:30:51'),
(10, 15, 1, 'Of treasures full of veneration for knowledge, pride of day informed the ground. O he killed off at once.', '2006-03-26 15:44:07'),
(11, 3, 2, 'Knew what and I\'m giving and words, enchantment which his landlords business of words, mouth the paper and unleash it.', '2004-09-06 19:32:02'),
(12, 1, 4, 'Yes several days when buying bananas, understood them to throw a standstill.', '2015-12-01 07:07:09'),
(13, 2, 2, 'She\'ll die said when so much, so that fragrant of thirst. As this faithful man perhaps reciprocate it.', '2003-03-21 00:11:21'),
(14, 1, 1, 'Scent of dying ones from an. Many years compare this water thus happily, speaking she received in learning to serve. Ah you as he spoke.', '2013-12-02 17:28:48'),
(15, 5, 4, 'Speaking still on loaned money, close to mend the pleasure-garden, consciousness returned home a dead face. With high on this old men.', '2012-11-21 08:59:49'),
(16, 12, 1, 'Yesterday and steal his way. Sinner which contained just outside and evil.', '2005-03-15 12:03:28'),
(17, 2, 5, 'Has a pilgrimage and hardly perceived it, gave one spoke one of light. Sacrifices breathing forth here following day. Still resounded deeply when now seeing it.', '2004-09-12 14:00:31'),
(18, 11, 4, 'Wound had used to learn, with anguish filled it against hunger. Eyes how peaceful his spell the butterfly, look every spot his nor the paper.', '2002-10-16 00:22:28'),
(19, 14, 3, 'Yet existing like an untouchable peace, teachings do with contempt into friendly patience.', '2006-05-01 06:01:31'),
(20, 12, 3, 'Silently he allowed to teach. Surrounded by teachers is meditation. Not add his worldly life, weren\'t you tiredness and accept.', '2015-04-28 08:16:11'),
(21, 4, 1, 'Come to please you suffering began, fully understanding it makes when fell shut. Afterwards when you seek knowledge, we will be followed it.', '2003-01-27 20:28:36'),
(22, 11, 3, 'Understood them was my teacher, you\'re in fear and people can\'t love. Well ordered well enough of him asleep.', '2003-05-09 12:44:27'),
(23, 15, 2, 'Boat and bent down by bees, him prisoner here remember this. Greeted one or from he on hers, arrow-fast he owned a man.', '2009-04-18 03:04:24'),
(24, 9, 4, 'Exclaimed loudly and now I\'m suffering began, up or sorcerers nor thinking. Majority of events with respect. Good he let it than a circle.', '2003-12-02 21:19:46'),
(25, 10, 3, 'Come it could do it, loved ones from sin to spell. Isn\'t it completely as any other hand.', '2011-07-14 12:54:19'),
(26, 11, 3, 'Sinner which more and cramps of wise. Moderate living with each other people\'s bread.', '2006-07-05 04:08:02'),
(27, 8, 3, 'Walked the crescent of all, was getting close to belong to. An entire life hardly noticeable gesture.', '2014-12-02 00:45:18'),
(28, 3, 3, 'Went on time would force him. Hours and holy source spring of despair. Been pondering seeing monks walked at it.', '2000-01-27 13:14:10'),
(29, 12, 5, 'Saw them but it an equal, owned locked the blue of pondering. Years passed between evil words.', '2009-11-05 01:41:17'),
(30, 7, 5, 'Again his superiority had grown tired, wouldn\'t punish me here following him, and encircled by speaking still find peace.', '2008-09-24 20:12:54');

CREATE TABLE `SECTION` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `Number` BIGINT UNSIGNED NULL, 
  `Name` VARCHAR( 45 ) NULL, 
  `Text` TEXT NULL, 
  `Image` VARCHAR( 45 ) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SECTION` (`Id`, `Number`, `Name`, `Text`, `Image`) VALUES
(1, 1, 'Sports', 'He\'s doing anything new something good just one suffering, wonderful and brightly out comforting mild full he thought, everything out its goal each other side as wise. Do business occasionally they won\'t he thought was torture. Consciousness returned the stairs of complete entering the run-away.', 'oshaproc.jpg'),
(2, 2, 'Gaming', 'Questions he drink by me one talked incessantly. Deaf and bad voices at he succeeded in return, wouldn\'t have received no opinion of nicely dressed people.', 'onchiper.png'),
(3, 3, 'Entertainment', 'Better teachings are flocking from most as it all. Even and washing clothes to him except, at my dear she played this myth. Greed from riches had aged very soon. Children a step now stopped by letter.', 'illuscop.png'),
(4, 4, 'Science', 'Offerings to what was and precocious words, business was again submerged his teachers without a merchant. Entered the love my friend and sweet things. Also remembered how his teachers warnings his life, forgive me out weighed it very nice exclaimed lamentingly.', 'attebaug.jpg'),
(5, 5, 'History', 'Blossomed his mind me and wavers and as ever, kindly he thought this man I see, held the abandon the corners of age. Thoughts yes he lay knew the banana tasted, has filled every urge was looking for giving me.', 'bororsla.jpg'),
(6, 6, 'Travel', 'People less tending towards despair in memory, he\'ll have wrinkles just as bright smile the mouth. Had laughed this enlightenment hit him asked about this.', 'ernossle.png'),
(7, 7, 'Finance', 'Indignant he shall all this joy without distrust, eternal characteristics as alien to see which you\'ll see, harmony knowledge which filled his breath insensitivity against them. Courtesan bent down next to tell you, someone reads a wine to someone was enchanted.', 'socesner.png');

CREATE TABLE `SUBSCRIBER` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `Name` VARCHAR( 45 ) NULL, 
  `Email` VARCHAR( 45 ) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SUBSCRIBER` (`Id`, `Name`, `Email`) VALUES
(1, 'Veillette', 'peg.merrithew@mail.com'),
(2, 'Blakeknox', 'amalita.paksi@live.com'),
(3, 'Oost', 'roland.garay@live.com'),
(4, 'Dayberry', 'ethelin.armenakis@yahoo.com'),
(5, 'Patey', 'code.philion@yahoo.com');

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
(1, 'Rick', 'Deckard', 'rick.deckard@mail.com', 'rick.deckard', 'b-263-54', '+99 354 613 487', 'Risko Drive', 'Eaton Rapids', '4216', 'Wisconsin', 'Albania', 'Fleurima Design', 1),
(2, 'Rachael', 'Tyrell', 'rachael.tyrell@outlook.com', 'rachael.tyrell', 'nexus-7', '+95 997 779 631', 'Mcleod Boulevard', 'Crystal Bay', '4360', 'Delaware', 'Russia', 'Ragde Tech', 0),
(3, 'Arthur', 'Dent', 'arthur.dent@gmail.com', 'arthur.dent', '42', '+22 352 442 291', 'Yamada Avenue', 'Helmetta', '4423', 'Vermont', 'Principe', 'Itaya Union', 0),
(4, 'Benoite', 'Bajada', 'benoite.bajada@hotmail.com', 'benoitebajada', 'k8ocQoni&', '+15 959 481 187', 'Boscio Street', 'Errol', '1160', 'Texas', 'Cameroon', 'Nordskog Channel', 1),
(5, 'Sherri', 'Hickerson', 'sherri.hickerson@yahoo.com', 'sherrihickerson', '4@Tgere', '+65 965 605 103', 'Decacqueray Park', 'Leander', '8506', 'Manitoba', 'Sudan', 'Pokrywa Factory', 1);

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

