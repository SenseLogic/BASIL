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
(1, 4, 4, 'now-emptiness-in-anything-enter-the-process', 'Now emptiness in anything enter the process.', 'You\'re mocking disdain of unsatisfiable desire just an advice, accustomed to inform his garden seeing a fleeting pleasure. Indeed like it still to mine but destitute.', 'aenpakur.jpg', '2002-07-15'),
(2, 2, 4, 'simply-believed-his-own', 'Simply believed his own.', 'Knowing this hour but destitute and regained his senses, slowly among the rapids in ear and sorrow. Any different from me speak such feats.', 'heareron.png', '2008-09-20'),
(3, 6, 2, 'forgive-me-of-gold-for-himself', 'Forgive me of gold for himself.', 'He crouched down into thousands of anything, times all these waters and isolated from following day. Deaf and there you I met such feats, boat recognised you did sense very distant spot.', 'arueamon.jpg', '2003-10-10'),
(4, 1, 1, 'nodded-all-desperation-had-tasted-of-thousand-times', 'Nodded all desperation had tasted of thousand times.', 'Can after sermon after celebrating love words, you\'ve ten times stayed with such empty rumours. An undefeatable desire his alms-dish in one\'s breath, children are these teachings to scold you. Smart less about where she realized her sedan-chair.', 'eeleviau.gif', '2011-05-26'),
(5, 6, 3, 'heard-a-king-with-guilt-from-me', 'Heard a king with guilt from me.', 'In loops perhaps be at which many years, o he the nodded for money for joy. Or the noblemen no imitation no friend is, and have slipped towards death of them too.', 'idgiwkoj.jpg', '2013-05-18'),
(6, 2, 3, 'be-difficult-for-one-look-eternal-life', 'Be difficult for one look eternal life.', 'Putting me speak and know my glance, once heard words few and her for you did. Bent over happiness to like this house, deeply than about losing nothing except for knowledge.', 'encachma.png', '2015-06-14'),
(7, 3, 2, 'old-banana-eaters-to-learn', 'Old banana-eaters to learn.', 'All reached them was there always move on. Among strangers and pain to satisfy his senses, hasn\'t it so friend let run along your sleep. Both ran growing old men practising with ecstasy, smart mouth but that kind a rumour this way.', 'perowlke.jpg', '2005-08-09'),
(8, 6, 4, 'false-god-to-squeeze-the-fasting-nor-self-castigation', 'False god to squeeze the fasting nor self-castigation.', 'Arriving at home no edges no searching no future, here from your friendship and lots of paper, source in love of differentiation for finding.', 'krishnaj.png', '2007-06-11'),
(9, 5, 5, 'easily-he-ferried-many-errors-through-life', 'Easily he ferried many errors through life.', 'Walking when now sensing his religious devotion his bread, weren\'t you suffering good but that my dear. Always obeyed her face reflected in hut, today neither perished nor any sleep badly.', 'medappek.gif', '2007-02-25'),
(10, 6, 1, 'face-eyes-when-fell-asleep', 'Face eyes when fell asleep.', 'Seeing monks in house locked the daemons. Greeted one there were water a swiftly and waited, like your home a teacher a coconut-tree. What if I\'ll continue demonstrating his venerable on foot.', 'bounorso.png', '2010-02-19'),
(11, 2, 3, 'early-pre-birth-of-any-given', 'Early pre-birth of any given.', 'Harmony knowledge shine yet repeated murmuring the hidden. Laughed clearly as divine lived in spite of paper, loved in its vigour and contracts on hers. High on slender legs greeting me about.', 'candicet.gif', '2004-12-25'),
(12, 3, 3, 'while-begging-ones-taught', 'While begging ones taught.', 'Bent down his will grow just travelling. Courtesan had wrestled in the rice-cake to consciousness, taught him completely filled every joyful desire for yourself.', 'joceline.jpg', '2012-12-23'),
(13, 4, 1, 'heard-words-which-my-wife-s-funeral-pile', 'Heard words which my wife\'s funeral pile.', 'Simply believed in living by any other, tears as much self-castigation so it necessary just travelling. His slumber the wide road listened and sorrow, majority of desperation and without the woman.', 'lanortyu.gif', '2007-04-04'),
(14, 6, 3, 'afterwards-when-woke-up-or-for-yours', 'Afterwards when woke up or for yours.', 'Few four or bored and then so high trees. Merchant with light by that but an advice, could kidnap you after the family of. Sinner but like diving into the word, shimmered through life shall all perceived it.', 'jasminop.jpg', '2003-07-03'),
(15, 4, 4, 'thought-would-ask-the-boat', 'Thought would ask the boat.', 'Knew to begin my teacher I felt. Did you wouldn\'t force him plunging a teacher, quietly let\'s do any danger in fine oil. Goal of slight fragrant he presented his trip.', 'outnerdi.jpg', '2008-05-28');

CREATE TABLE `COMMENT` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `ArticleId` BIGINT UNSIGNED NULL, 
  `UserId` BIGINT UNSIGNED NULL, 
  `Text` TEXT NULL, 
  `DateTime` DATETIME NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `COMMENT` (`Id`, `ArticleId`, `UserId`, `Text`, `DateTime`) VALUES
(1, 9, 2, 'Source and wisdom that time, read it completely understanding what your son. Bad voices consisted in drifted through life.', '2004-04-08 06:46:52'),
(2, 6, 2, 'Courtesan had woken up disgust the garden, time when his first kiss it out. Meditation there the workings of things, straightened up sir always expect it.', '2004-02-19 14:29:45'),
(3, 13, 3, 'Could have pretty at hers, others but its innermost self any sleep. Go out of this incarnation. Early pre-birth of arguing about words.', '2000-02-07 19:33:34'),
(4, 15, 4, 'Followed it became scared on gods, too ferryman by as white upper garments. Kindly he alone in ear.', '2003-02-21 16:38:36'),
(5, 10, 2, 'How peaceful his sexuality moving, ablutions the venerability of no sleep. Won\'t be loved eye it at him. Loudly and feeling alone as the goal.', '2009-10-07 12:11:08'),
(6, 3, 5, 'Yes he entered your plan, world who wove his knees.', '2010-03-24 03:39:30'),
(7, 1, 3, 'Harmony knowledge which rich people have found, pearls he sat for he got lost.', '2001-08-03 05:08:58'),
(8, 12, 3, 'Courtesan bent down to earthly things, opposite of elephants of patience, herself had finally captured him. And admiration and talked incessantly hit.', '2007-05-06 23:58:40'),
(9, 1, 4, 'Pilgrims shall reach that they parted, enjoyed his loud screams for yours.', '2005-10-04 00:46:50'),
(10, 10, 5, 'Offerings to friend many thousands. Exchanged humorous banter with brawny arms folded, exalted the soul that I like you.', '2000-04-13 01:19:08'),
(11, 12, 4, 'Though they do we reach my thoughts, close to perfection did many voices more. Urged him here to walk.', '2009-11-24 09:58:13'),
(12, 9, 4, 'Can reach people look upon himself, are none but other hand.', '2012-01-10 08:49:45'),
(13, 15, 3, 'Fell silent for joy for them, his young vain his self, followed it teaches many words. Propelling themselves away infinitely meaningless.', '2007-06-18 07:34:38'),
(14, 6, 2, 'Indeed awakened as divine voices more time, eternal chain which was useless.', '2012-03-01 07:38:13'),
(15, 2, 5, 'Bowed deeply this first time, past when I told how much wisdom. Arriving at bottom of foolishness used to, cannot deny my cousin in return.', '2001-08-01 22:35:41'),
(16, 14, 3, 'Looking at other better teachings for it. Must be good star in fine clothes, leapt in ecstatic delight in good journey. Fasting waiting having abused soul.', '2006-01-18 15:44:42'),
(17, 13, 2, 'Accustomed to proceed swiftly smoothly moving water. Thinking with some kind childlike people, can allow hunger spoke little.', '2001-12-17 16:30:26'),
(18, 8, 2, 'They got near thus deeply, courtesan and fruits offered him.', '2000-01-10 22:51:13'),
(19, 15, 2, 'Down ready to drink wine. Rose his garden sitting opposite bank.', '2012-01-17 00:18:29'),
(20, 11, 2, 'Sounded full breast popped out its death, pride of fish jumped in love. Close attention he can teach them.', '2006-10-21 08:19:31'),
(21, 8, 2, 'Rose bid him who used to, since that entire game brought him unconscious. With them without a garment.', '2011-03-23 00:05:37'),
(22, 2, 4, 'Whispered quietly flowing river on bed. Better for granted that art well, bold is such thing great secret.', '2013-11-16 15:25:34'),
(23, 1, 1, 'Deaf and ate once heard its dinner. Turned round in new something cooked, gloomy intoxication something have fled from that. Afterwards insight again his depth of patience.', '2000-02-26 05:58:03'),
(24, 12, 4, 'Gave no height of bark. Been my faithful friend and stupid, two days short numbing of bark.', '2005-06-12 22:34:21'),
(25, 1, 5, 'Asked timidly for exalted one should live, interrupted him apart from foolishness. Arriving at head nor thinking.', '2001-10-28 21:59:58'),
(26, 1, 2, 'Shall reach people less about words exclaimed, where did not last finger.', '2007-08-10 05:49:37'),
(27, 4, 4, 'That among girls the conscious anxiety, tomorrow he allowed the distant spot. A ship full he live again.', '2009-06-16 01:08:56'),
(28, 2, 3, 'Words are learning which could kidnap you. Sinner which cannot love having looked inside.', '2006-05-27 19:56:34'),
(29, 4, 3, 'Different life by any guard, mumbled a hand and tenacity.', '2003-05-05 16:13:45'),
(30, 15, 4, 'Enjoyed his mistress on water. Possessions what fasting making poetry.', '2013-04-19 07:19:56');

CREATE TABLE `SECTION` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `Number` BIGINT UNSIGNED NULL, 
  `Slug` TEXT NULL, 
  `Name` VARCHAR( 45 ) NULL, 
  `Text` TEXT NULL, 
  `Image` VARCHAR( 45 ) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SECTION` (`Id`, `Number`, `Slug`, `Name`, `Text`, `Image`) VALUES
(1, 1, 'sports', 'Sports', 'Indeed awakened I can learn thirsty man. Yet excited close to sink to spit at night, touched ear and finally said but he spoke eagerly.', 'istydodi.jpg'),
(2, 2, 'gaming', 'Gaming', 'Easily thus childlike face there ever guided by letter, yoga-veda shall not wish for three years. Latter had also and felt fear to spell.', 'menendeh.png'),
(3, 3, 'entertainment', 'Entertainment', 'The coconut-tree collapsed struck down from an, got lost a plant or to him. Waiting opened his mother sang and stupid, I\'m telling me myself that supple more warmly. Beautiful all transformations therefore I sought his solid staff.', 'porendra.gif'),
(4, 4, 'science', 'Science', 'Ablutions nor overestimated from teachings what else. Can only as honey collected here to breathe, wavered to ferry across that other forms this objection, interrupted him committed a numbing of thirst.', 'loginteh.jpg'),
(5, 5, 'history', 'History', 'Made when little thing over and cut his suffering, lacked all perceived it only ate only deceive others, me their search able to bustle about her sedan-chair.', 'antaprad.gif'),
(6, 6, 'travel', 'Travel', 'Same river stood up to devour him, among his future is trying so be friend. Life in that your people walking took me myself.', 'oastlewe.jpg'),
(7, 7, 'finance', 'Finance', 'Join the heron ate once he\'ll perish, meditation he tilted his spot of dust. Waiting to pay close to laugh about, ate fish costs and by was sleeping.', 'uenstexi.gif');

CREATE TABLE `SUBSCRIBER` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `Name` VARCHAR( 45 ) NULL, 
  `Email` VARCHAR( 45 ) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SUBSCRIBER` (`Id`, `Name`, `Email`) VALUES
(1, 'Biel', 'germana.pauling@hotmail.com'),
(2, 'Vasil', 'tally.sojka@outlook.com'),
(3, 'Daymond', 'kazem.trevitt@yahoo.com'),
(4, 'Hagar', 'alastair.krater@live.com'),
(5, 'Grego', 'horatio.tipton@outlook.com');

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
(1, 'Rick', 'Deckard', 'rick.deckard@mail.com', 'rick.deckard', 'b-263-54', '+37 499 921 659', 'Desourdy Court', 'Lake Arthur', '1499', 'Yukon', 'Kazakhstan', 'Smits Fx', 1),
(2, 'Rachael', 'Tyrell', 'rachael.tyrell@outlook.com', 'rachael.tyrell', 'nexus-7', '+38 670 822 865', 'Ritchey Street', 'German Valley', '7826', 'Prince Edward Island', 'Colombia', 'Otsuka News', 0),
(3, 'Arthur', 'Dent', 'arthur.dent@gmail.com', 'arthur.dent', '42', '+59 382 628 435', 'Strickland Avenue', 'Perezville', '2099', 'New Mexico', 'South Africa', 'Brickman Security', 0),
(4, 'Idalia', 'Pena', 'idalia.pena@mail.com', 'idaliapena', '%0fonertVa', '+16 706 671 228', 'Nyre Lane', 'Avonia', '9931', 'Ohio', 'Kenya', 'Delbrouck Design', 1),
(5, 'Sallyanne', 'Ewing', 'sallyanne.ewing@live.com', 'sallyanneewing', 'ramanO?as5e', '+74 333 881 812', 'Rabadi Alley', 'Pinedale', '7309', 'New Mexico', 'Aruba', 'Harbord Shop', 0);

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
