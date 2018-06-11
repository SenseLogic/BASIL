type ITEM struct {
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

type COLLECTION struct {
    Id int32;
    Tuple INT32,STRING TUPLE;
    Map INT32,STRING MAP;
    Set INT32 SET;
    List INT32 LIST;
    ItemUuid string;
    ItemList UUID LIST;
}

// ~~

