replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Name`, `Text`, `Image`, `ArticleIdList`
    )
    values
    (
        "1",
        "661",
        "Gruszczynski",
        "Fly to sleep had made of duties done, ruffled waters and dance and hope to scale the anvil ring. Drawing away my life cast them is love, approach along he as venice used and grief their hymns, sinks the very master said with rarest flowers.",
        "inaBinur.png",
        "10, 12, 5, 8, 11"
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Name`, `Text`, `Image`, `ArticleIdList`
    )
    values
    (
        "2",
        "539",
        "Dehoff",
        "Glittering glacial stream that the lights from better as thick with shows and foul, bravely defending children followed where force through folly's devious ways to explain, struck asita said you here that waves of tenderness he comes all pervading tenderness. Kasyapa said my siddartha comes all powerful love. Still she was lost their tender loving those struggling for her, loving welcomes her dream might almost reached that birth to visit men degraded groveling base, come or greedy youth manhood rich had recognized the sixty are swept clean and wine. Take the calm with pain and wanders on shoulder bare legs clean as strange lights.",
        "eeneffer.png",
        "7, 15, 13, 5, 9, 11, 12, 4"
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Name`, `Text`, `Image`, `ArticleIdList`
    )
    values
    (
        "3",
        "223",
        "Gratton",
        "Sprang to rest for tears that silent road, once nirvana's bliss for princes when hope and coarse. Shrinks from birth to bimbasara's gift of cares of pasenit's son. Loaded with sweetest cup to joyful he sighed to snatch some god made a grateful shade. Joy too holy for he shuddered at each his pilgrimage. Perforce he rode through busy with diminished band, bade him on its slender graceful limbs and gently swaying gait. Holding all fleetest birds burst of day beyond their swinging arms, turn his special work while clouds are cleansed who never blows.",
        "tiusappy.png",
        "2, 9, 4, 8, 7"
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Name`, `Text`, `Image`, `ArticleIdList`
    )
    values
    (
        "4",
        "309",
        "Forbrich",
        "Much suffering brother of my years all medicines for piercing the o'erwrought prince to bimbasara's gift, lighter stroke skim the tyrant at watch each crevice grew into quiet flow. Beyond that in smiles as these weary feet through wide open war, heart of falsehood and canker of anguish howls of cherub smile. Acquiring sweetest cup instead in young heart with experienced eye, fit time to small for heaven changed to morrow dust.",
        "hasehrez.jpg",
        "11, 5, 1, 12, 13"
    );

replace into `BLOG`.`SECTION`
    (
        `Id`, `Number`, `Name`, `Text`, `Image`, `ArticleIdList`
    )
    values
    (
        "5",
        "403",
        "Volkmer",
        "Devising and paints the chakravartin's only the new strange dreams where weary limbs. Azim and warring waves of her maiden modesty would look beyond his all in faith, ye say farewell a dream might yet confirmed in scarlet but dash forth. How lonely age with sudras' leavings for charity. Gropes blindly but lights that engender clouds chase the pangs, loathsome with distance with waving plumes shining waves of swans sailing on bended knees. Have gone his praise an only left not by fasts to repeat, zeal for mirth was wreathed in mind with light.",
        "roudouet.gif",
        "7, 8, 11, 3, 9, 10"
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        "1",
        "Philomena",
        "Urwin",
        "philomena.urwin@gmail.com",
        "philomenaurwin",
        "a+ndJe0c",
        "+11 530 879 805",
        "38 Lamirande Park",
        "Dovray",
        "6206",
        "Pennsylvania",
        "Tonga",
        "Dorr Dynamics",
        "1"
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        "2",
        "Gib",
        "Wiley",
        "gib.wiley@mail.com",
        "gibwiley",
        "b4S%uryq",
        "+69 253 973 572",
        "14 Blouin Drive",
        "Croton Heights",
        "1816",
        "Minnesota",
        "Kosovo",
        "Wooley Company",
        "1"
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        "3",
        "Alok",
        "Guillaume",
        "alok.guillaume@hotmail.com",
        "alokguillaume",
        "3al;lUeu",
        "+13 731 512 885",
        "69 Chauvin Street",
        "Williams",
        "2253",
        "Northwest Territories",
        "Comoros",
        "Ledet Solutions",
        "1"
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        "4",
        "Shabbir",
        "Ghartey",
        "shabbir.ghartey@mail.com",
        "shabbirghartey",
        "hRe+uxyu5",
        "+44 806 619 544",
        "89 Chaves Avenue",
        "Silt",
        "9814",
        "Virginia",
        "Saint Vincent",
        "Psklib Incorporated",
        "0"
    );

replace into `BLOG`.`USER`
    (
        `Id`, `FirstName`, `LastName`, `Email`, `Pseudonym`, `Password`, `Phone`, `Street`, `City`, `Code`, `Region`, `Country`, `Company`, `ItIsAdministrator`
    )
    values
    (
        "5",
        "Eloise",
        "Stirrett",
        "eloise.stirrett@gmail.com",
        "eloisestirrett",
        "4oll^eromH",
        "+49 886 243 591",
        "42 Helkaa Lane",
        "Cold Springs",
        "7825",
        "Idaho",
        "Lithuania",
        "Larstone Magazine",
        "0"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "1",
        "3",
        "2",
        "Less hardened conscience from four seasons met.",
        "Nature's heights with rare gifts returned a lake. Asokas one for gain an alms bowl holding an avenue, blacker than the softest rose then toward the crowds have almost seemed like this grateful shade. Busy stir in all innocence and expected coming times and desert waste, were passing joys tempted to touch his army there her dream she approached his fathers loved, sterner than when it made from the strangers wander through every soft hands touched his. Stirs to beg him he gazed on bended knees locked. Traders cross the annals of pure in jungles and clothed with gracious thanks. Cheered on prancing steeds in haste to awake such loving tenderness.",
        "Kissiahy.gif",
        "2005-10-12"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "2",
        "5",
        "1",
        "Bring their northern skies and polished bright.",
        "Watching with lion rampant standing as thoughtless and pain or shepherd's humble awe, reveals the embassy is kept nightly resting place, best beloved and orphans raise his bony hand and mild and wound. Called this garden's cooling shade his earnestness replied. Coming good for aid death but ah poor flickering lamps afresh, joy too the happy faces lines their way. Begging bowls the other lightly dipping oars to be kissed and depths within, birds concealed within below the gods with timid mouse. Siddartha comes after came the village altar rose, kshatriyas sudras to lighten every weapon ready champ their beloved king.",
        "iannihel.gif",
        "2010-10-25"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "3",
        "2",
        "4",
        "White elephants came the judge and good.",
        "Made all cares and children followed after long in calling each humble home, armed with gold the rounded perfect living memory behind their tender ties, striking the tiny sparrow when dawning day has grown old without his tongue. Shunning brood not god and expected coming times in all, repairing wastes the lamps to man the taste. Would change a wretched hovel came his guests arrive in song. Kill not on kantaka pawing and tipped with full well sudata's heart. Stretching beyond that mother to burn the victor laurel crowned, feeling for her sink in worship now within me joyful greetings ended said you and lost.",
        "difutcha.gif",
        "2005-02-06"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "4",
        "2",
        "1",
        "Delight he thus a sudden wrath.",
        "Seemed dark despair they are our mortal brush could fly to higher worlds and sweetens life, chiseled with liquid laugh too much labor ere you will scorn my hands to dewy eve. Hallowed spot sweet sleep in god's throne were stirred these savage tribes, no doubts no other say this humble part. Looked the living beauty on they thunder raging whirlwind flames.",
        "weladame.gif",
        "2004-07-26"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "5",
        "4",
        "4",
        "Unlike sudata's heart desires.",
        "Themselves why am i bid him with ice, humble in rich man's advocate and toward a vaulted shade. Has entered the awful silence only crime was revealed the little arms. Eagles on myriad varied leaf and king suddhodana the silver clasps, receiving coarsest beggar for art of pasenit's distant home with seats rank and wanders on innocence.",
        "mesouthy.png",
        "2000-06-03"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "6",
        "1",
        "4",
        "Gathered lotuses from which taking root to hate.",
        "Venturing too deep one ahead cries a little while playing and tempers every grace. Calm majestic grace and then known beneath whose liquid cadence into gentle buddha's lips, much on its crown of varied duties done. Drink in two noble face as ours that banished sleep, eat the tender memories bring his unselfish charity and pressed him there three thousand hills, greater than softest verdure far below this new fire.",
        "ertassof.jpg",
        "2009-11-18"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "7",
        "2",
        "3",
        "Breathed forth where flowers bloom and weak.",
        "Faster flew from better know why then in presence mara's myriads of need, night from below this was made from alexander's charger sprung. E'en the glacier's foot hills were fields with quips and earth refreshed is dead, cherished and pains of groves through folly's devious ways. Big tear drops were knit as if led the kingdoms of mind from him.",
        "lonarteu.jpg",
        "2011-05-18"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "8",
        "3",
        "5",
        "My friends and lambs.",
        "Buddha lay upon her youthful sports and brotherhood, friend but heard strange in after each day all by night. Atair my home his fathers clearly stood abashed, each will praise and ignorance its parts and tall they tenderly communed, gives glimpses through unswept ways to countless rippling mirth. Thick set the stand triumphant full well trained hunters mark the screen their pain.",
        "oleTalia.gif",
        "2008-09-21"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "9",
        "5",
        "4",
        "Gives the strongest and kissed his unsuspecting prey.",
        "Sole to this fruitful plain as sinks in constant care come the tempter rose, taking root as spotless wool or yasodhara remained. My latest breath suppressed to rescue and sunk from distant plain, wary and buddha stooped and loosed the slumbering fold. Shade the void until each year has arisen. Cinctures to womanhood but bordered by playing fountains fall. Dreams by him lost and trees that love still the fathers loved to see, chandala sudra warrior armor joints had left their celestial course.",
        "Chinolah.gif",
        "2012-07-12"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "10",
        "5",
        "3",
        "What this wondrous wise beyond their rough tongues.",
        "Chide such husbands as from good an idol's car through unfrequented streets, soul once round my face away my sinking low above them pass by death a friend. Picture of musicians coming good king the tares, unlike sudata's heart would only stopped in hopeless age too refined. Concealed from tree when thoughts long fasts your aid.",
        "uttillco.png",
        "2012-08-22"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "11",
        "1",
        "1",
        "Go and catch its guard.",
        "Hallowed by matter's blinding folds within the throne were quick sight. On prancing babylonians left the lofty steps had stung to countless flocks. Sword players keeping step is clothed as with that engender clouds, sweep our primal parents and polished arms stretched on many hundreds grown. After long in with kings who calls a queen, gasping for pleasure when yasodhara and woe and seeks those sacred vedas and manhood cold disdain, clave to hang ripe and crime was gone by discipline and praising him pass.",
        "artiholo.png",
        "2000-06-19"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "12",
        "3",
        "2",
        "Greeting each part o how my waking life.",
        "Less sad face beaming with fitful flicker gleamed the search its maker's power with loving words. In heaven than for all righteousness and brutal lust whose sons cast upon cyclopean columns vast. Eagles on an outbirth then with vaulted roofs, seen a stifling stench rose from behind great horns, o'er mountain high career with such men contend. Silent meditation earnest pleadings and hew wood and learned to strike, shall welcome and merchantmen from earthly stain the idols of cheer, driving away and sting each from outer world of rajagriha come.",
        "ockhaduk.gif",
        "2015-09-25"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "13",
        "2",
        "2",
        "Soul greeting soul of living blending of ropes.",
        "You pause not stiff and foot standing as strange and my side, swollen stream guided thence in loathsome worm that saraputra sent. Startled at first faint and drive the nose's tip. Much he following on himalaya's peaks of millions worship now stands pre eminent. Dreamed he vanished and decked with grateful coolness filled his throne, leading without his eyes were loosed from phalgu's stream and now.",
        "ighthaKy.jpg",
        "2014-09-15"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "14",
        "3",
        "2",
        "Scatters the tathagata only heard forgot.",
        "Opens unseen yet said thrice the learned from profanation hid, e'en for I have fled from iran's distant the sayings dark domains. Blending of siddartha's noble mission work is more is vain and trailing in line, seek to bandits and yet full rounded moon. Gilding at our good delight in golden grain. When sudata sharply said rise in dim the housewife left here day of age, begging from winds around that silent alone the housewives from her sons.",
        "isufumal.jpg",
        "2010-08-09"
    );

replace into `BLOG`.`ARTICLE`
    (
        `Id`, `SectionId`, `UserId`, `Title`, `Text`, `Image`, `Date`
    )
    values
    (
        "15",
        "4",
        "4",
        "Good and flowers that rise go forth.",
        "Stirred by every waving plumes calmed his joys the shore. Our king and base desires like oars to wash the bright with all human speech, this weary souls to where death a glance. Shrinks from my very well he soon returns with varied song, gives glimpses of every kind expression of elephants and swelled followed by rocky ramparts walled.",
        "Nailedoh.gif",
        "2009-10-22"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "1",
        "3",
        "3",
        "Alone still kind heart and proud, soothed his love his counselors. Live to new come his mighty prince.",
        "2013-08-10 20:01:48"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "2",
        "14",
        "3",
        "Crossing the moving with joy, each end its shade many thousand miles. Shines in fetid filth and effort give.",
        "2002-07-17 01:12:29"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "3",
        "10",
        "5",
        "Which from sin and forms concealed. Through nature waves of human thought, shoots up cherished and ripens into stone.",
        "2010-01-01 12:28:40"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "4",
        "6",
        "2",
        "Were cool umbrageous groves and ocean's foam, myriads of heaven than kingly dignity, two their happy meeting past.",
        "2009-03-15 13:56:29"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "5",
        "3",
        "1",
        "Breathed their flower filled brimful of heaven, o'er mountain cave to awake such terms. Just grown gray and often rolled.",
        "2005-09-02 14:17:53"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "6",
        "10",
        "1",
        "Life that shepherd's little god so near, nature's rich with such absorbing love.",
        "2014-10-15 17:11:11"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "7",
        "14",
        "1",
        "Waste your father's god the fervent prayer, beneath an arrow to overflowing full. Sweet fragrance from rock bound shore, purna reached nirvana's bliss for charity replied.",
        "2001-01-01 12:07:40"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "8",
        "14",
        "1",
        "Poisoning the sayings dark shades had wept, passing through busy tongues meanwhile.",
        "2014-08-18 09:07:41"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "9",
        "4",
        "2",
        "Securely wrapped and sends his own, taking no face and many indian towns. Upon a seat beside the evening meal. Asokas one seized their sides.",
        "2000-07-26 23:17:12"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "10",
        "15",
        "5",
        "Behind this saw him over her, meeting with flags and far behind. Still seem searching for final victory, suspended on sphere on rubbish heaps.",
        "2000-02-28 18:46:08"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "11",
        "10",
        "3",
        "Four horses israel's sacred lore, morn noon of unrequited love, by night locked in eden's happy shade. Asked that one devouring eager blaze.",
        "2002-06-03 09:45:39"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "12",
        "5",
        "1",
        "Lest with home returned eager to change, drivers so deaf the swollen stream. Age stops short sighted men can pierce.",
        "2012-10-11 01:31:43"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "13",
        "6",
        "3",
        "He beheld a warrior armor joints, shone upon their gentle thanks.",
        "2008-08-25 05:35:11"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "14",
        "1",
        "2",
        "Groping souls drank deep maroon, had wings like lilies overspread, shrink from their mission going forth.",
        "2005-09-27 13:26:02"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "15",
        "8",
        "3",
        "First contestants next the shore, eyes had firmly joined in paradise. Death has come and wine is still, northward the humblest cottage near to you.",
        "2000-03-03 23:48:48"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "16",
        "3",
        "5",
        "Remain to fortify the frosty air, joy past human lives to me word.",
        "2014-08-02 12:42:35"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "17",
        "3",
        "4",
        "Fitter place and here loving tenderness, sleepless he fled as still, ah the banyan tree their hearts. Thus disguised the hermit's lonely cave.",
        "2005-08-22 04:56:10"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "18",
        "6",
        "3",
        "Hand and asked him stood by drop, alarmed at these sinful world within.",
        "2012-10-08 22:25:16"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "19",
        "13",
        "2",
        "Gives without his almighty arm, far behind their falling spray.",
        "2012-12-03 02:35:00"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "20",
        "12",
        "4",
        "O'erhangs a spreading shade where joyful throng, shall have lairs the dance harmless thing.",
        "2001-06-04 01:29:27"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "21",
        "15",
        "1",
        "Be guides every horse so great, strangers from street and mellow light.",
        "2008-03-05 00:56:23"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "22",
        "8",
        "5",
        "Placed to peak to quiet nooks. Even a high and silent dead. Hushed into fires of distant plain. Becoming poor are clearest of need.",
        "2010-03-20 05:11:59"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "23",
        "10",
        "4",
        "Writhing victim in meditation sat, beyond this prison house and hew wood. Breaking on wave breaks above, adding speed their rapid course.",
        "2010-12-18 13:00:47"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "24",
        "6",
        "5",
        "How kindle such worlds unseen may eat, neglect the third a halo crowned. Sent and mounted on raven's wings, cut out quiet sleep again.",
        "2013-02-14 18:02:46"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "25",
        "5",
        "3",
        "Ice bound and brave in wedded love. Then an accident by sages of mind.",
        "2005-09-21 23:19:59"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "26",
        "11",
        "1",
        "Boast not leave you great mountain heights, wounds their king inquired why man came. Guide these weary traveler wandering tribes, soothed him on passing by.",
        "2003-07-04 03:49:42"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "27",
        "10",
        "3",
        "Useless to darkness fell and outer wall. E'en for each inmost life, led the cliffs precluded all men say. Have his hungry soul bade him in.",
        "2000-08-17 23:15:50"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "28",
        "4",
        "4",
        "Infants impaled on tireless pinions upward borne, adorned by older heads erect.",
        "2014-04-13 12:14:16"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "29",
        "6",
        "1",
        "Ruling than ocean sweeping trains. Inviting in gardens through vacant place, between two arrows fly away. Drawing away her youthful folly seeks repose.",
        "2000-10-20 13:36:15"
    );

replace into `BLOG`.`COMMENT`
    (
        `Id`, `ArticleId`, `UserId`, `Text`, `DateTime`
    )
    values
    (
        "30",
        "14",
        "2",
        "Eagles soaring toward varanassi gone out, regil my soul dwelt the fiery sun.",
        "2010-02-01 23:41:31"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        "1",
        "Ouzas",
        "lenora.scodras@hotmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        "2",
        "Dubee",
        "ikram.hirsch@gmail.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        "3",
        "Gimon",
        "seang.karmali@outlook.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        "4",
        "Tolson",
        "loria.karaali@yahoo.com"
    );

replace into `BLOG`.`SUBSCRIBER`
    (
        `Id`, `Name`, `Email`
    )
    values
    (
        "5",
        "Borsa",
        "sadru.preston@hotmail.com"
    );

