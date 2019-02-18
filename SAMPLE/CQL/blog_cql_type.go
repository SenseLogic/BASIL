type SECTION struct {
    Uuid gocql.UUID    `db:"Uuid"`;
    Number uint64    `db:"Number"`;
    Name string    `db:"Name"`;
    Text string    `db:"Text"`;
    Image string    `db:"Image"`;
    ImageIndex uint64    `db:"-"`;
}

// ~~

type USER struct {
    Uuid gocql.UUID    `db:"Uuid"`;
    FirstName string    `db:"FirstName"`;
    LastName string    `db:"LastName"`;
    Email string    `db:"Email"`;
    Pseudonym string    `db:"Pseudonym"`;
    Password string    `db:"Password"`;
    Phone string    `db:"Phone"`;
    Street string    `db:"Street"`;
    City string    `db:"City"`;
    Code string    `db:"Code"`;
    Region string    `db:"Region"`;
    Country string    `db:"Country"`;
    Company string    `db:"Company"`;
    ItIsAdministrator bool    `db:"ItIsAdministrator"`;
}

// ~~

type ARTICLE struct {
    Uuid gocql.UUID    `db:"Uuid"`;
    SectionUuid gocql.UUID    `db:"SectionUuid"`;
    UserUuid gocql.UUID    `db:"UserUuid"`;
    Title string    `db:"Title"`;
    Text string    `db:"Text"`;
    Image string    `db:"Image"`;
    Date string    `db:"Date"`;
    Section * SECTION    `db:"-"`;
    User * USER    `db:"-"`;
    ImageIndex uint64    `db:"-"`;
}

// ~~

type COMMENT struct {
    Uuid gocql.UUID    `db:"Uuid"`;
    ArticleUuid gocql.UUID    `db:"ArticleUuid"`;
    UserUuid gocql.UUID    `db:"UserUuid"`;
    Text string    `db:"Text"`;
    DateTime time.Time    `db:"DateTime"`;
    Article * ARTICLE    `db:"-"`;
    User * USER    `db:"-"`;
}

// ~~

type SUBSCRIBER struct {
    Uuid gocql.UUID    `db:"Uuid"`;
    Name string    `db:"Name"`;
    Email string    `db:"Email"`;
}
