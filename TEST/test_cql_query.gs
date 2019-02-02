func AddDatabaseSimple(
    simple * SIMPLE,
    error_code * ERROR_CODE
    ) bool
{
    simple.Uuid = gocql.TimeUUID();

    error_
        := DatabaseSession.Query(
               "insert into SIMPLE( Uuid, Bool, Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float32, Float64, String, Date, DateTime, Blob ) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )",
               simple.Uuid,
               simple.Bool,
               simple.Int8,
               simple.Uint8,
               simple.Int16,
               simple.Uint16,
               simple.Int32,
               simple.Uint32,
               simple.Int64,
               simple.Uint64,
               simple.Float32,
               simple.Float64,
               simple.String,
               simple.Date,
               simple.DateTime,
               simple.Blob
               ).Exec();

    if ( error_ != nil )
    {
        error_code.Set( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseSimple(
    simple * SIMPLE,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into SIMPLE( Uuid, Bool, Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float32, Float64, String, Date, DateTime, Blob ) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )",
               simple.Uuid,
               simple.Bool,
               simple.Int8,
               simple.Uint8,
               simple.Int16,
               simple.Uint16,
               simple.Int32,
               simple.Uint32,
               simple.Int64,
               simple.Uint64,
               simple.Float32,
               simple.Float64,
               simple.String,
               simple.Date,
               simple.DateTime,
               simple.Blob
               ).Exec();

    if ( error_ != nil )
    {
        error_code.Set( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseSimple(
    simple * SIMPLE,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "delete from SIMPLE where Uuid = ?",
               simple.Uuid
               ).Exec();

    if ( error_ != nil )
    {
        error_code.Set( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseSimple(
    simple * SIMPLE,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "select Bool, Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float32, Float64, String, Date, DateTime, Blob from SIMPLE where Uuid = ?",
               simple.Uuid
               )
               .Consistency( gocql.One )
               .Scan(
                    &simple.Bool,
                    &simple.Int8,
                    &simple.Uint8,
                    &simple.Int16,
                    &simple.Uint16,
                    &simple.Int32,
                    &simple.Uint32,
                    &simple.Int64,
                    &simple.Uint64,
                    &simple.Float32,
                    &simple.Float64,
                    &simple.String,
                    &simple.Date,
                    &simple.DateTime,
                    &simple.Blob
                    );

    if ( error_ != nil )
    {
        error_code.Set( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseSimpleArray(
    simple_array * [] SIMPLE,
    error_code * ERROR_CODE
    ) bool
{
    var
        simple SIMPLE;

    iterator
        := DatabaseSession.Query(
               "select Uuid, Bool, Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float32, Float64, String, Date, DateTime, Blob from SIMPLE"
               )
               .Consistency( gocql.One )
               .Iter();

    *simple_array = make( [] SIMPLE, 0, 128 );

    for iterator.Scan(
            &simple.Uuid,
            &simple.Bool,
            &simple.Int8,
            &simple.Uint8,
            &simple.Int16,
            &simple.Uint16,
            &simple.Int32,
            &simple.Uint32,
            &simple.Int64,
            &simple.Uint64,
            &simple.Float32,
            &simple.Float64,
            &simple.String,
            &simple.Date,
            &simple.DateTime,
            &simple.Blob
            )
    {
        simple_array.append( simple );
    }

    error_ := iterator.Close();

    if ( error_ != nil )
    {
        error_code.Set( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func AddDatabaseCompound(
    compound * COMPOUND,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into COMPOUND( Location, Name, NameSet, PhoneList, EmailSet, CompanyMap, SimpleDate, SimpleDateMap, SimpleDateSet, SimpleDateList, NameSetMap ) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )",
               compound.Location,
               compound.Name,
               compound.NameSet,
               compound.PhoneList,
               compound.EmailSet,
               compound.CompanyMap,
               compound.SimpleDate,
               compound.SimpleDateMap,
               compound.SimpleDateSet,
               compound.SimpleDateList,
               compound.NameSetMap
               ).Exec();

    if ( error_ != nil )
    {
        error_code.Set( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseCompound(
    compound * COMPOUND,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into COMPOUND( Id, Location, Name, NameSet, PhoneList, EmailSet, CompanyMap, SimpleDate, SimpleDateMap, SimpleDateSet, SimpleDateList, NameSetMap ) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )",
               compound.Id,
               compound.Location,
               compound.Name,
               compound.NameSet,
               compound.PhoneList,
               compound.EmailSet,
               compound.CompanyMap,
               compound.SimpleDate,
               compound.SimpleDateMap,
               compound.SimpleDateSet,
               compound.SimpleDateList,
               compound.NameSetMap
               ).Exec();

    if ( error_ != nil )
    {
        error_code.Set( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseCompound(
    compound * COMPOUND,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "delete from COMPOUND where Id = ?",
               compound.Id
               ).Exec();

    if ( error_ != nil )
    {
        error_code.Set( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseCompound(
    compound * COMPOUND,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "select Location, Name, NameSet, PhoneList, EmailSet, CompanyMap, SimpleDate, SimpleDateMap, SimpleDateSet, SimpleDateList, NameSetMap, SimplePointerArray from COMPOUND where Id = ?",
               compound.Id
               )
               .Consistency( gocql.One )
               .Scan(
                    &compound.Location,
                    &compound.Name,
                    &compound.NameSet,
                    &compound.PhoneList,
                    &compound.EmailSet,
                    &compound.CompanyMap,
                    &compound.SimpleDate,
                    &compound.SimpleDateMap,
                    &compound.SimpleDateSet,
                    &compound.SimpleDateList,
                    &compound.NameSetMap,
                    &compound.SimplePointerArray
                    );

    if ( error_ != nil )
    {
        error_code.Set( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseCompoundArray(
    compound_array * [] COMPOUND,
    error_code * ERROR_CODE
    ) bool
{
    var
        compound COMPOUND;

    iterator
        := DatabaseSession.Query(
               "select Id, Location, Name, NameSet, PhoneList, EmailSet, CompanyMap, SimpleDate, SimpleDateMap, SimpleDateSet, SimpleDateList, NameSetMap from COMPOUND"
               )
               .Consistency( gocql.One )
               .Iter();

    *compound_array = make( [] COMPOUND, 0, 128 );

    for iterator.Scan(
            &compound.Id,
            &compound.Location,
            &compound.Name,
            &compound.NameSet,
            &compound.PhoneList,
            &compound.EmailSet,
            &compound.CompanyMap,
            &compound.SimpleDate,
            &compound.SimpleDateMap,
            &compound.SimpleDateSet,
            &compound.SimpleDateList,
            &compound.NameSetMap
            )
    {
        compound_array.append( compound );
    }

    error_ := iterator.Close();

    if ( error_ != nil )
    {
        error_code.Set( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}
