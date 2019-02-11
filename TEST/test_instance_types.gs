package main;

type SIMPLE struct {
    gocql.UUID Uuid;
    bool Bool;
    int8 Int8;
    uint8 Uint8;
    int16 Int16;
    uint16 Uint16;
    int32 Int32;
    uint32 Uint32;
    int64 Int64;
    uint64 Uint64;
    float32 Float32;
    float64 Float64;
    string String;
    string Date;
    string DateTime;
    []byte Blob;
}

// ~~

type COMPOUND struct {
    int32 Id;
    string Location;
    STRING_STRING_TUPLE Name;
    STRING_STRING_TUPLE_SET NameSet;
    STRING_LIST PhoneList;
    STRING_SET EmailSet;
    STRING_STRING_MAP CompanyMap;
    string SimpleDate;
    STRING_STRING_TUPLE_STRING_MAP SimpleDateMap;
    STRING_SET SimpleDateSet;
    STRING_LIST SimpleDateList;
    STRING_STRING_STRING_TUPLE_SET_MAP NameSetMap;
    [] * SIMPLE SimplePointerArray;
}

// ~~

type VALUE struct {
    gocql.UUID Uuid;
    string Name;
    int32 Integer;
    string Text;
}

// ~~

type DATA struct {
    gocql.UUID Uuid;
    gocql.UUID ValueUuid;
}

// ~~



