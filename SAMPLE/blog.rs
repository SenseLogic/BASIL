struct SECTION
{
    Id : u64,
    Number : u64,
    Name : String,
    Text : String,
    Image : String,
    ImageIndex : u64
}

struct USER
{
    Id : u64,
    FirstName : String,
    LastName : String,
    Email : String,
    Pseudonym : String,
    Password : String,
    Phone : String,
    Street : String,
    City : String,
    Code : String,
    Region : String,
    Country : String,
    Company : String,
    ItIsAdministrator : bool
}

struct ARTICLE
{
    Id : u64,
    SectionId : u64,
    UserId : u64,
    Title : String,
    Text : String,
    Image : String,
    Date : String,
    Section : &SECTION,
    User : &USER,
    ImageIndex : u64
}

struct COMMENT
{
    Id : u64,
    ArticleId : u64,
    UserId : u64,
    Text : String,
    DateTime : String,
    Article : &ARTICLE,
    User : &USER
}

struct SUBSCRIBER
{
    Id : u64,
    Name : String,
    Email : String
}

