struct SIMPLE
{
    uuid : String,
    bool : bool,
    int_8 : i8,
    uint_8 : u8,
    int_16 : i16,
    uint_16 : u16,
    int_32 : i32,
    uint_32 : u32,
    int_64 : i64,
    uint_64 : u64,
    float_32 : f32,
    float_64 : f64,
    string : String,
    name : String,
    date : String,
    date_time : String,
    blob : String,
    option : String,
    english_text : String,
    french_text : String,
    german_text : String,
    latin_text : String,
    spanish_text : String
}

// ~~

struct COMPOUND
{
    id : i32,
    location : String,
    name : (String, String),
    name_set : List<(String, String)>,
    phone_list : List<String>,
    email_set : List<String>,
    company_map : Map<String, String>,
    simple_date : String,
    simple_date_map : Map<(String, String), String>,
    simple_date_set : List<String>,
    simple_date_list : List<String>,
    name_set_map : Map<String, List<(String, String)>>,
    text : String,
    simple_pointer_array : Vec<Weak<SIMPLE>>
}

// ~~

struct VALUE
{
    id : i64,
    uuid : String,
    name : String,
    integer : i32,
    text : String
}

// ~~

struct VALUE_DATA
{
    uuid : String,
    value_id : i64,
    value_uuid : String,
    internal_id : i64,
    internal_uuid : String,
    internal_value_id : i64,
    internal_value_uuid : String
}

// ~~

struct INTERNAL_DATA
{
    id : i64,
    uuid : String,
    value_id : i64,
    value_uuid : String,
    first_name : String,
    last_name : String,
    is_awesome : bool
}
