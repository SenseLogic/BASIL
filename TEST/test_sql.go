type SIMPLE struct {
    Uuid string `db:"Uuid"`;
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

// ~~

type COMPOUND struct {
    Id int32 `db:"Id"`;
    Location string `db:"Location"`;
    Name TUPLE[FirstName:STRING,LastName:STRING] `db:"Name"`;
    NameSet SET[TUPLE[FirstName:STRING,LastName:STRING]] `db:"NameSet"`;
    PhoneList LIST[Phone:STRING] `db:"PhoneList"`;
    EmailSet SET[Email:STRING] `db:"EmailSet"`;
    CompanyMap MAP[Phone:STRING,Company:STRING] `db:"CompanyMap"`;
    SimpleDate string `db:"SimpleDate"`;
    SimpleDateMap MAP[COMPOUND.Name,SIMPLE.Date] `db:"SimpleDateMap"`;
    SimpleDateSet SET[SIMPLE.Date] `db:"SimpleDateSet"`;
    SimpleDateList LIST[SIMPLE.Date] `db:"SimpleDateList"`;
    NameSetMap MAP[SIMPLE.Date,COMPOUND.NameSet] `db:"NameSetMap"`;
    SimplePointerArray [] * SIMPLE;
}

// ~~

