func HandleAddSimpleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        simple SIMPLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestBool( &simple.Bool, request, "Bool", &error_code )
         && GetRequestInt8( &simple.Int8, request, "Int8", &error_code )
         && GetRequestUint8( &simple.Uint8, request, "Uint8", &error_code )
         && GetRequestInt16( &simple.Int16, request, "Int16", &error_code )
         && GetRequestUint16( &simple.Uint16, request, "Uint16", &error_code )
         && GetRequestInt32( &simple.Int32, request, "Int32", &error_code )
         && GetRequestUint32( &simple.Uint32, request, "Uint32", &error_code )
         && GetRequestInt64( &simple.Int64, request, "Int64", &error_code )
         && GetRequestUint64( &simple.Uint64, request, "Uint64", &error_code )
         && GetRequestFloat32( &simple.Float32, request, "Float32", &error_code )
         && GetRequestFloat64( &simple.Float64, request, "Float64", &error_code )
         && GetRequestString( &simple.String, request, "String", &error_code )
         && GetRequestString( &simple.Date, request, "Date", &error_code )
         && GetRequestString( &simple.DateTime, request, "DateTime", &error_code )
         && GetRequestBlob( &simple.Blob, request, "Blob", &error_code )
         && AddDatabaseSimple( &simple, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleSetSimpleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        simple SIMPLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &simple.Uuid, request, "Uuid", &error_code )
         && GetRequestBool( &simple.Bool, request, "Bool", &error_code )
         && GetRequestInt8( &simple.Int8, request, "Int8", &error_code )
         && GetRequestUint8( &simple.Uint8, request, "Uint8", &error_code )
         && GetRequestInt16( &simple.Int16, request, "Int16", &error_code )
         && GetRequestUint16( &simple.Uint16, request, "Uint16", &error_code )
         && GetRequestInt32( &simple.Int32, request, "Int32", &error_code )
         && GetRequestUint32( &simple.Uint32, request, "Uint32", &error_code )
         && GetRequestInt64( &simple.Int64, request, "Int64", &error_code )
         && GetRequestUint64( &simple.Uint64, request, "Uint64", &error_code )
         && GetRequestFloat32( &simple.Float32, request, "Float32", &error_code )
         && GetRequestFloat64( &simple.Float64, request, "Float64", &error_code )
         && GetRequestString( &simple.String, request, "String", &error_code )
         && GetRequestString( &simple.Date, request, "Date", &error_code )
         && GetRequestString( &simple.DateTime, request, "DateTime", &error_code )
         && GetRequestBlob( &simple.Blob, request, "Blob", &error_code )
         && SetDatabaseSimple( &simple, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveSimpleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        simple SIMPLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &simple.Uuid, request, "Uuid", &error_code )
         && RemoveDatabaseSimple( &simple, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSimpleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        simple SIMPLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &simple.Uuid, request, "Uuid", &error_code )
         && GetDatabaseSimple( &simple, &error_code ) )
    {
        WriteJsonSimple( response_writer, &simple );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleAddCompoundRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        compound COMPOUND;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestString( &compound.Location, request, "Location", &error_code )
         && GetRequestStringStringTuple( &compound.Name, request, "Name", &error_code )
         && GetRequestStringStringTupleSet( &compound.NameSet, request, "NameSet", &error_code )
         && GetRequestStringList( &compound.PhoneList, request, "PhoneList", &error_code )
         && GetRequestStringSet( &compound.EmailSet, request, "EmailSet", &error_code )
         && GetRequestStringStringMap( &compound.CompanyMap, request, "CompanyMap", &error_code )
         && GetRequestString( &compound.SimpleDate, request, "SimpleDate", &error_code )
         && GetRequestStringStringTupleStringMap( &compound.SimpleDateMap, request, "SimpleDateMap", &error_code )
         && GetRequestStringSet( &compound.SimpleDateSet, request, "SimpleDateSet", &error_code )
         && GetRequestStringList( &compound.SimpleDateList, request, "SimpleDateList", &error_code )
         && GetRequestStringStringStringTupleSetMap( &compound.NameSetMap, request, "NameSetMap", &error_code )
         && AddDatabaseCompound( &compound, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleSetCompoundRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        compound COMPOUND;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestInt32( &compound.Id, request, "Id", &error_code )
         && GetRequestString( &compound.Location, request, "Location", &error_code )
         && GetRequestStringStringTuple( &compound.Name, request, "Name", &error_code )
         && GetRequestStringStringTupleSet( &compound.NameSet, request, "NameSet", &error_code )
         && GetRequestStringList( &compound.PhoneList, request, "PhoneList", &error_code )
         && GetRequestStringSet( &compound.EmailSet, request, "EmailSet", &error_code )
         && GetRequestStringStringMap( &compound.CompanyMap, request, "CompanyMap", &error_code )
         && GetRequestString( &compound.SimpleDate, request, "SimpleDate", &error_code )
         && GetRequestStringStringTupleStringMap( &compound.SimpleDateMap, request, "SimpleDateMap", &error_code )
         && GetRequestStringSet( &compound.SimpleDateSet, request, "SimpleDateSet", &error_code )
         && GetRequestStringList( &compound.SimpleDateList, request, "SimpleDateList", &error_code )
         && GetRequestStringStringStringTupleSetMap( &compound.NameSetMap, request, "NameSetMap", &error_code )
         && SetDatabaseCompound( &compound, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveCompoundRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        compound COMPOUND;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestInt32( &compound.Id, request, "Id", &error_code )
         && RemoveDatabaseCompound( &compound, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleGetCompoundRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        compound COMPOUND;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestInt32( &compound.Id, request, "Id", &error_code )
         && GetDatabaseCompound( &compound, &error_code ) )
    {
        WriteJsonCompound( response_writer, &compound );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}
