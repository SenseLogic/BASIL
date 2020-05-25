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
    public string
        String,
        Name;
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
    public string
        Location;
    public Tuple<string, string>
        Name;
    public HashSet<Tuple<string, string>>
        NameSet;
    public List<string>
        PhoneList;
    public HashSet<string>
        EmailSet;
    public Dictionary<string, string>
        CompanyMap;
    public DateTime
        SimpleDate;
    public Dictionary<Tuple<string, string>, DateTime>
        SimpleDateMap;
    public HashSet<DateTime>
        SimpleDateSet;
    public List<DateTime>
        SimpleDateList;
    public Dictionary<DateTime, HashSet<Tuple<string, string>>>
        NameSetMap;
    public string
        Text;
    public List<SIMPLE>
        SimplePointerArray;
}

// ~~

public class VALUE
{
    public long
        Id;
    public Guid
        Uuid;
    public string
        Name;
    public int
        Integer;
    public string
        Text;
}

// ~~

public class VALUE_DATA
{
    public Guid
        Uuid;
    public long
        ValueId;
    public Guid
        ValueUuid;
    public long
        InternalId;
    public Guid
        InternalUuid;
    public long
        InternalValueId;
    public Guid
        InternalValueUuid;
}

// ~~

public class INTERNAL_DATA
{
    public long
        Id;
    public Guid
        Uuid;
    public long
        ValueId;
    public Guid
        ValueUuid;
    public string
        FirstName,
        LastName;
    public bool
        IsAwesome;
}

