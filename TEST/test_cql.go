type SIMPLE struct {
    Uuid gocql.UUID    `db:"-"`;
    Bool bool    `db:"-"`;
    Int8 int8    `db:"-"`;
    Uint8 uint8    `db:"-"`;
    Int16 int16    `db:"-"`;
    Uint16 uint16    `db:"-"`;
    Int32 int32    `db:"-"`;
    Uint32 uint32    `db:"-"`;
    Int64 int64    `db:"-"`;
    Uint64 uint64    `db:"-"`;
    Float32 float32    `db:"-"`;
    Float64 float64    `db:"-"`;
    String string    `db:"-"`;
    Date string    `db:"-"`;
    DateTime string    `db:"-"`;
    Blob []byte    `db:"-"`;
}

// ~~

type COMPOUND struct {
    Id int32    `db:"-"`;
    Location string    `db:"-"`;
    Name STRING_STRING_TUPLE    `db:"-"`;
    NameSet STRING_STRING_TUPLE_SET    `db:"-"`;
    PhoneList STRING_LIST    `db:"-"`;
    EmailSet STRING_SET    `db:"-"`;
    CompanyMap STRING_STRING_MAP    `db:"-"`;
    SimpleDate string    `db:"-"`;
    SimpleDateMap STRING_STRING_TUPLE_STRING_MAP    `db:"-"`;
    SimpleDateSet STRING_SET    `db:"-"`;
    SimpleDateList STRING_LIST    `db:"-"`;
    NameSetMap STRING_STRING_STRING_TUPLE_SET_MAP    `db:"-"`;
    SimplePointerArray [] * SIMPLE;
}

// ~~

