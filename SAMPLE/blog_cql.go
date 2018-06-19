type SECTION struct {
    Id uint64;
    Number uint64;
    Name string;
    Text string;
    Image string;
    ImageIndex uint64 `db:"-"`;
}

type USER struct {
    Id uint64;
    FirstName string;
    LastName string;
    Email string;
    Pseudonym string;
    Password string;
    Phone string;
    Street string;
    City string;
    Code string;
    Region string;
    Country string;
    Company string;
    ItIsAdministrator bool;
}

type ARTICLE struct {
    Id uint64;
    SectionId uint64;
    UserId uint64;
    Title string;
    Text string;
    Image string;
    Date string;
    Section * SECTION `db:"-"`;
    User * USER `db:"-"`;
    ImageIndex uint64 `db:"-"`;
}

type COMMENT struct {
    Id uint64;
    ArticleId uint64;
    UserId uint64;
    Text string;
    DateTime string;
    Article * ARTICLE `db:"-"`;
    User * USER `db:"-"`;
}

type SUBSCRIBER struct {
    Id uint64;
    Name string;
    Email string;
}

