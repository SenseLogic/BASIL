create table `ARTICLE` (
  `Id` BIGINT UNSIGNED not null auto_increment, 
  `SectionId` BIGINT UNSIGNED null, 
  `UserId` BIGINT UNSIGNED null, 
  `Slug` TEXT null, 
  `Title` TEXT null, 
  `Text` TEXT null, 
  `Image` VARCHAR( 45 ) null, 
  `Date` DATE null
) engine=innodb default charset=utf8mb4;

insert into `ARTICLE` (`Id`, `SectionId`, `UserId`, `Slug`, `Title`, `Text`, `Image`, `Date`) values
(1, 2, 4, 'exalted-one-i-ll-leave-you', 'Exalted one I\'ll leave you.', 'Talking and are tormenting yourself as wise. Himself he already left me stems from such jokes, o he too sweet voice she put out badly.', 'uethicho.png', '2012-06-21'),
(10, 6, 5, 'spoke-wouldn-t-punish-him', 'Spoke wouldn\'t punish him.', 'Blossomed slowly among travellers stay and merged with ecstasy, himself found blissfulness of life his bed. Questions but still a potter\'s wheel of sounded sweet.', 'alibeniu.gif', '2009-09-09'),
(11, 5, 5, 'felt-at-me-any-more', 'Felt at me any more.', 'Hasn\'t it suffered for its flow in perfumed waters. Fine food to provide him much longer, that\'s everything for should still has told you again. Is willing to weep petted his own, time I am able to start on hers.', 'erigobyd.jpg', '2015-05-10'),
(12, 7, 1, 'false-god-more-i-do', 'False god more I do.', 'Opposite bank he posed to avoid evil, other not treat him concerning his body to teach. Others of our boat with made it her eyes, join youth who seemed now grown tired.', 'ivedefau.jpg', '2004-05-08'),
(13, 1, 3, 'offerings-to-accepted-the-repeated-murmuring-the-verse', 'Offerings to accepted the repeated murmuring the verse.', 'These verses in her gave a parable, lust like my travels not died in many voices. Looked upon people laughed surely I could kidnap you.', 'estiguni.jpg', '2013-04-04'),
(14, 6, 2, 'heard-words-which-can-prosper', 'Heard words which can prosper.', 'Courtesan had wasted life as and that your child. He once seen with practising those not belong to, do you mean by his impending death. Sun directly in former times to speak. Taught the thought taking control of when every creature.', 'gelavaji.png', '2011-02-15'),
(15, 3, 2, 'had-stopped-looking-for', 'Had stopped looking for.', 'Me again breathed softly touched shoulder embraced him, all afraid of remote areas of straw for them, clothes are called name the creatures are wise. Want you pilgrims shall please the abandon your riches.', 'empatche.png', '2005-04-27');
(2, 2, 3, 'to-woman-giving-in-love', 'To woman giving in love.', 'Merchant with spite of glistened of sleep, business was this repetition this soft smile every creature. Read it without doing anything from horror.', 'ukhaster.png', '2012-12-28'),
(3, 2, 5, 'without-individuality-of-truth', 'Without individuality of truth.', 'Next person in their holy verses exclaimed loudly. His self this ferry-boat for some kind with hunger, previous births were both when left by simpler means. Be void of desperation had dreamt of.', 'nillinse.gif', '2012-12-18'),
(4, 3, 5, 'didn-t-you-get-over-every-moment', 'Didn\'t you get over every moment.', 'Many pilgrims you were thoughts just ready like them, pearls he ever a divine arrow shot from me, soul an assistant in the dancing girls the many.', 'saribbej.gif', '2004-11-02'),
(5, 6, 2, 'was-brought-to-humans-in-confirmation', 'Was brought to humans in confirmation.', 'Leaned to live of sleep properly again, also write very thing over his arm. Glance and disappointment and old in truth can prosper, here was ever before we both ran away. Only saw all things in any sleep.', 'nickauri.png', '2013-08-18'),
(6, 2, 2, 'weren-t-you-practise-meditation-holding-your-work', 'Weren\'t you practise meditation holding your work.', 'Interrupted him dressed in these clothes for fifteen days. Finding it which the essence bearing his bright robe, turned away neither sleep on many pilgrims do so. Myth had remained thus to luxury scorned nor self-castigation.', 'burarkam.png', '2012-05-03'),
(7, 4, 3, 'thanked-and-wretchedness-he-dreamt-of', 'Thanked and wretchedness he dreamt of.', 'Learned meditation through a thoughts that always used to, or animallike manner in that obstacle they commanded. They\'ve become entities and wasting his shoulder, here thought I wouldn\'t have heard words, up then again forced isn\'t forced isn\'t it.', 'oloknees.png', '2005-03-16'),
(8, 6, 2, 'previous-thoughts-came-to-consciousness-the-family-of', 'Previous thoughts came to consciousness the family of.', 'Accustomed to finally free will give me being, interrupted him concerning his voice hovered over her sedan-chair. Came without doing anything else to beg, arrow-fast he observed the exalted the teachers.', 'encaetta.png', '2011-09-19'),
(9, 4, 2, 'his-first-activities-in-itself-this-way', 'His first activities in itself this way.', 'Always expect it turned all goals all vices, slowly getting a hunter in past not recognise him. Sinner is beginning of dice the monks, distant memory he considered indispensable and voice without clothes.', 'iciskeyw.gif', '2006-12-23'),

create table `COMMENT` (
  `Id` BIGINT UNSIGNED not null auto_increment, 
  `ArticleId` BIGINT UNSIGNED null, 
  `UserId` BIGINT UNSIGNED null, 
  `Text` TEXT null, 
  `DateTime` DATETIME null
) engine=innodb default charset=utf8mb4;

insert into `COMMENT` (`Id`, `ArticleId`, `UserId`, `Text`, `DateTime`) values
(1, 3, 3, 'Cannot be open look at once, exchanged humorous banter with in agreement with. Nodded brushed his years of them. Want back up gave one was accepted.', '2003-04-18 03:17:27'),
(10, 2, 3, 'Mouth is nodded in perfumed waters, all around him just knowing patient. Distorted her red smart said, ran through so I still thus.', '2001-09-26 18:56:47'),
(11, 15, 1, 'Yesterday greeting his landlords business, propelling themselves all by annihilating his worries.', '2008-06-21 16:01:25'),
(12, 6, 5, 'Urged him don\'t forget him disregard him. Gives merchandise in all people, bad talk of wine a village.', '2013-05-26 05:35:37'),
(13, 14, 4, 'I\'ve had heard the glory, man did you to spit at home.', '2001-05-12 08:24:12'),
(14, 10, 2, 'Only meal of for twenty-eight days, bowed with praise from an.', '2012-08-23 07:03:21'),
(15, 11, 5, 'She said let\'s do this ultimate thirst, is put it moves in secrets.', '2003-11-20 11:53:04'),
(16, 14, 4, 'Yes she called timidly for me, than obey your exalted one. Clothes are subject to experience, we\'ll hear my exercises required any further.', '2012-03-20 16:18:18'),
(17, 12, 3, 'Black snake was now stopped searching, haven\'t learned knowledge of him, wisdom always get that you\'re right away.', '2014-08-03 21:47:37'),
(18, 15, 3, 'Followed him standing where you well, farewell from everywhere in it importance.', '2015-07-28 17:00:38'),
(19, 1, 5, 'Us accept any specific intention, in yellow in their position.', '2013-05-25 03:55:47'),
(2, 14, 4, 'Much and nowhere a mother\'s funeral, stared at bottom already ascended many worries. When they won\'t hit him.', '2014-11-23 07:30:41'),
(20, 6, 1, 'Full he observed well enough to give, venerable among girls and accept. Had retired from afar to earthly things.', '2009-03-28 19:15:08'),
(21, 2, 1, 'Suddenly woke up felt thirst without money, against her head his slim hips. Example hadn\'t been going nowhere.', '2011-05-15 02:10:43'),
(22, 15, 1, 'At and stains gets stains and evening, smiling he reached it in love. Cannot deny my guest while for finding.', '2003-07-04 00:28:58'),
(23, 12, 1, 'Perhaps benevolent perhaps turn the gods. Are none but when buying bananas. Be servants in return was necessary.', '2008-02-23 04:39:32'),
(24, 5, 4, 'Rich and sloth of everything is. False god it happened to rest.', '2004-01-19 16:15:30'),
(25, 15, 4, 'Fine oil or mask of paths, without passion of tormenting yourself by many, the ever loved by name of it. Possessions renounced all pretended to beg.', '2001-01-10 08:01:12'),
(26, 15, 5, 'Sounded strange and happier now. Smart had gathered his tale, well your friend of desire for this.', '2008-04-09 06:15:19'),
(27, 12, 4, 'Remained alien to gather brushwood for her. Son was his expecting vessel was broken, they now no effort to such feats. Still seemed not become tired.', '2005-03-27 22:32:52'),
(28, 10, 3, 'Also not reached a verse from horror, ablutions the glow of a. Loudly and dull life at once, willingness my learned what fault in hut.', '2009-06-15 17:14:41'),
(29, 9, 1, 'Seeing old spoke to shine, said you\'ve last teacher the ascetics.', '2014-09-04 09:51:22'),
(3, 10, 2, 'Loudly and fro and so much, yes that hatred against its title. Can teach it is small.', '2011-04-22 10:53:59'),
(30, 7, 2, 'Loved the gate into its contents, me you ferryman yes several of misery, whom else to discover its voice. Questions he hoped to pretty.', '2001-10-06 06:58:09');
(4, 5, 2, 'Deaf and offerings and faces of light, they followed it told him.', '2007-11-01 06:58:15'),
(5, 10, 2, 'Spoke wouldn\'t punish me into suffering began, warrior gives me deeply like the water, until they reached a thoughts. Wheel once said this I must refuse.', '2006-06-06 15:03:34'),
(6, 14, 3, 'Ferryman in motion will see, deep solemnity he remembered them, her house servants the trade.', '2008-07-11 16:03:14'),
(7, 2, 5, 'Bold is mine I do, way for her learned something he said, got some way with it already. Apparently he lay hidden so long.', '2003-12-17 04:36:57'),
(8, 8, 5, 'Learned among girls and teach me to, again old in their worries.', '2002-09-22 08:54:03'),
(9, 1, 5, 'Clean and waters and again. Want back too and dull life. O he shook himself down right path, children already ascended many times always everything.', '2007-09-15 05:09:20'),

create table `SECTION` (
  `Id` BIGINT UNSIGNED not null auto_increment, 
  `Number` BIGINT UNSIGNED null, 
  `Slug` TEXT null, 
  `Name` VARCHAR( 45 ) null, 
  `Text` TEXT null, 
  `Image` VARCHAR( 45 ) null
) engine=innodb default charset=utf8mb4;

insert into `SECTION` (`Id`, `Number`, `Slug`, `Name`, `Text`, `Image`) values
(1, 1, 'sports', 'Sports', 'Today how to identify the spreads his advice, smiled at odds with desire his debtors more question. Smart mouth by friendly manner laughed brightly the fire.', 'janithyu.gif'),
(2, 2, 'gaming', 'Gaming', 'Gloomy intoxication something real something honourable one. Passed between him disregard him even know it, afterwards insight came through realizations and beautifully. Pleasure and hard for my eyes became calm hearts.', 'ingfives.png'),
(3, 3, 'entertainment', 'Entertainment', 'You\'re very delicate very spot his bread, on so clear voice and remained silent. Were a sighing man before on bed, good man by tiredness came when it would be.', 'ingellad.gif'),
(4, 4, 'science', 'Science', 'Few four main doctrines taught me in thinking, what of treasures full height any sleep. But sweet scent of wealth the thousand eyes glistening. Indignant he can also become empty rumours. Loved a mouth at our capacity for your mouth.', 'marnicor.png'),
(5, 5, 'history', 'History', 'Seeing a ferryman and doesn\'t want me from mine, opened the unknown man I am one of thought. World in vain vacuous speaker sensed an advice, walking swiftly away infinitely much he used the scriptures.', 'donadavu.jpg'),
(6, 6, 'travel', 'Travel', 'Name neither harmed myself for we be worshipped river, thought to provide him weep petted her eyelids, courtesan and saw life knew so clearly. Language would want me as this house.', 'arrolali.png'),
(7, 7, 'finance', 'Finance', 'Eyes beheld a bird was bearing these wretched people, thanked her cheek turned his knowledge you take it. Majority of that mysterious quality of the house, their great respect a deception called upon him.', 'kinaungi.png');

create table `SUBSCRIBER` (
  `Id` BIGINT UNSIGNED not null auto_increment, 
  `Name` VARCHAR( 45 ) null, 
  `Email` VARCHAR( 45 ) null
) engine=innodb default charset=utf8mb4;

insert into `SUBSCRIBER` (`Id`, `Name`, `Email`) values
(1, 'Fishencord', 'maia.lasch@outlook.com'),
(2, 'Luetke', 'damita.holton@live.com'),
(3, 'Coddington', 'mora.tabalba@live.com'),
(4, 'Bambach', 'myrtice.albud@gmail.com'),
(5, 'Thurman', 'emilie.pollinzi@live.com');

create table `USER` (
  `Id` BIGINT UNSIGNED not null auto_increment, 
  `FirstName` VARCHAR( 45 ) null, 
  `LastName` VARCHAR( 45 ) null, 
  `Email` VARCHAR( 45 ) null, 
  `Pseudonym` VARCHAR( 45 ) null, 
  `Password` VARCHAR( 45 ) null, 
  `Phone` VARCHAR( 45 ) null, 
  `Street` TEXT null, 
  `City` VARCHAR( 45 ) null, 
  `Code` VARCHAR( 45 ) null, 
  `Region` VARCHAR( 45 ) null, 
  `Country` VARCHAR( 45 ) null, 
  `Company` VARCHAR( 45 ) null, 
  `ItIsAdministrator` TINYINT UNSIGNED null
) engine=innodb default charset=utf8mb4;

insert into `USER` (`Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`) values
(1, 'Rick', 'Deckard', 'rick.deckard@mail.com', 'rick.deckard', 'b-263-54', '+85 366 440 765', 'Lindell Alley', 'Ponemah', '9237', 'Quebec', 'Timor-Leste', 'Wimmer Shop', 1),
(2, 'Rachael', 'Tyrell', 'rachael.tyrell@outlook.com', 'rachael.tyrell', 'nexus-7', '+99 111 515 282', 'Timler Avenue', 'Oak Valley', '5372', 'Nevada', 'Cyprus', 'Revah Security', 0),
(3, 'Arthur', 'Dent', 'arthur.dent@gmail.com', 'arthur.dent', '42', '+99 539 207 956', 'Eisenhart Boulevard', 'Olberg', '6400', 'Nunavut', 'Papua New Guinea', 'Barenie Fund', 0),
(4, 'Sandye', 'Belboul', 'sandye.belboul@live.com', 'sandyebelboul', 'Fro6do/', '+13 965 194 479', 'Vonsemmler Lane', 'Cedar Fort', '8994', 'Michigan', 'Samoa', 'Sitar Bank', 0),
(5, 'Marguerita', 'Soyland', 'marguerita.soyland@mail.com', 'margueritasoyland', 've%1rEy', '+81 829 144 213', 'Mcarthur Boulevard', 'Roane', '5124', 'Kentucky', 'Saint Kitts', 'Zadow News', 1);

alter table `ARTICLE`
  add primary key (`Id`);

alter table `COMMENT`
  add primary key (`Id`);

alter table `SECTION`
  add primary key (`Id`);

alter table `SUBSCRIBER`
  add primary key (`Id`);

alter table `USER`
  add primary key (`Id`);
