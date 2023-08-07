struct SECTION
{
    id : u64,
    number : u64,
    slug : String,
    name : String,
    text : String,
    image : String,
    image_index : u64
}

// ~~

struct USER
{
    id : u64,
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
    id : u64,
    section_id : u64,
    user_id : u64,
    slug : String,
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
    id : u64,
    article_id : u64,
    user_id : u64,
    text : String,
    date_time : String,
    article : Weak<ARTICLE>,
    user : Weak<USER>
}

// ~~

struct SUBSCRIBER
{
    id : u64,
    name : String,
    email : String
}
