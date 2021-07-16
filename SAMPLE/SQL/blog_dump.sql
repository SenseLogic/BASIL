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
(1, 3, 4, 'moderate-living-joy-without-stirring', 'Moderate living joy without stirring.', 'Listen better opinion of desires were accepted. Left by me and nothing let escape from me, hours he passes through life the run-away. Gave one admiring the beats of transitoriness in himself, might very human death from time that line.', 'kovicili.png', '2005-01-19'),
(2, 5, 4, 'hours-he-could-do-it', 'Hours he could do it.', 'Ran incessantly it belongs to scold him safe, meditation there was kneeling and precocious words, past times real life full he used crude swearwords.', 'bulelpiu.gif', '2001-09-17'),
(3, 7, 2, 'without-clothes-and-wait', 'Without clothes and wait.', 'Heard him concerning his bath in him, putting himself and of old eyes how everything is. Beckoned him over slowly become great thinkers do this, thanked and preserved by and solved up impetuously hunting. Read for several times for permission my father\'s face.', 'bisurnop.jpg', '2001-06-27'),
(4, 6, 1, 'then-for-being-among-other-one', 'Then for being among other one.', 'More zealously forced him about spiritual matters the holy, childlike people like he finds a poem. Willingness delights my tongue was leading of humans, awakened and I wanted for everything the singular one.', 'aldnahav.png', '2015-07-21'),
(5, 5, 2, 'non-eternal-things-most-quickly', 'Non-eternal things most quickly.', 'Latter had wasted time had as bright smile, learned it had given me for riches. Past seemed indeed like me exclaimed lamentingly. Do much vomits it had every insult with hunger.', 'ervallis.jpg', '2002-01-13'),
(6, 4, 2, 'good-life-than-learning-from-the', 'Good life than learning from the.', 'Nothing which I even became confused and smiling oneness, easily he searches for we be such feats. Exalted teachings and when every child could kidnap you.', 'aseppere.gif', '2012-08-12'),
(7, 5, 4, 'sadness-has-distinguished-himself-than-used-crude-swearwords', 'Sadness has distinguished himself than used crude swearwords.', 'Bent over which guided me how to relieve suffering, beautiful women that no childish notions for twenty-eight days. Shouldn\'t I see is my desire is proven.', 'leapakec.jpg', '2009-02-09'),
(8, 5, 4, 'fasting-waiting-his-self', 'Fasting waiting his self.', 'Black snake is precisely the injury of talk, held the opposite bank of sounded sweet. Anxiety in them was calmly sitting on my father, clean and what I\'ve known for once more willing, same amount of thoughts to drown himself all life.', 'ennurcha.gif', '2011-04-26'),
(9, 2, 1, 'his-tale-when-we-are-wise', 'His tale when we are wise.', 'Wouldn\'t punish me into thousands at all, dreams flowed on all belonged together with hunger. Her little to save him very good. Pleasure cannot be dead did his arm.', 'joceline.jpg', '2003-06-12'),
(10, 7, 2, 'wanted-to-participate-in-love', 'Wanted to participate in love.', 'Rest with other turned all vices through enlightenment. Shall reach their richness and contracts on shoulder. Source dark call climbing a wonderful verses. Next person of offerings to handle the perfection, truly the father thinking does nothing else.', 'artahaco.jpg', '2009-06-10'),
(11, 7, 1, 'forgive-me-on-foot', 'Forgive me on foot.', 'These waters and called all very old sneak, moderate living joy I imagined some among so beautiful. Him lured him my soul full the business.', 'ieblabra.png', '2009-10-24'),
(12, 4, 5, 'leaned-to-walk-on', 'Leaned to walk on.', 'Her in days by words sound foolish world, failed to salvation from teachings most wretched people. Shouldn\'t I also fear to strike him at it, full he the sun and bodies themselves.', 'aughalla.gif', '2002-03-16'),
(13, 5, 5, 'herself-had-thoughts-to-myself', 'Herself had thoughts to myself.', 'Latter had pointed them my benefit to earthly things, always the than before the friend is. Yesterday greeting you he won\'t hit him.', 'oussitec.jpg', '2005-06-18'),
(14, 6, 3, 'said-everything-they-parted', 'Said everything they parted.', 'Indeed was accustomed to finer food even more quiet, often hard everything hostile in fine food nor thinking, join water and from such an old.', 'icksardu.gif', '2009-09-02'),
(15, 3, 1, 'my-self-of-rice-there-in-you', 'My self of rice there in you.', 'One thing most shameful despair in himself, non-eternal things you suffering had for it. Ah you once more no oar of a, saw people can\'t think about to live.', 'ejbarvai.gif', '2002-12-07');

CREATE TABLE `COMMENT` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `ArticleId` BIGINT UNSIGNED NULL, 
  `UserId` BIGINT UNSIGNED NULL, 
  `Text` TEXT NULL, 
  `DateTime` DATETIME NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `COMMENT` (`Id`, `ArticleId`, `UserId`, `Text`, `DateTime`) VALUES
(1, 7, 2, 'Seeing images appeared on gods, any truth had joy to go.', '2010-03-20 07:55:37'),
(2, 12, 2, 'Before a follower of dying ones taught, hours looked over her gaze asked.', '2010-03-28 05:21:57'),
(3, 13, 3, 'We were water to spare your fare, once a king with in thinking.', '2008-10-16 00:57:48'),
(4, 13, 4, 'You\'ve met even and dull life, being among thousands possess this been.', '2015-07-24 06:46:20'),
(5, 5, 5, 'At odds with sky-blue ones, the dead jackal lay hidden. A myth ran growing old man\'s.', '2007-12-07 05:08:18'),
(6, 11, 2, 'Warrior gives me exclaimed loudly, man had crouched down on water.', '2007-01-05 15:36:09'),
(7, 10, 4, 'Having passed through your hair, greeted you planning to capture it.', '2006-07-27 22:49:38'),
(8, 3, 5, 'Enjoyed his mourning pampered boy over, they me where I do we won\'t, offerings from you don\'t know you did. Body and hands were brought her eyes.', '2013-02-01 18:05:37'),
(9, 4, 4, 'Him given him everything is. Tell him is fading now on, your sleep spoke go through enlightenment, young falcon together the words.', '2001-01-12 05:16:15'),
(10, 1, 4, 'Near thus the heart I know, with himself all those many words. They\'ve become of human being.', '2007-10-16 11:19:47'),
(11, 2, 2, 'Goal the game which did you again. Lacked all dying in living for this. Told him joy with great secret of.', '2012-04-03 17:02:19'),
(12, 4, 3, 'Attentively to participate in confirmation, full he could no never talked incessantly. Ate once heard it even conscious anxiety, I\'ve never stopped looking for an opinion.', '2005-03-24 12:20:04'),
(13, 12, 5, 'She\'ll die than by this, could force him quietly to.', '2008-05-11 08:24:47'),
(14, 5, 2, 'An inscription reminiscent of misery. Half all was slowly become his lips.', '2012-08-11 01:14:26'),
(15, 3, 1, 'Over him at our business, purpose and remembered that ferry.', '2015-12-21 15:56:12'),
(16, 10, 2, 'As old childlike face a starry sky, afterwards insight came who did he laughed, nevertheless always led back for yours. Source a slow path by this.', '2015-11-26 10:06:30'),
(17, 10, 3, 'Herself had quenched out business-affairs they commanded. Having spoken to finally drown, means that then the grove, yesterday and man by any more.', '2001-03-08 10:34:44'),
(18, 5, 2, 'Knew everything which reminded him growing ill. Learned among people walking a resolution.', '2000-12-27 02:54:25'),
(19, 3, 5, 'Surrounded by hyaenas was good, yes she him don\'t force him. Near perfection and lots of others, young walking through so it is.', '2001-05-14 01:07:34'),
(20, 14, 3, 'Walking along with sky-blue ones, herself had commanded him go through enlightenment.', '2001-01-14 04:09:50'),
(21, 2, 1, 'Entire path by one\'s own soul, do you must not find salvation, them blew through it off their end.', '2010-06-28 21:10:54'),
(22, 1, 4, 'Also gives me down from an, gave copper-coins to accept alms move on. Much delude myself alone he accepted invitation. Lacked nothing to gather brushwood for her.', '2008-07-21 11:42:20'),
(23, 3, 5, 'Owned locked the banana tasted, she\'ll die his spot his teachings.', '2005-11-23 21:06:01'),
(24, 11, 2, 'Loved in ear and dust in it, let\'s practise love the fields. Monk and time said quietly, of reluctance to heal everyone can understand.', '2000-11-11 07:59:45'),
(25, 7, 5, 'Wondrous it also died something like foolishness. Continued what you\'re on water, takes everyone who petitioned him.', '2011-10-20 02:28:42'),
(26, 10, 2, 'Soul flew over the dying in it. Stayed where travellers of our business.', '2010-11-27 07:02:38'),
(27, 7, 5, 'Better than three noble promises, sir the gesture of nicely dressed people. People have oil in poverty. Yet my travels not stop breathing.', '2012-06-16 12:08:17'),
(28, 13, 2, 'Farewell to free being retold many times, somehow happened that very own suffering.', '2003-02-09 22:17:26'),
(29, 10, 4, 'Saw song-bird in times been very good, speak a listener completely a circle, courtesan has come into its dinner. Ablutions nor self-castigation offerings for himself.', '2001-07-07 08:22:17'),
(30, 14, 4, 'Whenever they won\'t make love, times to discover its ten thousand times, deep sadness and time a. And drunk far ahead of age.', '2011-06-21 10:39:12');

CREATE TABLE `SECTION` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `Number` BIGINT UNSIGNED NULL, 
  `Slug` TEXT NULL, 
  `Name` VARCHAR( 45 ) NULL, 
  `Text` TEXT NULL, 
  `Image` VARCHAR( 45 ) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SECTION` (`Id`, `Number`, `Slug`, `Name`, `Text`, `Image`) VALUES
(1, 1, 'sports', 'Sports', 'Write the branches and we you know nothing else, time for telling you at daybreak I said, lovely is late once every look eternal life. Fell silent for him except to say, from an eagerness to heal the verse.', 'olamikik.png'),
(2, 2, 'gaming', 'Gaming', 'Leapt in your trainee for jewelry lost your poem, man than of differentiation for there sky in himself, pilgrims and ultimately hopeless when you\'ll see. Time from there aren\'t the childlike person, ran through teachings well this be holy.', 'atnander.png'),
(3, 3, 'entertainment', 'Entertainment', 'Sat with anger to it yet none of humans, words few with a gift another after another time. Never he chose I could force him.', 'macallal.png'),
(4, 4, 'science', 'Science', 'And fresh as novices taken on in fine clothes. They\'ve become a great and everyone in ear, just slowly she called upon himself without clothes, made myself from everywhere and moon and passion.', 'casaughe.gif'),
(5, 5, 'history', 'History', 'Stood alone without power he listened silently, day I followed a mango-tree that all. Have wrinkles and treated the filled with.', 'felicevo.gif'),
(6, 6, 'travel', 'Travel', 'Wheel once he\'ll turn from on earth, questions but his face listening attentively perceived. Wondrous it in error that teachings from horror.', 'eattipel.png'),
(7, 7, 'finance', 'Finance', 'First woman for I told you be learned. I\'ll give an oar with ropes of life, mouth like into his disposition for your plan. His skin that foolish but not recognise him, she became mute his bath in one\'s thoughts.', 'ligikico.png');

CREATE TABLE `SUBSCRIBER` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, 
  `Name` VARCHAR( 45 ) NULL, 
  `Email` VARCHAR( 45 ) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `SUBSCRIBER` (`Id`, `Name`, `Email`) VALUES
(1, 'Oberpriller', 'loreta.werling@yahoo.com'),
(2, 'Jobe', 'katusha.mathews@hotmail.com'),
(3, 'Yarbrough', 'charla.walters@yahoo.com'),
(4, 'Macdonell', 'rio.russell@gmail.com'),
(5, 'Dasilva', 'gant.intplan@gmail.com');

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
(1, 'Rick', 'Deckard', 'rick.deckard@mail.com', 'rick.deckard', 'b-263-54', '+16 576 351 655', 'Mulvie Park', 'Missoula', '2243', 'Wyoming', 'Uganda', 'Majd Shop', 1),
(2, 'Rachael', 'Tyrell', 'rachael.tyrell@outlook.com', 'rachael.tyrell', 'nexus-7', '+70 584 582 311', 'Kendall Lane', 'Shortsville', '5160', 'Quebec', 'Swaziland', 'Oucharek Online', 0),
(3, 'Arthur', 'Dent', 'arthur.dent@gmail.com', 'arthur.dent', '42', '+32 831 825 401', 'Harold Park', 'Elkport', '6713', 'Nunavut', 'East Timor', 'Kluger Group', 0),
(4, 'Alika', 'Traylor', 'alika.traylor@hotmail.com', 'alikatraylor', 'nefag2oG;da', '+96 882 650 420', 'Panger Alley', 'Woodbine', '3786', 'West Virginia', 'Zambia', 'Breon Team', 1),
(5, 'Bird', 'Colpitts', 'bird.colpitts@yahoo.com', 'birdcolpitts', 'uenKs2y!', '+42 961 882 769', 'Loos Lane', 'Green Mountain Falls', '9086', 'Missouri', 'Djibouti', 'Freeth Vision', 0);

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
