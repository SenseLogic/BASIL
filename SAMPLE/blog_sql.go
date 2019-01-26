type SECTION struct {
    Id uint64 `db:"-"`;
    Number uint64 `db:"-"`;
    Name string `db:"-"`;
    Text string `db:"-"`;
    Image string `db:"-"`;
    ImageIndex uint64;
}

// ~~

type USER struct {
    Id uint64 `db:"-"`;
    FirstName string `db:"-"`;
    LastName string `db:"-"`;
    Email string `db:"-"`;
    Pseudonym string `db:"-"`;
    Password string `db:"-"`;
    Phone string `db:"-"`;
    Street string `db:"-"`;
    City string `db:"-"`;
    Code string `db:"-"`;
    Region string `db:"-"`;
    Country string `db:"-"`;
    Company string `db:"-"`;
    ItIsAdministrator bool `db:"-"`;
}

// ~~

type ARTICLE struct {
    Id uint64 `db:"-"`;
    SectionId uint64 `db:"-"`;
    UserId uint64 `db:"-"`;
    Title string `db:"-"`;
    Text string `db:"-"`;
    Image string `db:"-"`;
    Date string `db:"-"`;
    Section * SECTION;
    User * USER;
    ImageIndex uint64;
}

// ~~

type COMMENT struct {
    Id uint64 `db:"-"`;
    ArticleId uint64 `db:"-"`;
    UserId uint64 `db:"-"`;
    Text string `db:"-"`;
    DateTime string `db:"-"`;
    Article * ARTICLE;
    User * USER;
}

// ~~

type SUBSCRIBER struct {
    Id uint64 `db:"-"`;
    Name string `db:"-"`;
    Email string `db:"-"`;
}

// ~~

