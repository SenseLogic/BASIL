type SECTION struct {
    Id uint64    `db:"Id"`;
    Number uint64    `db:"Number"`;
    Name string    `db:"Name"`;
    Text string    `db:"Text"`;
    Image string    `db:"Image"`;
    ImageIndex uint64    `db:"-"`;
}

// ~~

type USER struct {
    Id uint64    `db:"Id"`;
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
    Id uint64    `db:"Id"`;
    SectionId uint64    `db:"SectionId"`;
    UserId uint64    `db:"UserId"`;
    Title string    `db:"Title"`;
    Text string    `db:"Text"`;
    Image string    `db:"Image"`;
    Date time.Time    `db:"Date"`;
    Section * SECTION    `db:"-"`;
    User * USER    `db:"-"`;
    ImageIndex uint64    `db:"-"`;
}

// ~~

type COMMENT struct {
    Id uint64    `db:"Id"`;
    ArticleId uint64    `db:"ArticleId"`;
    UserId uint64    `db:"UserId"`;
    Text string    `db:"Text"`;
    DateTime time.Time    `db:"DateTime"`;
    Article * ARTICLE    `db:"-"`;
    User * USER    `db:"-"`;
}

// ~~

type SUBSCRIBER struct {
    Id uint64    `db:"Id"`;
    Name string    `db:"Name"`;
    Email string    `db:"Email"`;
}
