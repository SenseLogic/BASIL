replace into `TEST`.`ITEM`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Date`, `DateTime`, `Blob`
    )
    values
    (
        "36275442729505760384692250154719",
        "0",
        "86",
        "1",
        "567",
        "903",
        "387",
        "387",
        "979",
        "13",
        "99.67",
        "36.53",
        "Lipakommeh",
        "2006-05-08",
        "2006-07-05 01:20:38",
        "505930101795329556045171545122813531361622254814433763035321448424028193913291010198"
    );

replace into `TEST`.`ITEM`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Date`, `DateTime`, `Blob`
    )
    values
    (
        "63146332515117300304138260844565",
        "1",
        "85",
        "69",
        "842",
        "849",
        "790",
        "679",
        "273",
        "801",
        "62.05",
        "91.55",
        "Bilauligoj",
        "2005-11-02",
        "2015-09-12 13:42:33",
        "12384056843444899475652940233763417103602716111663452335532742463"
    );

replace into `TEST`.`ITEM`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Date`, `DateTime`, `Blob`
    )
    values
    (
        "85597464846234128522661612160553",
        "0",
        "90",
        "69",
        "514",
        "333",
        "196",
        "544",
        "52",
        "12",
        "57.66",
        "86.35",
        "Recalekulury",
        "2001-07-28",
        "2001-07-16 16:25:02",
        "4521604562738638225858434847383514858174517255439483718353482861134343492259252637243341546647554236"
    );

replace into `TEST`.`COLLECTION`
    (
        `Id`, `Tuple`, `Map`, `Set`, `List`, `ItemUuid`, `ItemList`
    )
    values
    (
        "1",
        "",
        "",
        "",
        "",
        "36275442729505760384692250154719",
        ""
    );

replace into `TEST`.`COLLECTION`
    (
        `Id`, `Tuple`, `Map`, `Set`, `List`, `ItemUuid`, `ItemList`
    )
    values
    (
        "2",
        "",
        "",
        "",
        "",
        "63146332515117300304138260844565",
        ""
    );

replace into `TEST`.`COLLECTION`
    (
        `Id`, `Tuple`, `Map`, `Set`, `List`, `ItemUuid`, `ItemList`
    )
    values
    (
        "3",
        "",
        "",
        "",
        "",
        "63146332515117300304138260844565",
        ""
    );

