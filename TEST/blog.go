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
    FirstName string `db:"FirstName"`;
    LastName string `db:"LastName"`;
    Email string `db:"Email"`;
    Pseudonym string `db:"Pseudonym"`;
    Password string `db:"Password"`;
    Phone string `db:"Phone"`;
    Street string `db:"Street"`;
    City string `db:"City"`;
    Code string `db:"Code"`;
    Region string `db:"Region"`;
    Country string `db:"Country"`;
    Company string `db:"Company"`;
    ItIsAdministrator bool `db:"ItIsAdministrator"`;
}

// ~~

type ARTICLE struct {
    Id uint64 `db:"Id"`;
    SectionId uint64 `db:"SectionId"`;
    UserId uint64 `db:"UserId"`;
    Title string `db:"Title"`;
    Text string `db:"Text"`;
    Image string `db:"Image"`;
    Date string `db:"Date"`;
    Section * SECTION;
    User * USER;
    ImageIndex uint64;
}

// ~~

type COMMENT struct {
    Id uint64 `db:"Id"`;
    ArticleId uint64 `db:"ArticleId"`;
    UserId uint64 `db:"UserId"`;
    Text string `db:"Text"`;
    DateTime string `db:"DateTime"`;
    Article * ARTICLE;
    User * USER;
}

// ~~

type SUBSCRIBER struct {
    Id uint64 `db:"Id"`;
    Name string `db:"Name"`;
    Email string `db:"Email"`;
}

// ~~

