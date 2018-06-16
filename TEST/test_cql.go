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

// ~~

type COMPOUND struct {
    Id int32;
    Location string;
    Name TUPLE[FirstName:STRING,LastName:STRING];
    NameSet SET[TUPLE[FirstName:STRING,LastName:STRING]];
    CompanyMap MAP[Phone:STRING,Company:STRING];
    EmailSet SET[Email:STRING];
    PhoneList LIST[Phone:STRING];
    SimpleDate string;
    SimpleDateMap MAP[COMPOUND.Name,SIMPLE.Date];
    SimpleDateSet SET[SIMPLE.Date];
    SimpleDateList LIST[SIMPLE.Date];
    NameSetMap MAP[SIMPLE.Date,COMPOUND.NameSet];
    SimplePointerArray [] * SIMPLE `db:"-"`;
}

// ~~

