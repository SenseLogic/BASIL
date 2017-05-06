type SECTION struct {
    Id uint64 `db:"Id"`;
    Number uint64 `db:"Number"`;
    Name string `db:"Name"`;
    Text string `db:"Text"`;
    Image string `db:"Image"`;
    ArticleIdList string `db:"ArticleIdList"`;
    ImageIndex uint64;
}

// ~~

type USER struct {
    Id uint64 `db:"Id"`;
    Email string `db:"Email"`;
    Pseudonym string `db:"Pseudonym"`;
    Password string `db:"Password"`;
    ItIsAdministrator bool `db:"ItIsAdministrator"`;
}

// ~~

type ARTICLE struct {
    Id uint64 `db:"Id"`;
    SectionId string `db:"SectionId"`;
    UserId string `db:"UserId"`;
    Title string `db:"Title"`;
    Text string `db:"Text"`;
    Image string `db:"Image"`;
    Date string `db:"Date"`;
    Section string;
    User string;
    ImageIndex uint64;
}

// ~~

type COMMENT struct {
    Id uint64 `db:"Id"`;
    ArticleId string `db:"ArticleId"`;
    UserId string `db:"UserId"`;
    Text string `db:"Text"`;
    Date string `db:"Date"`;
    Article string;
    User string;
}

// ~~

type SUBSCRIBER struct {
    Id uint64 `db:"Id"`;
    Name string `db:"Name"`;
    Email string `db:"Email"`;
}

// ~~

