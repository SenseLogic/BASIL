replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Name`, `Text`, `Image`, `ArticleIdList`
    )
    values
    (
        "1",
        "1",
        "Arthur",
        "Drew to hoary age great forest seemed warmed his rays could hear his blood chilled. Parents and hate with sweetest cup of tenderness raise the stand, peak to chant by word checked those sweet loving gratitude. Dreamed that gilds the o'erwrought prince whose drooping branches sound body woven into mine, thyself this twilight reigned and cry of cheer up from ever saw in every step. Adorned with liquid cadence mingled rise in that silent streets, drawing away from whence and buddha with labored steps upon cyclopean columns vast.",
        "ormakaas.jpg",
        ""
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Name`, `Text`, `Image`, `ArticleIdList`
    )
    values
    (
        "2",
        "171",
        "Pouhyet",
        "White scarlet yellow bearing its marble steps have given yet ever varying beauty eating moth, has mighty freight of magic changed to conscious life is purified from him, kapilavastu's king illustrious master thought hers the other castes and sweep our mortal round. Loathsome reptiles and sorrow only guard the knights in gentler games watching meanwhile, save from each vital part o perfect living green with lash swung high.",
        "owskinke.gif",
        ""
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Name`, `Text`, `Image`, `ArticleIdList`
    )
    values
    (
        "3",
        "915",
        "Guindi",
        "In due season tongues meanwhile the bright picture where day no waste of hawk or thief. Perfect living stream sweeps down on power well as sandal and master they sweat and shades, crying most silent dead still slept for charity. E'en for knowledge that like swine to this mighty force in after me, vile as young and nearer clearer than ocean distant desert home. Distilling odors fill with myriad sparks from raging stream, unseen of passions envies lusts to greedy gluttony most royal town.",
        "ougharip.jpg",
        ""
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Name`, `Text`, `Image`, `ArticleIdList`
    )
    values
    (
        "4",
        "613",
        "Hosneld",
        "Silent village stirs with weeds and that sees not there may bloom, resistless by discipline and sought beneath an only heard this world. Revealed the tempest mingling in war was free gifts returned, afraid to sink out their mother when sadly to higher love become thy queen. We born to beasts did through wide open windows filled that from brightest hopes, welcome thus day should men o if I seen in duty's path rugged foot was borne. Brushes away in gay procession issues forth in acts the greatest buddha stood forth, watched them at and craft and heard him stood a child.",
        "ingtaste.jpg",
        ""
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Name`, `Text`, `Image`, `ArticleIdList`
    )
    values
    (
        "5",
        "133",
        "Hoeler",
        "Perchance of knowledge that brahma's self absorbed in skill that buddha's burning brow, what is wisdom words he forward from age with destruction's broom fair and at rest. Drop by evil speaking every cup of lamps to wrong those so far off dust, in health nor martial music seemed and sheep without his lofty horns the chariot race. Clouded his wakened soul of gems to guide these troubled it bathe within to jutting cliffs. Soon his petty griefs that many trod before his brother's love, picture where first of chasing wealth in life's trials joys the man. Found the kingdom gaze they passed six yellow crimson deep musing on earth, eyes upon a widespread lawn bedecked with gems attended by every cloud, without his tongue that scene below the mind with vaulted shade the loom was sorrow's root.",
        "ecklethy.png",
        ""
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        "1",
        "Jesus",
        "Leahy",
        "jesus.leahy@hotmail.com",
        "jesusleahy",
        "ows6kC%okav",
        "+32 736 897 822",
        "5 McCabe Alley",
        "East Duke",
        "3008",
        "Arkansas",
        "Senegal",
        "Livingstone Bank",
        "1"
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        "2",
        "Shamshad",
        "Donak",
        "shamshad.donak@gmail.com",
        "shamshaddonak",
        "gila2l@T",
        "+40 636 830 507",
        "43 Capps Court",
        "Stony Ridge",
        "6436",
        "Delaware",
        "Antigua",
        "Hawken Incorporated",
        "0"
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        "3",
        "Tatyana",
        "OConner",
        "tatyana.oconner@hotmail.com",
        "tatyanaoconner",
        "mFa1#lurkip",
        "+19 420 612 185",
        "69 McNamee Park",
        "Boyceville",
        "7735",
        "Texas",
        "Slovakia",
        "Coriaty Point",
        "1"
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        "4",
        "Nils",
        "Hanser",
        "nils.hanser@yahoo.com",
        "nilshanser",
        "it2ch-eBoQ",
        "+16 825 455 823",
        "65 Tammaro Alley",
        "Grand Saline",
        "9617",
        "Ohio",
        "Kosovo",
        "Matsugu Studio",
        "0"
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        "5",
        "Elliot",
        "Furlow",
        "elliot.furlow@live.com",
        "elliotfurlow",
        "uZ&llo4",
        "+80 546 540 789",
        "78 Rausch Street",
        "Snowdoun",
        "7798",
        "Prince Edward Island",
        "Fiji",
        "Avirett Bank",
        "1"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "1",
        "2",
        "3",
        "Nanda my work while winding streams.",
        "Become like olympic copied ne'er such steps have given, enwrapt the east some on tireless pinions upward way. Descending talk was gently on tireless pinions upward road skirted this living with weeds and castes. Sleep for each a guard the tempest breaks on earth, matreya's self sudata's heart inspiring hope of one.",
        "DamitaDi.gif",
        "2011-10-17"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "2",
        "4",
        "5",
        "Taking sweet and asvajit met his.",
        "Crushing the rainbow tints the plummet in jungles and bow down to each, bow down took root as waves of elephants. Armed with kindly words can cure for gain the pride puffed up, father have found world below he following he regained the hearers heard their second maya home. Sailing from opening west the winds may toss that india's rains force they brought, followed him and o'erwhelm the miles we leave our mortal round. Unanswered questions laughter from brightest gold the daily search, home he rose then war is life fades out. Perforce he freely on shoulder bare all shows hypocrisies and trailing vines hanging from chattering apes, walled by and free me still ringing in rajagriha and calm.",
        "ourlarra.jpg",
        "2008-09-26"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "3",
        "2",
        "3",
        "Fled as on meru's lofty prophecies fulfilled.",
        "May aid instruct and upward devas guide men the pomp and bleeding hearts, wary and kills the strong to want disease and kasyapa doubtful said. Checkered with kind acts in softest tint of pity filled a staff. Northward from trees decayed and that dart from four brahmans famed descendants far south, behind great whirling wheel almost seemed good by, chandala sudra high gothic arch and prizes that makes friends whose cheek blending of care. Adjust the diligent are pure presence all creeping things, warming to bimbasara's gift of nirvana's sun and bring and touched his path. Lascivious lust and wild fear adding speed swept and grace, cherished hopes and ward off on a child and caste that skim lightly danced from below.",
        "eckelyde.png",
        "2001-01-06"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "4",
        "2",
        "5",
        "Boast not gaudy robes benares brought.",
        "Arab and cold drops trickled down the body's ceased. Instant one by all men but as kantaka siddartha's empty show, asked what steps she wished to groveling in giant elephant white scarlet yellow robe. Grow again next the fruitful soil with distance with clumps in sickness sin or enhance, passed gently said a day shall be day he in hopeless age. Though time only saw and string in peace had not herself. Untaught as fondest mother when his rays could not aside with pride of fragrant oils, thyself this dusty leader's face away as highest law for final victory, except the perfect all material fire of mail.",
        "ingangli.gif",
        "2015-06-02"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "5",
        "5",
        "5",
        "Six trembling shadows played.",
        "We have found their master's eye was parched and clothed in with blood, kasyapa as we turn aside to quicken time sends their lives. Wheel dash in him tremble quiver with lurid flames each his earnestness, help each living memory I've heard forgot his ancient wound. Yes noble eightfold path since gone out her features of whitest ivory polished arms, hid in fitting robes finer than words like merchants he following on.",
        "oinskyza.gif",
        "2000-08-25"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "6",
        "5",
        "4",
        "Clouded his brahman choir responsive to blow.",
        "Saluted in rich in white beard grown old age of preparation tells. What your heart can cure for many mansions full complete. Unnumbered funeral rites and with song had watched them is best. Next stand as victors came next full many to ocean's swelling tones of iron fly. Rolled on slender bamboo shoots up with matron grace, danced from death's dark shadows fall his inmost chamber of light. Rush to toil and opening seas were satisfied the mountain high risen infant clasp.",
        "ennallau.png",
        "2009-12-17"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "7",
        "1",
        "5",
        "Together went weary breathless he grew.",
        "Hanging from such giving is used to serve, receiving coarsest food met his couch where piercing thorns that leads to trees. Misty and dry the waste your board is clothed as spotless wool, measure of mellow sweet queen maya sleeping city crowned and headlong age brings feebleness. Swoop down the hunted hart for higher presence was, rolled from some towering cliff to heavenly manna fed the robber's guide.",
        "Riekiere.gif",
        "2008-11-01"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "8",
        "5",
        "4",
        "Toward varanassi hoping that dance in little arms.",
        "Spreading plains were bows until the azure vault above. Enticing men could not use my power command his daily round gained that precious seed, seemed yielding food met the germ of all. Sweep our every wayside flower embroidered purple robes exquisite taste. Toward sailagiri hill one and ghostly shadows so kind acts the queens of war. Forgetting now rich sudata bowed head thrust forward passed, begging from door his brahman youth bearing all theft and falling spray, along his holy caste our weary traveler wandering o'er the ganges' yellow stream as dead. Hearing this glittering like that sweetens daily lives.",
        "achateuk.jpg",
        "2008-11-04"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "9",
        "5",
        "3",
        "Next their law the golden fruit.",
        "Women and touched his mission ceased to clasp my sons to and lighter than life. Thy queen was strong that risen infant clasp my maya the cumbrous load each to fade, enbowered in triumph home with love's own cure him stood. Ye who ceased to earth's dark lurid light glide smoothly on power, engaged turn to death nirvana hail my latest breath bewailing others' sorrows end.",
        "lehinnau.gif",
        "2013-08-15"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "10",
        "3",
        "4",
        "Welcome him would greet that waits for hate.",
        "Walled on ropes swung high vault was not on every tone. Sunset ushers in faith not waste another round her lord, straight to save for weary waiting men have gathered dust. Absorbed and whirls the taste human foot the surface of faces lines of grandeur stand, looks down upon this vihara gatavana called devas guide their birth to solid rocks. Women dishonored mutilated slain now stranger than all creeping things, cringes in smiles as king drank in sleep well. Indulge no generous wish no thorns no end, untrod immense that I forget how creeds o precious truth forgot.",
        "owaAdiMe.jpg",
        "2008-12-04"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "11",
        "4",
        "5",
        "Crossing the unseen worlds.",
        "Bringing gifts from ever blooming youth and melted mountain goat to hear and grandeur joined', because I can break the round this dead world was stirred, as at the world's decline still he heard his wakened soul. Bringing gifts and kalpas pass to raise a humble part, stretching far distant plain circling its silent glittering mountain sea of early manhood's early prime. Shrink from whence and seek for those sacred shrines. Named kantaka siddartha's natal day star fades from harsh unloving word, unlike that swell proud teachers and bustle in galleries with dazzling light was fled.",
        "pipoutho.jpg",
        "2008-09-04"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "12",
        "2",
        "3",
        "Eagles soaring toward varanassi gone by.",
        "Naked to everything that on bended knees locked in proud gunga's kiss its mighty prince, swung high the romans loved of greater mind. Regil my dwelling place their funeral trains in two laughing ever widening wound, might wake next full in his gentle stateliness, such earnestness replied but calm his joyous laugh as gathering clouds are never full. Afraid to age when three chosen lamps thick an if not nothing within to living truth, groping in bactria whence this scene below the rites ordained by breath rising mists.",
        "adejasiu.jpg",
        "2011-07-08"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "13",
        "2",
        "1",
        "Dispels the robber's guide familiar with celestial light.",
        "Bringing gifts that just fled on sakwal on tireless birds burst of ropes, giving light will had parted one bid a hair on prancing babylonians firmly held. Concealed among the wailing notes soft cashmere wool. Pause not death bravest men but one leader one born love their fathers clearly stood forth, none staying him by magic rose from their scabbards leap. No royal son the hunted hart for though time on through busy bustling throng, stirred by step was dark again sent up, gentle youth succeeding palsied leaning on their sweet jasmine vines. Rice picked grain of joys that darkness disappears, sustain a son return with feet like ocean's foam.",
        "hasahele.png",
        "2009-11-27"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "14",
        "5",
        "4",
        "Reveals the blinding their nights with years.",
        "Chests expanded and can i need of perpetual fire of his dwelling there. Called him come where summer nests by decay. Emblem of heaven when i left of steeds. Atair my rahula stretched aloft while yawning chasm so light to death. Watched and ocean's sands no mountains far kosala rich sudata sharply said, profoundly learned in other clung to wash the world renowned a love, life's sweetest notes the angry winds and a cliff crowned his hearth is best.",
        "ideLouie.jpg",
        "2006-01-16"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "15",
        "5",
        "1",
        "Asokas one eternal rest.",
        "Begging bowl was joy his ablutions made from an outer wall of wedded love, oppressed and send me much on ropes swung high low levels mounts from sin. Loaded the architect of beasts shall burrow where giant mountain sloping west and earth to guide. Horses yoked to sneer at the thunder's roll the fold. Shaded drives him tell them to let us as rich in feats of bread. Down with measured step by long years the veil of faith not their boy, built by eager to pierce your gold the hill.",
        "iggoviMo.gif",
        "2014-06-10"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "1",
        "13",
        "1",
        "Transfigured seemed ever ask in life's goal, quicker than enough he turned. Wonder on dyaus pittar brahma leads, feeling for who by grain.",
        "2002-07-22 19:20:07"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "2",
        "15",
        "2",
        "Stood his years the stand, pause not feel something of cherub smile.",
        "2006-01-03 12:11:06"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "3",
        "7",
        "2",
        "Wooded terraced or whither he knew. Heir to sting each heart would rule.",
        "2000-09-02 13:40:40"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "4",
        "1",
        "3",
        "Sent and having tasted seen nirvana's verge. Bidding her vina tuned to find.",
        "2011-01-19 19:03:15"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "5",
        "2",
        "3",
        "I go where'er the faithless hollow truce, stirs all such souls joined with life. Sails have nests by him. Soothed him pass on power.",
        "2001-06-03 16:10:50"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "6",
        "9",
        "2",
        "Lest with gold to punishment, proud embassies and leafless fruitless trunk. Descended chaos shone upon cyclopean columns vast.",
        "2004-05-14 08:38:28"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "7",
        "3",
        "3",
        "Goats and mind with such earnestness. Near its site in gossip of day. Well filled his brief and proud, full and press their hot spouting blood.",
        "2006-09-01 13:42:47"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "8",
        "2",
        "2",
        "Have trod and lilies overspread, 'tis but mara's myriads of deadly shock. At trumpet's sound like ours that lives.",
        "2009-06-01 01:45:32"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "9",
        "2",
        "5",
        "Shaking with shuddering horror shook the right, arriving home stretch soon despise. Clapping her dream might yet in line.",
        "2004-04-11 07:06:58"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "10",
        "6",
        "3",
        "Parents but in purest light grew dim, bathed in paradise primordial peace. Sunset ushers in robes benares maid, planted in counsel and open plain.",
        "2012-12-07 05:25:19"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "11",
        "2",
        "3",
        "Big tear drops of pity charity replied, glittered as sandal trees of outward things. Tender lover tasting love's own escape. Teaching the brook that end bends north.",
        "2011-09-13 17:58:08"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "12",
        "14",
        "1",
        "Gilding at trumpet's call his noble steed, be absorbed and final goal. Channa left of old hesiod sang.",
        "2010-10-19 16:26:37"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "13",
        "1",
        "3",
        "Still the jungle's savage winter to trees, wasted with trees and resting place. Wheel dash far more northern nests.",
        "2009-01-16 17:19:04"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "14",
        "1",
        "1",
        "O'er wastes of culture's lip, among the ear with parching thirst.",
        "2013-04-14 20:17:20"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "15",
        "1",
        "2",
        "Filling the source of universal love, fearless resistless as phosphorescent flames.",
        "2008-07-02 15:15:04"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "16",
        "2",
        "1",
        "Or fleet as men have their hands, that carpeted his brothers fight. Most silent hour preceding day assigned, praying the past of softest wool.",
        "2010-03-17 03:21:22"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "17",
        "15",
        "3",
        "Secrets are eager steeds of mind, raptured gaze of chasing wealth in need. Winding by matter's blinding folds, transfigured seemed good scarce could give.",
        "2006-06-28 04:53:55"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "18",
        "11",
        "5",
        "Great whirling clouds of eternal rest, fearless of ropes swung high.",
        "2002-03-02 14:32:37"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "19",
        "8",
        "3",
        "Each his garments of preparation tells, o'erhangs a chariot and hate. Among the north some precious seed.",
        "2003-11-20 01:16:13"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "20",
        "14",
        "1",
        "Pollutes the hot emulation fired, still would tip the gods. Wondering that skirts the victim down.",
        "2014-02-24 03:41:35"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "21",
        "5",
        "2",
        "Upborne upon cyclopean columns vast expanse, heedless of terrors there her silent hour.",
        "2001-09-28 10:29:02"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "22",
        "14",
        "5",
        "Danced from where day all material fire. King bimbasara from public ear, let us its sacred hymns, joined by self is still.",
        "2009-07-27 23:43:56"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "23",
        "2",
        "5",
        "Breathe and earth as words. Silent sea and sweet notes. Profoundly learned from home with light. Leaving behind this little round.",
        "2007-02-18 12:04:49"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "24",
        "6",
        "3",
        "Less sad for many happy day. Combined endurance beauty passing near.",
        "2003-11-06 10:56:06"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "25",
        "9",
        "3",
        "Beneath peaceful reign they fall the heavens, bringing gifts from buddha's burning brow.",
        "2004-02-24 19:33:46"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "26",
        "9",
        "1",
        "Awed by art can doubt. Rung sweet as forest leaves, building huge stone his feet like this.",
        "2012-02-15 08:23:52"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "27",
        "2",
        "2",
        "Men on sphere on bended knee, rolled his mind but hears. Fearless of usefulness and shunned by all.",
        "2010-09-12 15:30:22"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "28",
        "14",
        "2",
        "Perennial from him but rising sneer. Fit time measured tread this enduring love, father and pains of densest shade. Pass unmoved by doubling all external pomp.",
        "2011-08-17 21:13:24"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "29",
        "11",
        "4",
        "Purna said thrice happy life, sweet home in sacred vessels sacrificial robes. Laid down phalgu's swollen stream, gropes blindly but over her.",
        "2000-07-06 11:27:16"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "30",
        "3",
        "1",
        "Illustrious and full before the himalayan chain, asked their matin song's of himalaya's peaks, blindly grope blindly grope blindly on. Rising toward a protector lost.",
        "2005-07-24 05:02:06"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        "1",
        "Leckie",
        "torey.siew@gmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        "2",
        "Mucci",
        "star.vanderhooft@live.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        "3",
        "ParkerShane",
        "nando.zuccarelli@live.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        "4",
        "Tsenter",
        "larissa.cicek@hotmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        "5",
        "Scherer",
        "koo.traut@live.com"
    );

