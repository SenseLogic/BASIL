type SIMPLE struct {
    Uuid gocql.UUID `db:"Uuid"`;
    Bool bool `db:"Bool"`;
    Int8 int8 `db:"Int8"`;
    Uint8 uint8 `db:"Uint8"`;
    Int16 int16 `db:"Int16"`;
    Uint16 uint16 `db:"Uint16"`;
    Int32 int32 `db:"Int32"`;
    Uint32 uint32 `db:"Uint32"`;
    Int64 int64 `db:"Int64"`;
    Uint64 uint64 `db:"Uint64"`;
    Float32 float32 `db:"Float32"`;
    Float64 float64 `db:"Float64"`;
    String string `db:"String"`;
    Date string `db:"Date"`;
    DateTime string `db:"DateTime"`;
    Blob []byte `db:"Blob"`;
}

type COMPOUND struct {
    Id int32 `db:"Id"`;
    Location string `db:"Location"`;
    Name STRING_STRING_TUPLE `db:"Name"`;
    NameSet STRING_STRING_TUPLE_SET `db:"NameSet"`;
    PhoneList STRING_LIST `db:"PhoneList"`;
    EmailSet STRING_SET `db:"EmailSet"`;
    CompanyMap STRING_STRING_MAP `db:"CompanyMap"`;
    SimpleDate string `db:"SimpleDate"`;
    SimpleDateMap STRING_STRING_TUPLE_STRING_MAP `db:"SimpleDateMap"`;
    SimpleDateSet STRING_SET `db:"SimpleDateSet"`;
    SimpleDateList STRING_LIST `db:"SimpleDateList"`;
    NameSetMap STRING_STRING_STRING_TUPLE_SET_MAP `db:"NameSetMap"`;
    SimplePointerArray [] * SIMPLE;
}

