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
    public String
        Text;
    public List< SIMPLE >
        SimplePointerArray;
}

// ~~

public class VALUE
{
    public long
        Id;
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
    public String
        FirstName,
        LastName;
    public bool
        IsAwesome;
}
