package main;

// -- IMPORTS

import "fmt";

// -- FUNCTIONS

func main(
    )
{
    fmt.Println( "Tables :" );
    fmt.Println( "    SIMPLE, " );
    fmt.Println( "        Columns : Uuid, Bool, Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float32, Float64, String, Name, Date, DateTime, Blob" );
    fmt.Println( "        Key columns : Uuid" );
    fmt.Println( "        Non key columns : Bool, Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float32, Float64, String, Name, Date, DateTime, Blob" );
    fmt.Println( "        Stored columns : Uuid, Bool, Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float32, Float64, String, Name, Date, DateTime, Blob" );
    fmt.Println( "        Stored key columns : Uuid, " );
    fmt.Println( "        Stored non key columns : Bool, Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float32, Float64, String, Name, Date, DateTime, Blob" );
    fmt.Println( "        Non stored columns : " );
    fmt.Println( "        Non stored key columns : " );
    fmt.Println( "        Non stored kon key columns : " );
    fmt.Println( "    COMPOUND, " );
    fmt.Println( "        Columns : Id, Location, Name, NameSet, PhoneList, EmailSet, CompanyMap, SimpleDate, SimpleDateMap, SimpleDateSet, SimpleDateList, NameSetMap, SimplePointerArray" );
    fmt.Println( "        Key columns : Id" );
    fmt.Println( "        Non key columns : Location, Name, NameSet, PhoneList, EmailSet, CompanyMap, SimpleDate, SimpleDateMap, SimpleDateSet, SimpleDateList, NameSetMap, SimplePointerArray" );
    fmt.Println( "        Stored columns : Id, Location, Name, NameSet, PhoneList, EmailSet, CompanyMap, SimpleDate, SimpleDateMap, SimpleDateSet, SimpleDateList, NameSetMap" );
    fmt.Println( "        Stored key columns : Id, " );
    fmt.Println( "        Stored non key columns : Location, Name, NameSet, PhoneList, EmailSet, CompanyMap, SimpleDate, SimpleDateMap, SimpleDateSet, SimpleDateList, NameSetMap, " );
    fmt.Println( "        Non stored columns : SimplePointerArray" );
    fmt.Println( "        Non stored key columns : " );
    fmt.Println( "        Non stored kon key columns : SimplePointerArray" );
    fmt.Println( "    VALUE, " );
    fmt.Println( "        Columns : Id, Uuid, Name, Integer, Text" );
    fmt.Println( "        Key columns : Id" );
    fmt.Println( "        Non key columns : Uuid, Name, Integer, Text" );
    fmt.Println( "        Stored columns : Id, Uuid, Name, Integer, Text" );
    fmt.Println( "        Stored key columns : Id, " );
    fmt.Println( "        Stored non key columns : Uuid, Name, Integer, Text" );
    fmt.Println( "        Non stored columns : " );
    fmt.Println( "        Non stored key columns : " );
    fmt.Println( "        Non stored kon key columns : " );
    fmt.Println( "    VALUE_DATA" );
    fmt.Println( "        Columns : Uuid, ValueId, ValueUuid" );
    fmt.Println( "        Key columns : Uuid" );
    fmt.Println( "        Non key columns : ValueId, ValueUuid" );
    fmt.Println( "        Stored columns : Uuid, ValueId, ValueUuid" );
    fmt.Println( "        Stored key columns : Uuid, " );
    fmt.Println( "        Stored non key columns : ValueId, ValueUuid" );
    fmt.Println( "        Non stored columns : " );
    fmt.Println( "        Non stored key columns : " );
    fmt.Println( "        Non stored kon key columns : " );
    fmt.Println( "Stored tables : SIMPLE, COMPOUND, VALUE, VALUE_DATA" );
    fmt.Println( "Non stored tables : " );
}
