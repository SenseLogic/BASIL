// -- IMPORTS

using System;
using System.Collections.Generic;

// -- TYPES

public class SIMPLE
{
    public Guid
        Uuid;
    public bool
        Bool;
    public sbyte
        Int8;
    public byte
        Uint8;
    public int
        Int16;
    public uint
        Uint16;
    public int
        Int32;
    public uint
        Uint32;
    public long
        Int64;
    public ulong
        Uint64;
    public float
        Float32;
    public double
        Float64;
    public String
        String;
    public DateTime
        Date,
        DateTime;
    public String
        Blob;
}

// ~~

public class COMPOUND
{
    public int
        Id;
    public String
        Location;
    public Tuple< String, String >
        Name;
    public HashSet< Tuple< String, String > >
        NameSet;
    public List< String >
        PhoneList;
    public HashSet< String >
        EmailSet;
    public Dictionary< String, String >
        CompanyMap;
    public DateTime
        SimpleDate;
    public Dictionary< Tuple< String, String >, DateTime >
        SimpleDateMap;
    public HashSet< DateTime >
        SimpleDateSet;
    public List< DateTime >
        SimpleDateList;
    public Dictionary< DateTime, HashSet< Tuple< String, String > > >
        NameSetMap;
    public List< SIMPLE >
        SimplePointerArray;
}

// ~~

public class VALUE
{
    public Guid
        Uuid;
    public String
        Name;
    public int
        Integer;
    public String
        Text;
}

// ~~

public class DATA
{
    public Guid
        Uuid,
        ValueUuid;
}
