type SECTION struct {
    Uuid gocql.UUID    `db:"-"`;
    Number uint64    `db:"-"`;
    Name string    `db:"-"`;
    Text string    `db:"-"`;
    Image string    `db:"-"`;
    ImageIndex uint64;
}

// ~~

type USER struct {
    Uuid gocql.UUID    `db:"-"`;
    FirstName string    `db:"-"`;
    LastName string    `db:"-"`;
    Email string    `db:"-"`;
    Pseudonym string    `db:"-"`;
    Password string    `db:"-"`;
    Phone string    `db:"-"`;
    Street string    `db:"-"`;
    City string    `db:"-"`;
    Code string    `db:"-"`;
    Region string    `db:"-"`;
    Country string    `db:"-"`;
    Company string    `db:"-"`;
    ItIsAdministrator bool    `db:"-"`;
}

// ~~

type ARTICLE struct {
    Uuid gocql.UUID    `db:"-"`;
    SectionId gocql.UUID    `db:"-"`;
    UserId gocql.UUID    `db:"-"`;
    Title string    `db:"-"`;
    Text string    `db:"-"`;
    Image string    `db:"-"`;
    Date string    `db:"-"`;
    Section * SECTION;
    User * USER;
    ImageIndex uint64;
}

// ~~

type COMMENT struct {
    Uuid gocql.UUID    `db:"-"`;
    ArticleId gocql.UUID    `db:"-"`;
    UserId gocql.UUID    `db:"-"`;
    Text string    `db:"-"`;
    DateTime string    `db:"-"`;
    Article * ARTICLE;
    User * USER;
}

// ~~

type SUBSCRIBER struct {
    Uuid gocql.UUID    `db:"-"`;
    Name string    `db:"-"`;
    Email string    `db:"-"`;
}
