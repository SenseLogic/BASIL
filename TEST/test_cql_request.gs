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
         && GetRequestDateTime( &simple.Date, request, "Date", &error_code )
         && GetRequestDateTime( &simple.DateTime, request, "DateTime", &error_code )
         && GetRequestBlob( &simple.Blob, request, "Blob", &error_code )
         && AddDatabaseSimple( &simple, &error_code ) )
    {
        WriteResponse( response_writer, "{" );
        WriteResponse( response_writer, "\"Uuid\":" );
        WriteResponseUuid( response_writer, simple.Uuid );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestDateTime( &simple.Date, request, "Date", &error_code )
         && GetRequestDateTime( &simple.DateTime, request, "DateTime", &error_code )
         && GetRequestBlob( &simple.Blob, request, "Blob", &error_code )
         && SetDatabaseSimple( &simple, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
        WriteResponse( response_writer, "{\"Simple\":" );
        WriteResponseSimple( response_writer, &simple );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSimpleArrayRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        simple_array [] SIMPLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseSimpleArray( &simple_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"SimpleArray\":[" );

        for simple_index, _ := range simple_array
        {
            if ( simple_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseSimple( response_writer, &simple_array[ simple_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestDateTime( &compound.SimpleDate, request, "SimpleDate", &error_code )
         && GetRequestStringStringTupleDateTimeMap( &compound.SimpleDateMap, request, "SimpleDateMap", &error_code )
         && GetRequestDateTimeSet( &compound.SimpleDateSet, request, "SimpleDateSet", &error_code )
         && GetRequestDateTimeList( &compound.SimpleDateList, request, "SimpleDateList", &error_code )
         && GetRequestDateTimeStringStringTupleSetMap( &compound.NameSetMap, request, "NameSetMap", &error_code )
         && AddDatabaseCompound( &compound, &error_code ) )
    {
        WriteResponse( response_writer, "{" );
        WriteResponse( response_writer, "\"Id\":" );
        WriteResponseInt32( response_writer, compound.Id );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestDateTime( &compound.SimpleDate, request, "SimpleDate", &error_code )
         && GetRequestStringStringTupleDateTimeMap( &compound.SimpleDateMap, request, "SimpleDateMap", &error_code )
         && GetRequestDateTimeSet( &compound.SimpleDateSet, request, "SimpleDateSet", &error_code )
         && GetRequestDateTimeList( &compound.SimpleDateList, request, "SimpleDateList", &error_code )
         && GetRequestDateTimeStringStringTupleSetMap( &compound.NameSetMap, request, "NameSetMap", &error_code )
         && SetDatabaseCompound( &compound, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
        WriteResponse( response_writer, "{\"Compound\":" );
        WriteResponseCompound( response_writer, &compound );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetCompoundArrayRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        compound_array [] COMPOUND;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseCompoundArray( &compound_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"CompoundArray\":[" );

        for compound_index, _ := range compound_array
        {
            if ( compound_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseCompound( response_writer, &compound_array[ compound_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleAddValueRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value VALUE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &value.Uuid, request, "Uuid", &error_code )
         && GetRequestString( &value.Name, request, "Name", &error_code )
         && GetRequestInt32( &value.Integer, request, "Integer", &error_code )
         && GetRequestString( &value.Text, request, "Text", &error_code )
         && AddDatabaseValue( &value, &error_code ) )
    {
        WriteResponse( response_writer, "{" );
        WriteResponse( response_writer, "\"Uuid\":" );
        WriteResponseUuid( response_writer, value.Uuid );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleSetValueRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value VALUE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &value.Uuid, request, "Uuid", &error_code )
         && GetRequestString( &value.Name, request, "Name", &error_code )
         && GetRequestInt32( &value.Integer, request, "Integer", &error_code )
         && GetRequestString( &value.Text, request, "Text", &error_code )
         && SetDatabaseValue( &value, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveValueRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value VALUE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &value.Uuid, request, "Uuid", &error_code )
         && RemoveDatabaseValue( &value, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetValueRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value VALUE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &value.Uuid, request, "Uuid", &error_code )
         && GetDatabaseValue( &value, &error_code ) )
    {
        WriteResponse( response_writer, "{\"Value\":" );
        WriteResponseValue( response_writer, &value );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetValueArrayRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value_array [] VALUE;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseValueArray( &value_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"ValueArray\":[" );

        for value_index, _ := range value_array
        {
            if ( value_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseValue( response_writer, &value_array[ value_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleAddDataRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        data DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &data.Uuid, request, "Uuid", &error_code )
         && GetRequestUuid( &data.ValueUuid, request, "ValueUuid", &error_code )
         && AddDatabaseData( &data, &error_code ) )
    {
        WriteResponse( response_writer, "{" );
        WriteResponse( response_writer, "\"Uuid\":" );
        WriteResponseUuid( response_writer, data.Uuid );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleSetDataRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        data DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &data.Uuid, request, "Uuid", &error_code )
         && GetRequestUuid( &data.ValueUuid, request, "ValueUuid", &error_code )
         && SetDatabaseData( &data, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveDataRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        data DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &data.Uuid, request, "Uuid", &error_code )
         && RemoveDatabaseData( &data, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetDataRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        data DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &data.Uuid, request, "Uuid", &error_code )
         && GetDatabaseData( &data, &error_code ) )
    {
        WriteResponse( response_writer, "{\"Data\":" );
        WriteResponseData( response_writer, &data );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetDataArrayRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        data_array [] DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseDataArray( &data_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"DataArray\":[" );

        for data_index, _ := range data_array
        {
            if ( data_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseData( response_writer, &data_array[ data_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}
