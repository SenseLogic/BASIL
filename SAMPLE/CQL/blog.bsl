BLOG | count 5

    SECTION

        Uuid : UUID | key, unique
        Number : UINT64
        Name : STRING
        Text : STRING
        Image : STRING

        ImageIndex : UINT64 | !stored

    USER

        Uuid : UUID | key, unique
        FirstName : STRING
        LastName : STRING
        Email : STRING
        Pseudonym : STRING
        Password : STRING
        Phone : STRING
        Street : STRING
        City : STRING
        Code : STRING
        Region : STRING
        Country : STRING
        Company : STRING
        ItIsAdministrator : BOOL

    ARTICLE | count 15

        Uuid : UUID | key, unique
        SectionUuid : SECTION.Uuid | indexed
        UserUuid : USER.Uuid | indexed
        Title : STRING
        Text : STRING
        Image : STRING
        Date : DATE

        Section : POINTER[ SECTION ] | !stored
        User : POINTER[ USER ] | !stored
        ImageIndex : UINT64 | !stored

    COMMENT | count 30

        Uuid : UUID | key, unique
        ArticleUuid : ARTICLE.Uuid | indexed
        UserUuid : USER.Uuid | indexed
        Text : STRING | english 2 4 5 7
        DateTime : DATETIME

        Article : POINTER[ ARTICLE ] | !stored
        User : POINTER[ USER ] | !stored

    SUBSCRIBER

        Uuid : UUID | key, unique
        Name : STRING
        Email : STRING

    %SECTION

        Number Name

            1 ~ Sports
            2 ~ Gaming
            3 ~ Entertainment
            4 ~ Science
            5 ~ History
            6 ~ Travel
            7 ~ Finance
