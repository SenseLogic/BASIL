type ITEM struct {
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

type COLLECTION struct {
    Id int32 `db:"Id"`;
    Tuple INT32/STRING TUPLE `db:"Tuple"`;
    Map INT32/STRING MAP `db:"Map"`;
    Set INT32 SET `db:"Set"`;
    List INT32 LIST `db:"List"`;
    ItemUuid string `db:"ItemUuid"`;
    ItemList ITEM LIST `db:"ItemList"`;
}

// ~~

