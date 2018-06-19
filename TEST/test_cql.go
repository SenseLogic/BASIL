type SIMPLE struct {
    Uuid string;
    Bool bool;
    Int8 int8;
    Uint8 uint8;
    Int16 int16;
    Uint16 uint16;
    Int32 int32;
    Uint32 uint32;
    Int64 int64;
    Uint64 uint64;
    Float32 float32;
    Float64 float64;
    String string;
    Date string;
    DateTime string;
    Blob []byte;
}

type COMPOUND struct {
    Id int32;
    Location string;
    Name STRING_STRING_TUPLE;
    NameSet STRING_STRING_TUPLE_SET;
    PhoneList STRING_LIST;
    EmailSet STRING_SET;
    CompanyMap STRING_STRING_MAP;
    SimpleDate string;
    SimpleDateMap STRING_STRING_TUPLE_STRING_MAP;
    SimpleDateSet STRING_SET;
    SimpleDateList STRING_LIST;
    NameSetMap STRING_STRING_STRING_TUPLE_SET_MAP;
    SimplePointerArray [] * SIMPLE `db:"-"`;
}

