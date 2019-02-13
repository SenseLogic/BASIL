BLOG | count 5

    SECTION

        Id : UINT64 | key, unique, incremented
        Number : UINT64
        Name : STRING | capacity 45
        Text : STRING
        Image : STRING | capacity 45

        ImageIndex : UINT64 | !stored

    USER

        Id : UINT64 | key, unique, incremented
        FirstName : STRING | capacity 45
        LastName : STRING | capacity 45
        Email : STRING | capacity 45
        Pseudonym : STRING | capacity 45
        Password : STRING | capacity 45
        Phone : STRING | capacity 45
        Street : STRING
        City : STRING | capacity 45
        Code : STRING | capacity 45
        Region : STRING | capacity 45
        Country : STRING | capacity 45
        Company : STRING | capacity 45
        ItIsAdministrator : BOOL

    ARTICLE | count 15

        Id : UINT64 | key, unique, incremented
        SectionId : SECTION.Id | indexed
        UserId : USER.Id | indexed
        Title : STRING
        Text : STRING
        Image : STRING | capacity 45
        Date : DATE

        Section : POINTER[ SECTION ] | !stored
        User : POINTER[ USER ] | !stored
        ImageIndex : UINT64 | !stored

    COMMENT | count 30

        Id : UINT64 | key, unique, incremented
        ArticleId : ARTICLE.Id | indexed
        UserId : USER.Id | indexed
        Text : STRING | english 2 4 5 7
        DateTime : DATETIME

        Article : POINTER[ ARTICLE ] | !stored
        User : POINTER[ USER ] | !stored

    SUBSCRIBER

        Id : UINT64 | key, unique, incremented
        Name : STRING | capacity 45
        Email : STRING | capacity 45

    %SECTION

        Number Name

            1 ~ Sports
            2 ~ Gaming
            3 ~ Entertainment
            4 ~ Science
            5 ~ History
            6 ~ Travel
            7 ~ Finance

    %USER

        FirstName LastName Email Pseudonym Password ItIsAdministrator

            Rick ~ Deckard ~ root@mail.com ~ root ~ root ~ true

