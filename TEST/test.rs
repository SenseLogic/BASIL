struct SIMPLE
{
    Uuid : String,
    Bool : bool,
    Int8 : i8,
    Uint8 : u8,
    Int16 : i16,
    Uint16 : u16,
    Int32 : i32,
    Uint32 : u32,
    Int64 : i64,
    Uint64 : u64,
    Float32 : f32,
    Float64 : f64,
    String : String,
    Date : String,
    DateTime : String,
    Blob : String
}

struct COMPOUND
{
    Id : i32,
    Location : String,
    Name : (String,String),
    NameSet : List<(String,String)>,
    PhoneList : List<String>,
    EmailSet : List<String>,
    CompanyMap : Map<String,String>,
    SimpleDate : String,
    SimpleDateMap : Map<(String,String),String>,
    SimpleDateSet : List<String>,
    SimpleDateList : List<String>,
    NameSetMap : Map<String,List<(String,String)>>,
    SimplePointerArray : Vec<&SIMPLE>
}

