replace into `TEST`.`ITEM`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Date`, `DateTime`, `Blob`
    )
    values
    (
        "26286152201095051215221155553453",
        "1",
        "74",
        "31",
        "452",
        "540",
        "749",
        "349",
        "432",
        "526",
        "59.98",
        "96.41",
        "Orekowyn",
        "2008-04-20",
        "2008-07-21 00:17:59",
        "141622473930985844264040336462326235224164963142560301293856"
    );

replace into `TEST`.`ITEM`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Date`, `DateTime`, `Blob`
    )
    values
    (
        "27603746334415818433435541944723",
        "1",
        "10",
        "73",
        "640",
        "878",
        "993",
        "166",
        "70",
        "861",
        "61.12",
        "37.62",
        "Elmarsettero",
        "2002-10-13",
        "2000-02-27 13:07:47",
        "4319485647424143444328543825205601731274443421"
    );

replace into `TEST`.`ITEM`
    (
        `Uuid`, `Bool`, `Int8`, `Uint8`, `Int16`, `Uint16`, `Int32`, `Uint32`, `Int64`, `Uint64`, `Float32`, `Float64`, `String`, `Date`, `DateTime`, `Blob`
    )
    values
    (
        "20244238275949584312861443455263",
        "0",
        "12",
        "57",
        "735",
        "421",
        "79",
        "312",
        "934",
        "773",
        "10.64",
        "65.33",
        "Lanara",
        "2006-05-21",
        "2005-06-12 13:44:04",
        "29542195937405454422827375425261020316117231583761115330826513343695141051291713911322863"
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
        "27603746334415818433435541944723",
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
        "20244238275949584312861443455263",
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
        "27603746334415818433435541944723",
        ""
    );
