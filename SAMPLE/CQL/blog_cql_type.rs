struct SECTION
{
    uuid : String,
    number : u64,
    name : String,
    text : String,
    image : String,
    image_index : u64
}

// ~~

struct USER
{
    uuid : String,
    first_name : String,
    last_name : String,
    email : String,
    pseudonym : String,
    password : String,
    phone : String,
    street : String,
    city : String,
    code : String,
    region : String,
    country : String,
    company : String,
    it_is_administrator : bool
}

// ~~

struct ARTICLE
{
    uuid : String,
    section_id : String,
    user_id : String,
    title : String,
    text : String,
    image : String,
    date : String,
    section : Weak<SECTION>,
    user : Weak<USER>,
    image_index : u64
}

// ~~

struct COMMENT
{
    uuid : String,
    article_id : String,
    user_id : String,
    text : String,
    date_time : String,
    article : Weak<ARTICLE>,
    user : Weak<USER>
}

// ~~

struct SUBSCRIBER
{
    uuid : String,
    name : String,
    email : String
}
