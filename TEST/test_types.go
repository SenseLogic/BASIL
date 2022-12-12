package main;

// -- TYPES

type SIMPLE struct {
    Uuid gocql.UUID;
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
    Name string;
    Date time.Time;
    DateTime time.Time;
    Blob [] byte;
    Option string;
    EnglishText string;
    FrenchText string;
    GermanText string;
    LatinText string;
    SpanishText string;
    Integer int64;
    Natural uint64;
    Real float64;
    Address string;
    CategorySlug string;
    CategoryName string;
    CategorySection string;
}

// ~~

type COMPOUND struct {
    Id int32;
    Location string;
    Name STRING_STRING_TUPLE;
    NameSet STRING_STRING_TUPLE_SET;
    PhoneList STRING_LIST;
    EmailSet STRING_SET;
    CompanyMap STRING_STRING_MAP;
    SimpleDate time.Time;
    SimpleDateMap STRING_STRING_TUPLE_TIME.TIME_MAP;
    SimpleDateSet TIME.TIME_SET;
    SimpleDateList TIME.TIME_LIST;
    NameSetMap TIME.TIME_STRING_STRING_TUPLE_SET_MAP;
    Text string;
    TextArray STRING_LIST;
    OtherTextArray STRING_LIST;
    SimplePointerArray [] * SIMPLE;
}

// ~~

type VALUE struct {
    Tuid string;
    Uuid gocql.UUID;
    Name string;
    Integer int32;
    Text string;
}

// ~~

type VALUE_DATA struct {
    Uuid gocql.UUID;
    ValueTuid string;
    ValueUuid gocql.UUID;
    InternalId int64;
    InternalUuid gocql.UUID;
    InternalValueId int64;
    InternalValueUuid gocql.UUID;
}

// ~~

type INTERNAL_DATA struct {
    Id int64;
    Uuid gocql.UUID;
    ValueTuid string;
    ValueUuid gocql.UUID;
    FirstName string;
    LastName string;
    IsAwesome bool;
}
