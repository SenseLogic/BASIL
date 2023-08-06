update `SECTION`
set
    `Number` = 1, 
    `Slug` = 'sports', 
    `Name` = 'Sports', 
    `Text` = 'Today how to identify the spreads his advice, smiled at odds with desire his debtors more question. Smart mouth by friendly manner laughed brightly the fire.', 
    `Image` = 'janithyu.gif'
where `Id` = 1;

update `SECTION`
set
    `Number` = 2, 
    `Slug` = 'gaming', 
    `Name` = 'Gaming', 
    `Text` = 'Gloomy intoxication something real something honourable one. Passed between him disregard him even know it, afterwards insight came through realizations and beautifully. Pleasure and hard for my eyes became calm hearts.', 
    `Image` = 'ingfives.png'
where `Id` = 2;

update `SECTION`
set
    `Number` = 3, 
    `Slug` = 'entertainment', 
    `Name` = 'Entertainment', 
    `Text` = 'You\'re very delicate very spot his bread, on so clear voice and remained silent. Were a sighing man before on bed, good man by tiredness came when it would be.', 
    `Image` = 'ingellad.gif'
where `Id` = 3;

update `SECTION`
set
    `Number` = 4, 
    `Slug` = 'science', 
    `Name` = 'Science', 
    `Text` = 'Few four main doctrines taught me in thinking, what of treasures full height any sleep. But sweet scent of wealth the thousand eyes glistening. Indignant he can also become empty rumours. Loved a mouth at our capacity for your mouth.', 
    `Image` = 'marnicor.png'
where `Id` = 4;

update `SECTION`
set
    `Number` = 5, 
    `Slug` = 'history', 
    `Name` = 'History', 
    `Text` = 'Seeing a ferryman and doesn\'t want me from mine, opened the unknown man I am one of thought. World in vain vacuous speaker sensed an advice, walking swiftly away infinitely much he used the scriptures.', 
    `Image` = 'donadavu.jpg'
where `Id` = 5;

update `SECTION`
set
    `Number` = 6, 
    `Slug` = 'travel', 
    `Name` = 'Travel', 
    `Text` = 'Name neither harmed myself for we be worshipped river, thought to provide him weep petted her eyelids, courtesan and saw life knew so clearly. Language would want me as this house.', 
    `Image` = 'arrolali.png'
where `Id` = 6;

update `SECTION`
set
    `Number` = 7, 
    `Slug` = 'finance', 
    `Name` = 'Finance', 
    `Text` = 'Eyes beheld a bird was bearing these wretched people, thanked her cheek turned his knowledge you take it. Majority of that mysterious quality of the house, their great respect a deception called upon him.', 
    `Image` = 'kinaungi.png'
where `Id` = 7;

update `USER`
set
    `FirstName` = 'Rick', 
    `LastName` = 'Deckard', 
    `Email` = 'rick.deckard@mail.com', 
    `Pseudonym` = 'rick.deckard', 
    `Password` = 'b-263-54', 
    `Phone` = '+85 366 440 765', 
    `Street` = 'Lindell Alley', 
    `City` = 'Ponemah', 
    `Code` = '9237', 
    `Region` = 'Quebec', 
    `Country` = 'Timor-Leste', 
    `Company` = 'Wimmer Shop', 
    `ItIsAdministrator` = 1
where `Id` = 1;

update `USER`
set
    `FirstName` = 'Rachael', 
    `LastName` = 'Tyrell', 
    `Email` = 'rachael.tyrell@outlook.com', 
    `Pseudonym` = 'rachael.tyrell', 
    `Password` = 'nexus-7', 
    `Phone` = '+99 111 515 282', 
    `Street` = 'Timler Avenue', 
    `City` = 'Oak Valley', 
    `Code` = '5372', 
    `Region` = 'Nevada', 
    `Country` = 'Cyprus', 
    `Company` = 'Revah Security', 
    `ItIsAdministrator` = 0
where `Id` = 2;

update `USER`
set
    `FirstName` = 'Arthur', 
    `LastName` = 'Dent', 
    `Email` = 'arthur.dent@gmail.com', 
    `Pseudonym` = 'arthur.dent', 
    `Password` = '42', 
    `Phone` = '+99 539 207 956', 
    `Street` = 'Eisenhart Boulevard', 
    `City` = 'Olberg', 
    `Code` = '6400', 
    `Region` = 'Nunavut', 
    `Country` = 'Papua New Guinea', 
    `Company` = 'Barenie Fund', 
    `ItIsAdministrator` = 0
where `Id` = 3;

update `USER`
set
    `FirstName` = 'Sandye', 
    `LastName` = 'Belboul', 
    `Email` = 'sandye.belboul@live.com', 
    `Pseudonym` = 'sandyebelboul', 
    `Password` = 'Fro6do/', 
    `Phone` = '+13 965 194 479', 
    `Street` = 'Vonsemmler Lane', 
    `City` = 'Cedar Fort', 
    `Code` = '8994', 
    `Region` = 'Michigan', 
    `Country` = 'Samoa', 
    `Company` = 'Sitar Bank', 
    `ItIsAdministrator` = 0
where `Id` = 4;

update `USER`
set
    `FirstName` = 'Marguerita', 
    `LastName` = 'Soyland', 
    `Email` = 'marguerita.soyland@mail.com', 
    `Pseudonym` = 'margueritasoyland', 
    `Password` = 've%1rEy', 
    `Phone` = '+81 829 144 213', 
    `Street` = 'Mcarthur Boulevard', 
    `City` = 'Roane', 
    `Code` = '5124', 
    `Region` = 'Kentucky', 
    `Country` = 'Saint Kitts', 
    `Company` = 'Zadow News', 
    `ItIsAdministrator` = 1
where `Id` = 5;

update `ARTICLE`
set
    `SectionId` = 2, 
    `UserId` = 4, 
    `Slug` = 'exalted-one-i-ll-leave-you', 
    `Title` = 'Exalted one I\'ll leave you.', 
    `Text` = 'Talking and are tormenting yourself as wise. Himself he already left me stems from such jokes, o he too sweet voice she put out badly.', 
    `Image` = 'uethicho.png', 
    `Date` = '2012-06-21'
where `Id` = 1;

update `ARTICLE`
set
    `SectionId` = 2, 
    `UserId` = 3, 
    `Slug` = 'to-woman-giving-in-love', 
    `Title` = 'To woman giving in love.', 
    `Text` = 'Merchant with spite of glistened of sleep, business was this repetition this soft smile every creature. Read it without doing anything from horror.', 
    `Image` = 'ukhaster.png', 
    `Date` = '2012-12-28'
where `Id` = 2;

update `ARTICLE`
set
    `SectionId` = 2, 
    `UserId` = 5, 
    `Slug` = 'without-individuality-of-truth', 
    `Title` = 'Without individuality of truth.', 
    `Text` = 'Next person in their holy verses exclaimed loudly. His self this ferry-boat for some kind with hunger, previous births were both when left by simpler means. Be void of desperation had dreamt of.', 
    `Image` = 'nillinse.gif', 
    `Date` = '2012-12-18'
where `Id` = 3;

update `ARTICLE`
set
    `SectionId` = 3, 
    `UserId` = 5, 
    `Slug` = 'didn-t-you-get-over-every-moment', 
    `Title` = 'Didn\'t you get over every moment.', 
    `Text` = 'Many pilgrims you were thoughts just ready like them, pearls he ever a divine arrow shot from me, soul an assistant in the dancing girls the many.', 
    `Image` = 'saribbej.gif', 
    `Date` = '2004-11-02'
where `Id` = 4;

update `ARTICLE`
set
    `SectionId` = 6, 
    `UserId` = 2, 
    `Slug` = 'was-brought-to-humans-in-confirmation', 
    `Title` = 'Was brought to humans in confirmation.', 
    `Text` = 'Leaned to live of sleep properly again, also write very thing over his arm. Glance and disappointment and old in truth can prosper, here was ever before we both ran away. Only saw all things in any sleep.', 
    `Image` = 'nickauri.png', 
    `Date` = '2013-08-18'
where `Id` = 5;

update `ARTICLE`
set
    `SectionId` = 2, 
    `UserId` = 2, 
    `Slug` = 'weren-t-you-practise-meditation-holding-your-work', 
    `Title` = 'Weren\'t you practise meditation holding your work.', 
    `Text` = 'Interrupted him dressed in these clothes for fifteen days. Finding it which the essence bearing his bright robe, turned away neither sleep on many pilgrims do so. Myth had remained thus to luxury scorned nor self-castigation.', 
    `Image` = 'burarkam.png', 
    `Date` = '2012-05-03'
where `Id` = 6;

update `ARTICLE`
set
    `SectionId` = 4, 
    `UserId` = 3, 
    `Slug` = 'thanked-and-wretchedness-he-dreamt-of', 
    `Title` = 'Thanked and wretchedness he dreamt of.', 
    `Text` = 'Learned meditation through a thoughts that always used to, or animallike manner in that obstacle they commanded. They\'ve become entities and wasting his shoulder, here thought I wouldn\'t have heard words, up then again forced isn\'t forced isn\'t it.', 
    `Image` = 'oloknees.png', 
    `Date` = '2005-03-16'
where `Id` = 7;

update `ARTICLE`
set
    `SectionId` = 6, 
    `UserId` = 2, 
    `Slug` = 'previous-thoughts-came-to-consciousness-the-family-of', 
    `Title` = 'Previous thoughts came to consciousness the family of.', 
    `Text` = 'Accustomed to finally free will give me being, interrupted him concerning his voice hovered over her sedan-chair. Came without doing anything else to beg, arrow-fast he observed the exalted the teachers.', 
    `Image` = 'encaetta.png', 
    `Date` = '2011-09-19'
where `Id` = 8;

update `ARTICLE`
set
    `SectionId` = 4, 
    `UserId` = 2, 
    `Slug` = 'his-first-activities-in-itself-this-way', 
    `Title` = 'His first activities in itself this way.', 
    `Text` = 'Always expect it turned all goals all vices, slowly getting a hunter in past not recognise him. Sinner is beginning of dice the monks, distant memory he considered indispensable and voice without clothes.', 
    `Image` = 'iciskeyw.gif', 
    `Date` = '2006-12-23'
where `Id` = 9;

update `ARTICLE`
set
    `SectionId` = 6, 
    `UserId` = 5, 
    `Slug` = 'spoke-wouldn-t-punish-him', 
    `Title` = 'Spoke wouldn\'t punish him.', 
    `Text` = 'Blossomed slowly among travellers stay and merged with ecstasy, himself found blissfulness of life his bed. Questions but still a potter\'s wheel of sounded sweet.', 
    `Image` = 'alibeniu.gif', 
    `Date` = '2009-09-09'
where `Id` = 10;

update `ARTICLE`
set
    `SectionId` = 5, 
    `UserId` = 5, 
    `Slug` = 'felt-at-me-any-more', 
    `Title` = 'Felt at me any more.', 
    `Text` = 'Hasn\'t it suffered for its flow in perfumed waters. Fine food to provide him much longer, that\'s everything for should still has told you again. Is willing to weep petted his own, time I am able to start on hers.', 
    `Image` = 'erigobyd.jpg', 
    `Date` = '2015-05-10'
where `Id` = 11;

update `ARTICLE`
set
    `SectionId` = 7, 
    `UserId` = 1, 
    `Slug` = 'false-god-more-i-do', 
    `Title` = 'False god more I do.', 
    `Text` = 'Opposite bank he posed to avoid evil, other not treat him concerning his body to teach. Others of our boat with made it her eyes, join youth who seemed now grown tired.', 
    `Image` = 'ivedefau.jpg', 
    `Date` = '2004-05-08'
where `Id` = 12;

update `ARTICLE`
set
    `SectionId` = 1, 
    `UserId` = 3, 
    `Slug` = 'offerings-to-accepted-the-repeated-murmuring-the-verse', 
    `Title` = 'Offerings to accepted the repeated murmuring the verse.', 
    `Text` = 'These verses in her gave a parable, lust like my travels not died in many voices. Looked upon people laughed surely I could kidnap you.', 
    `Image` = 'estiguni.jpg', 
    `Date` = '2013-04-04'
where `Id` = 13;

update `ARTICLE`
set
    `SectionId` = 6, 
    `UserId` = 2, 
    `Slug` = 'heard-words-which-can-prosper', 
    `Title` = 'Heard words which can prosper.', 
    `Text` = 'Courtesan had wasted life as and that your child. He once seen with practising those not belong to, do you mean by his impending death. Sun directly in former times to speak. Taught the thought taking control of when every creature.', 
    `Image` = 'gelavaji.png', 
    `Date` = '2011-02-15'
where `Id` = 14;

update `ARTICLE`
set
    `SectionId` = 3, 
    `UserId` = 2, 
    `Slug` = 'had-stopped-looking-for', 
    `Title` = 'Had stopped looking for.', 
    `Text` = 'Me again breathed softly touched shoulder embraced him, all afraid of remote areas of straw for them, clothes are called name the creatures are wise. Want you pilgrims shall please the abandon your riches.', 
    `Image` = 'empatche.png', 
    `Date` = '2005-04-27'
where `Id` = 15;

update `COMMENT`
set
    `ArticleId` = 3, 
    `UserId` = 3, 
    `Text` = 'Cannot be open look at once, exchanged humorous banter with in agreement with. Nodded brushed his years of them. Want back up gave one was accepted.', 
    `DateTime` = '2003-04-18 03:17:27'
where `Id` = 1;

update `COMMENT`
set
    `ArticleId` = 14, 
    `UserId` = 4, 
    `Text` = 'Much and nowhere a mother\'s funeral, stared at bottom already ascended many worries. When they won\'t hit him.', 
    `DateTime` = '2014-11-23 07:30:41'
where `Id` = 2;

update `COMMENT`
set
    `ArticleId` = 10, 
    `UserId` = 2, 
    `Text` = 'Loudly and fro and so much, yes that hatred against its title. Can teach it is small.', 
    `DateTime` = '2011-04-22 10:53:59'
where `Id` = 3;

update `COMMENT`
set
    `ArticleId` = 5, 
    `UserId` = 2, 
    `Text` = 'Deaf and offerings and faces of light, they followed it told him.', 
    `DateTime` = '2007-11-01 06:58:15'
where `Id` = 4;

update `COMMENT`
set
    `ArticleId` = 10, 
    `UserId` = 2, 
    `Text` = 'Spoke wouldn\'t punish me into suffering began, warrior gives me deeply like the water, until they reached a thoughts. Wheel once said this I must refuse.', 
    `DateTime` = '2006-06-06 15:03:34'
where `Id` = 5;

update `COMMENT`
set
    `ArticleId` = 14, 
    `UserId` = 3, 
    `Text` = 'Ferryman in motion will see, deep solemnity he remembered them, her house servants the trade.', 
    `DateTime` = '2008-07-11 16:03:14'
where `Id` = 6;

update `COMMENT`
set
    `ArticleId` = 2, 
    `UserId` = 5, 
    `Text` = 'Bold is mine I do, way for her learned something he said, got some way with it already. Apparently he lay hidden so long.', 
    `DateTime` = '2003-12-17 04:36:57'
where `Id` = 7;

update `COMMENT`
set
    `ArticleId` = 8, 
    `UserId` = 5, 
    `Text` = 'Learned among girls and teach me to, again old in their worries.', 
    `DateTime` = '2002-09-22 08:54:03'
where `Id` = 8;

update `COMMENT`
set
    `ArticleId` = 1, 
    `UserId` = 5, 
    `Text` = 'Clean and waters and again. Want back too and dull life. O he shook himself down right path, children already ascended many times always everything.', 
    `DateTime` = '2007-09-15 05:09:20'
where `Id` = 9;

update `COMMENT`
set
    `ArticleId` = 2, 
    `UserId` = 3, 
    `Text` = 'Mouth is nodded in perfumed waters, all around him just knowing patient. Distorted her red smart said, ran through so I still thus.', 
    `DateTime` = '2001-09-26 18:56:47'
where `Id` = 10;

update `COMMENT`
set
    `ArticleId` = 15, 
    `UserId` = 1, 
    `Text` = 'Yesterday greeting his landlords business, propelling themselves all by annihilating his worries.', 
    `DateTime` = '2008-06-21 16:01:25'
where `Id` = 11;

update `COMMENT`
set
    `ArticleId` = 6, 
    `UserId` = 5, 
    `Text` = 'Urged him don\'t forget him disregard him. Gives merchandise in all people, bad talk of wine a village.', 
    `DateTime` = '2013-05-26 05:35:37'
where `Id` = 12;

update `COMMENT`
set
    `ArticleId` = 14, 
    `UserId` = 4, 
    `Text` = 'I\'ve had heard the glory, man did you to spit at home.', 
    `DateTime` = '2001-05-12 08:24:12'
where `Id` = 13;

update `COMMENT`
set
    `ArticleId` = 10, 
    `UserId` = 2, 
    `Text` = 'Only meal of for twenty-eight days, bowed with praise from an.', 
    `DateTime` = '2012-08-23 07:03:21'
where `Id` = 14;

update `COMMENT`
set
    `ArticleId` = 11, 
    `UserId` = 5, 
    `Text` = 'She said let\'s do this ultimate thirst, is put it moves in secrets.', 
    `DateTime` = '2003-11-20 11:53:04'
where `Id` = 15;

update `COMMENT`
set
    `ArticleId` = 14, 
    `UserId` = 4, 
    `Text` = 'Yes she called timidly for me, than obey your exalted one. Clothes are subject to experience, we\'ll hear my exercises required any further.', 
    `DateTime` = '2012-03-20 16:18:18'
where `Id` = 16;

update `COMMENT`
set
    `ArticleId` = 12, 
    `UserId` = 3, 
    `Text` = 'Black snake was now stopped searching, haven\'t learned knowledge of him, wisdom always get that you\'re right away.', 
    `DateTime` = '2014-08-03 21:47:37'
where `Id` = 17;

update `COMMENT`
set
    `ArticleId` = 15, 
    `UserId` = 3, 
    `Text` = 'Followed him standing where you well, farewell from everywhere in it importance.', 
    `DateTime` = '2015-07-28 17:00:38'
where `Id` = 18;

update `COMMENT`
set
    `ArticleId` = 1, 
    `UserId` = 5, 
    `Text` = 'Us accept any specific intention, in yellow in their position.', 
    `DateTime` = '2013-05-25 03:55:47'
where `Id` = 19;

update `COMMENT`
set
    `ArticleId` = 6, 
    `UserId` = 1, 
    `Text` = 'Full he observed well enough to give, venerable among girls and accept. Had retired from afar to earthly things.', 
    `DateTime` = '2009-03-28 19:15:08'
where `Id` = 20;

update `COMMENT`
set
    `ArticleId` = 2, 
    `UserId` = 1, 
    `Text` = 'Suddenly woke up felt thirst without money, against her head his slim hips. Example hadn\'t been going nowhere.', 
    `DateTime` = '2011-05-15 02:10:43'
where `Id` = 21;

update `COMMENT`
set
    `ArticleId` = 15, 
    `UserId` = 1, 
    `Text` = 'At and stains gets stains and evening, smiling he reached it in love. Cannot deny my guest while for finding.', 
    `DateTime` = '2003-07-04 00:28:58'
where `Id` = 22;

update `COMMENT`
set
    `ArticleId` = 12, 
    `UserId` = 1, 
    `Text` = 'Perhaps benevolent perhaps turn the gods. Are none but when buying bananas. Be servants in return was necessary.', 
    `DateTime` = '2008-02-23 04:39:32'
where `Id` = 23;

update `COMMENT`
set
    `ArticleId` = 5, 
    `UserId` = 4, 
    `Text` = 'Rich and sloth of everything is. False god it happened to rest.', 
    `DateTime` = '2004-01-19 16:15:30'
where `Id` = 24;

update `COMMENT`
set
    `ArticleId` = 15, 
    `UserId` = 4, 
    `Text` = 'Fine oil or mask of paths, without passion of tormenting yourself by many, the ever loved by name of it. Possessions renounced all pretended to beg.', 
    `DateTime` = '2001-01-10 08:01:12'
where `Id` = 25;

update `COMMENT`
set
    `ArticleId` = 15, 
    `UserId` = 5, 
    `Text` = 'Sounded strange and happier now. Smart had gathered his tale, well your friend of desire for this.', 
    `DateTime` = '2008-04-09 06:15:19'
where `Id` = 26;

update `COMMENT`
set
    `ArticleId` = 12, 
    `UserId` = 4, 
    `Text` = 'Remained alien to gather brushwood for her. Son was his expecting vessel was broken, they now no effort to such feats. Still seemed not become tired.', 
    `DateTime` = '2005-03-27 22:32:52'
where `Id` = 27;

update `COMMENT`
set
    `ArticleId` = 10, 
    `UserId` = 3, 
    `Text` = 'Also not reached a verse from horror, ablutions the glow of a. Loudly and dull life at once, willingness my learned what fault in hut.', 
    `DateTime` = '2009-06-15 17:14:41'
where `Id` = 28;

update `COMMENT`
set
    `ArticleId` = 9, 
    `UserId` = 1, 
    `Text` = 'Seeing old spoke to shine, said you\'ve last teacher the ascetics.', 
    `DateTime` = '2014-09-04 09:51:22'
where `Id` = 29;

update `COMMENT`
set
    `ArticleId` = 7, 
    `UserId` = 2, 
    `Text` = 'Loved the gate into its contents, me you ferryman yes several of misery, whom else to discover its voice. Questions he hoped to pretty.', 
    `DateTime` = '2001-10-06 06:58:09'
where `Id` = 30;

update `SUBSCRIBER`
set
    `Name` = 'Fishencord', 
    `Email` = 'maia.lasch@outlook.com'
where `Id` = 1;

update `SUBSCRIBER`
set
    `Name` = 'Luetke', 
    `Email` = 'damita.holton@live.com'
where `Id` = 2;

update `SUBSCRIBER`
set
    `Name` = 'Coddington', 
    `Email` = 'mora.tabalba@live.com'
where `Id` = 3;

update `SUBSCRIBER`
set
    `Name` = 'Bambach', 
    `Email` = 'myrtice.albud@gmail.com'
where `Id` = 4;

update `SUBSCRIBER`
set
    `Name` = 'Thurman', 
    `Email` = 'emilie.pollinzi@live.com'
where `Id` = 5;
