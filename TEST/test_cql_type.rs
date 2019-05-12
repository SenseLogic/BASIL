struct SIMPLE
{
    uuid : String,
    bool : bool,
    int8 : i8,
    uint8 : u8,
    int16 : i16,
    uint16 : u16,
    int32 : i32,
    uint32 : u32,
    int64 : i64,
    uint64 : u64,
    float32 : f32,
    float64 : f64,
    string : String,
    date : String,
    date_time : String,
    blob : String
}

// ~~

struct COMPOUND
{
    id : i32,
    location : String,
    name : ( String, String ),
    name_set : List< ( String, String ) >,
    phone_list : List< String >,
    email_set : List< String >,
    company_map : Map< String, String >,
    simple_date : String,
    simple_date_map : Map< ( String, String ), String >,
    simple_date_set : List< String >,
    simple_date_list : List< String >,
    name_set_map : Map< String, List< ( String, String ) > >,
    simple_pointer_array : Vec< Weak< SIMPLE > >
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

struct DATA
{
    uuid : String,
    value_id : i64,
    value_uuid : String
}
