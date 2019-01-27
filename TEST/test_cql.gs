type SIMPLE struct {
    Uuid gocql.UUID `db:"-"`;
    Bool bool `db:"-"`;
    Int8 int8 `db:"-"`;
    Uint8 uint8 `db:"-"`;
    Int16 int16 `db:"-"`;
    Uint16 uint16 `db:"-"`;
    Int32 int32 `db:"-"`;
    Uint32 uint32 `db:"-"`;
    Int64 int64 `db:"-"`;
    Uint64 uint64 `db:"-"`;
    Float32 float32 `db:"-"`;
    Float64 float64 `db:"-"`;
    String string `db:"-"`;
    Date string `db:"-"`;
    DateTime string `db:"-"`;
    Blob []byte `db:"-"`;
}

// ~~

type COMPOUND struct {
    Id int32 `db:"-"`;
    Location string `db:"-"`;
    Name STRING_STRING_TUPLE `db:"-"`;
    NameSet STRING_STRING_TUPLE_SET `db:"-"`;
    PhoneList STRING_LIST `db:"-"`;
    EmailSet STRING_SET `db:"-"`;
    CompanyMap STRING_STRING_MAP `db:"-"`;
    SimpleDate string `db:"-"`;
    SimpleDateMap STRING_STRING_TUPLE_STRING_MAP `db:"-"`;
    SimpleDateSet STRING_SET `db:"-"`;
    SimpleDateList STRING_LIST `db:"-"`;
    NameSetMap STRING_STRING_STRING_TUPLE_SET_MAP `db:"-"`;
    SimplePointerArray [] * SIMPLE;
}

// ~~

func AddDatabaseSimple(
    simple * SIMPLE
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
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseSimple(
    simple * SIMPLE
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
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseSimple(
    simple * SIMPLE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "delete from SIMPLE where Uuid = ?",
               simple.Uuid
               ).Exec();

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseSimple(
    simple * SIMPLE
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
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func AddDatabaseCompound(
    compound * COMPOUND
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
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseCompound(
    compound * COMPOUND
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
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseCompound(
    compound * COMPOUND
    ) bool
{
    error_
        := DatabaseSession.Query(
               "delete from COMPOUND where Id = ?",
               compound.Id
               ).Exec();

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseCompound(
    compound * COMPOUND
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
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func WriteJsonSimple(
    response_writer http.ResponseWriter,
    simple * SIMPLE
    )
{
    WriteJsonText( response_writer, "{");
    WriteJsonText( response_writer, "\"Uuid\":" );
    WriteJsonUuid( response_writer, simple.Uuid );
    WriteJsonText( response_writer, "\"Bool\":" );
    WriteJsonBool( response_writer, simple.Bool );
    WriteJsonText( response_writer, "\"Int8\":" );
    WriteJsonInt8( response_writer, simple.Int8 );
    WriteJsonText( response_writer, "\"Uint8\":" );
    WriteJsonUint8( response_writer, simple.Uint8 );
    WriteJsonText( response_writer, "\"Int16\":" );
    WriteJsonInt16( response_writer, simple.Int16 );
    WriteJsonText( response_writer, "\"Uint16\":" );
    WriteJsonUint16( response_writer, simple.Uint16 );
    WriteJsonText( response_writer, "\"Int32\":" );
    WriteJsonInt32( response_writer, simple.Int32 );
    WriteJsonText( response_writer, "\"Uint32\":" );
    WriteJsonUint32( response_writer, simple.Uint32 );
    WriteJsonText( response_writer, "\"Int64\":" );
    WriteJsonInt64( response_writer, simple.Int64 );
    WriteJsonText( response_writer, "\"Uint64\":" );
    WriteJsonUint64( response_writer, simple.Uint64 );
    WriteJsonText( response_writer, "\"Float32\":" );
    WriteJsonFloat32( response_writer, simple.Float32 );
    WriteJsonText( response_writer, "\"Float64\":" );
    WriteJsonFloat64( response_writer, simple.Float64 );
    WriteJsonText( response_writer, "\"String\":" );
    WriteJsonString( response_writer, simple.String );
    WriteJsonText( response_writer, "\"Date\":" );
    WriteJsonString( response_writer, simple.Date );
    WriteJsonText( response_writer, "\"DateTime\":" );
    WriteJsonString( response_writer, simple.DateTime );
    WriteJsonText( response_writer, "\"Blob\":" );
    WriteJsonBlob( response_writer, simple.Blob );
    WriteJsonText( response_writer, "}" );
}

// ~~

func WriteJsonCompound(
    response_writer http.ResponseWriter,
    compound * COMPOUND
    )
{
    WriteJsonText( response_writer, "{");
    WriteJsonText( response_writer, "\"Id\":" );
    WriteJsonInt32( response_writer, compound.Id );
    WriteJsonText( response_writer, "\"Location\":" );
    WriteJsonString( response_writer, compound.Location );
    WriteJsonText( response_writer, "\"Name\":" );
    WriteJsonStringStringTuple( response_writer, compound.Name );
    WriteJsonText( response_writer, "\"NameSet\":" );
    WriteJsonStringStringTupleSet( response_writer, compound.NameSet );
    WriteJsonText( response_writer, "\"PhoneList\":" );
    WriteJsonStringList( response_writer, compound.PhoneList );
    WriteJsonText( response_writer, "\"EmailSet\":" );
    WriteJsonStringSet( response_writer, compound.EmailSet );
    WriteJsonText( response_writer, "\"CompanyMap\":" );
    WriteJsonStringStringMap( response_writer, compound.CompanyMap );
    WriteJsonText( response_writer, "\"SimpleDate\":" );
    WriteJsonString( response_writer, compound.SimpleDate );
    WriteJsonText( response_writer, "\"SimpleDateMap\":" );
    WriteJsonStringStringTupleStringMap( response_writer, compound.SimpleDateMap );
    WriteJsonText( response_writer, "\"SimpleDateSet\":" );
    WriteJsonStringSet( response_writer, compound.SimpleDateSet );
    WriteJsonText( response_writer, "\"SimpleDateList\":" );
    WriteJsonStringList( response_writer, compound.SimpleDateList );
    WriteJsonText( response_writer, "\"NameSetMap\":" );
    WriteJsonStringStringStringTupleSetMap( response_writer, compound.NameSetMap );
    WriteJsonText( response_writer, "}" );
}

// ~~

func HandleAddSimpleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        simple SIMPLE;

    if ( GetRequestBool( &simple.Bool, request, "Bool" )
         && GetRequestInt8( &simple.Int8, request, "Int8" )
         && GetRequestUint8( &simple.Uint8, request, "Uint8" )
         && GetRequestInt16( &simple.Int16, request, "Int16" )
         && GetRequestUint16( &simple.Uint16, request, "Uint16" )
         && GetRequestInt32( &simple.Int32, request, "Int32" )
         && GetRequestUint32( &simple.Uint32, request, "Uint32" )
         && GetRequestInt64( &simple.Int64, request, "Int64" )
         && GetRequestUint64( &simple.Uint64, request, "Uint64" )
         && GetRequestFloat32( &simple.Float32, request, "Float32" )
         && GetRequestFloat64( &simple.Float64, request, "Float64" )
         && GetRequestString( &simple.String, request, "String" )
         && GetRequestString( &simple.Date, request, "Date" )
         && GetRequestString( &simple.DateTime, request, "DateTime" )
         && GetRequestBlob( &simple.Blob, request, "Blob" )
         && AddDatabaseSimple( &simple ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleSetSimpleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        simple SIMPLE;

    if ( GetRequestUuid( &simple.Uuid, request, "Uuid" )
         && GetRequestBool( &simple.Bool, request, "Bool" )
         && GetRequestInt8( &simple.Int8, request, "Int8" )
         && GetRequestUint8( &simple.Uint8, request, "Uint8" )
         && GetRequestInt16( &simple.Int16, request, "Int16" )
         && GetRequestUint16( &simple.Uint16, request, "Uint16" )
         && GetRequestInt32( &simple.Int32, request, "Int32" )
         && GetRequestUint32( &simple.Uint32, request, "Uint32" )
         && GetRequestInt64( &simple.Int64, request, "Int64" )
         && GetRequestUint64( &simple.Uint64, request, "Uint64" )
         && GetRequestFloat32( &simple.Float32, request, "Float32" )
         && GetRequestFloat64( &simple.Float64, request, "Float64" )
         && GetRequestString( &simple.String, request, "String" )
         && GetRequestString( &simple.Date, request, "Date" )
         && GetRequestString( &simple.DateTime, request, "DateTime" )
         && GetRequestBlob( &simple.Blob, request, "Blob" )
         && SetDatabaseSimple( &simple ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleRemoveSimpleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        simple SIMPLE;

    if ( GetRequestUuid( &simple.Uuid, request, "Uuid" )
         && RemoveDatabaseSimple( &simple ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleGetSimpleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        simple SIMPLE;

    if ( GetRequestUuid( &simple.Uuid, request, "Uuid" )
         && GetDatabaseSimple( &simple ) )
    {
        WriteJsonSimple( response_writer, &simple );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleAddCompoundRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        compound COMPOUND;

    if ( GetRequestString( &compound.Location, request, "Location" )
         && GetRequestStringStringTuple( &compound.Name, request, "Name" )
         && GetRequestStringStringTupleSet( &compound.NameSet, request, "NameSet" )
         && GetRequestStringList( &compound.PhoneList, request, "PhoneList" )
         && GetRequestStringSet( &compound.EmailSet, request, "EmailSet" )
         && GetRequestStringStringMap( &compound.CompanyMap, request, "CompanyMap" )
         && GetRequestString( &compound.SimpleDate, request, "SimpleDate" )
         && GetRequestStringStringTupleStringMap( &compound.SimpleDateMap, request, "SimpleDateMap" )
         && GetRequestStringSet( &compound.SimpleDateSet, request, "SimpleDateSet" )
         && GetRequestStringList( &compound.SimpleDateList, request, "SimpleDateList" )
         && GetRequestStringStringStringTupleSetMap( &compound.NameSetMap, request, "NameSetMap" )
         && AddDatabaseCompound( &compound ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleSetCompoundRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        compound COMPOUND;

    if ( GetRequestInt32( &compound.Id, request, "Id" )
         && GetRequestString( &compound.Location, request, "Location" )
         && GetRequestStringStringTuple( &compound.Name, request, "Name" )
         && GetRequestStringStringTupleSet( &compound.NameSet, request, "NameSet" )
         && GetRequestStringList( &compound.PhoneList, request, "PhoneList" )
         && GetRequestStringSet( &compound.EmailSet, request, "EmailSet" )
         && GetRequestStringStringMap( &compound.CompanyMap, request, "CompanyMap" )
         && GetRequestString( &compound.SimpleDate, request, "SimpleDate" )
         && GetRequestStringStringTupleStringMap( &compound.SimpleDateMap, request, "SimpleDateMap" )
         && GetRequestStringSet( &compound.SimpleDateSet, request, "SimpleDateSet" )
         && GetRequestStringList( &compound.SimpleDateList, request, "SimpleDateList" )
         && GetRequestStringStringStringTupleSetMap( &compound.NameSetMap, request, "NameSetMap" )
         && SetDatabaseCompound( &compound ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleRemoveCompoundRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        compound COMPOUND;

    if ( GetRequestInt32( &compound.Id, request, "Id" )
         && RemoveDatabaseCompound( &compound ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleGetCompoundRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        compound COMPOUND;

    if ( GetRequestInt32( &compound.Id, request, "Id" )
         && GetDatabaseCompound( &compound ) )
    {
        WriteJsonCompound( response_writer, &compound );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

router.Post( "/add_simple", HandleAddSimple );
router.Post( "/set_simple", HandleAddSimple );
router.Post( "/remove_simple", HandleAddSimple );
router.Post( "/get_simple", HandleAddSimple );

router.Post( "/add_compound", HandleAddCompound );
router.Post( "/set_compound", HandleAddCompound );
router.Post( "/remove_compound", HandleAddCompound );
router.Post( "/get_compound", HandleAddCompound );

