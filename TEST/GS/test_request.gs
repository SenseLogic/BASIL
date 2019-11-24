func HandleAddSIMPLEDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        simple SIMPLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestBool( request, &simple.Bool, "Bool", &error_code )
         && GetRequestInt8( request, &simple.Int8, "Int8", &error_code )
         && GetRequestUint8( request, &simple.Uint8, "Uint8", &error_code )
         && GetRequestInt16( request, &simple.Int16, "Int16", &error_code )
         && GetRequestUint16( request, &simple.Uint16, "Uint16", &error_code )
         && GetRequestInt32( request, &simple.Int32, "Int32", &error_code )
         && GetRequestUint32( request, &simple.Uint32, "Uint32", &error_code )
         && GetRequestInt64( request, &simple.Int64, "Int64", &error_code )
         && GetRequestUint64( request, &simple.Uint64, "Uint64", &error_code )
         && GetRequestFloat32( request, &simple.Float32, "Float32", &error_code )
         && GetRequestFloat64( request, &simple.Float64, "Float64", &error_code )
         && GetRequestString( request, &simple.String, "String", &error_code )
         && GetRequestDateTime( request, &simple.Date, "Date", &error_code )
         && GetRequestDateTime( request, &simple.DateTime, "DateTime", &error_code )
         && GetRequestBlob( request, &simple.Blob, "Blob", &error_code )
         && AddDatabaseSIMPLE( &simple, &error_code ) )
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

func HandleSetSIMPLEDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        simple SIMPLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( request, &simple.Uuid, "Uuid", &error_code )
         && GetRequestBool( request, &simple.Bool, "Bool", &error_code )
         && GetRequestInt8( request, &simple.Int8, "Int8", &error_code )
         && GetRequestUint8( request, &simple.Uint8, "Uint8", &error_code )
         && GetRequestInt16( request, &simple.Int16, "Int16", &error_code )
         && GetRequestUint16( request, &simple.Uint16, "Uint16", &error_code )
         && GetRequestInt32( request, &simple.Int32, "Int32", &error_code )
         && GetRequestUint32( request, &simple.Uint32, "Uint32", &error_code )
         && GetRequestInt64( request, &simple.Int64, "Int64", &error_code )
         && GetRequestUint64( request, &simple.Uint64, "Uint64", &error_code )
         && GetRequestFloat32( request, &simple.Float32, "Float32", &error_code )
         && GetRequestFloat64( request, &simple.Float64, "Float64", &error_code )
         && GetRequestString( request, &simple.String, "String", &error_code )
         && GetRequestDateTime( request, &simple.Date, "Date", &error_code )
         && GetRequestDateTime( request, &simple.DateTime, "DateTime", &error_code )
         && GetRequestBlob( request, &simple.Blob, "Blob", &error_code )
         && SetDatabaseSIMPLE( &simple, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveSIMPLEDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        simple SIMPLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( request, &simple.Uuid, "Uuid", &error_code )
         && RemoveDatabaseSIMPLE( &simple, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSIMPLEDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        simple SIMPLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( request, &simple.Uuid, "Uuid", &error_code )
         && GetDatabaseSIMPLE( &simple, &error_code ) )
    {
        WriteResponse( response_writer, "{\"SIMPLE\":" );
        WriteResponseSIMPLE( response_writer, &simple );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSIMPLEListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        simple_array [] SIMPLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseSIMPLEList( &simple_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"SIMPLEList\":[" );

        for simple_index, _ := range simple_array
        {
            if ( simple_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseSIMPLE( response_writer, &simple_array[ simple_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleAddCOMPOUNDDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        compound COMPOUND;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestString( request, &compound.Location, "Location", &error_code )
         && GetRequestStringStringTuple( request, &compound.Name, "Name", &error_code )
         && GetRequestStringStringTupleSet( request, &compound.NameSet, "NameSet", &error_code )
         && GetRequestStringList( request, &compound.PhoneList, "PhoneList", &error_code )
         && GetRequestStringSet( request, &compound.EmailSet, "EmailSet", &error_code )
         && GetRequestStringStringMap( request, &compound.CompanyMap, "CompanyMap", &error_code )
         && GetRequestDateTime( request, &compound.SimpleDate, "SimpleDate", &error_code )
         && GetRequestStringStringTupleDateTimeMap( request, &compound.SimpleDateMap, "SimpleDateMap", &error_code )
         && GetRequestDateTimeSet( request, &compound.SimpleDateSet, "SimpleDateSet", &error_code )
         && GetRequestDateTimeList( request, &compound.SimpleDateList, "SimpleDateList", &error_code )
         && GetRequestDateTimeStringStringTupleSetMap( request, &compound.NameSetMap, "NameSetMap", &error_code )
         && AddDatabaseCOMPOUND( &compound, &error_code ) )
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

func HandleSetCOMPOUNDDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        compound COMPOUND;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestInt32( request, &compound.Id, "Id", &error_code )
         && GetRequestString( request, &compound.Location, "Location", &error_code )
         && GetRequestStringStringTuple( request, &compound.Name, "Name", &error_code )
         && GetRequestStringStringTupleSet( request, &compound.NameSet, "NameSet", &error_code )
         && GetRequestStringList( request, &compound.PhoneList, "PhoneList", &error_code )
         && GetRequestStringSet( request, &compound.EmailSet, "EmailSet", &error_code )
         && GetRequestStringStringMap( request, &compound.CompanyMap, "CompanyMap", &error_code )
         && GetRequestDateTime( request, &compound.SimpleDate, "SimpleDate", &error_code )
         && GetRequestStringStringTupleDateTimeMap( request, &compound.SimpleDateMap, "SimpleDateMap", &error_code )
         && GetRequestDateTimeSet( request, &compound.SimpleDateSet, "SimpleDateSet", &error_code )
         && GetRequestDateTimeList( request, &compound.SimpleDateList, "SimpleDateList", &error_code )
         && GetRequestDateTimeStringStringTupleSetMap( request, &compound.NameSetMap, "NameSetMap", &error_code )
         && SetDatabaseCOMPOUND( &compound, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveCOMPOUNDDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        compound COMPOUND;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestInt32( request, &compound.Id, "Id", &error_code )
         && RemoveDatabaseCOMPOUND( &compound, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetCOMPOUNDDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        compound COMPOUND;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestInt32( request, &compound.Id, "Id", &error_code )
         && GetDatabaseCOMPOUND( &compound, &error_code ) )
    {
        WriteResponse( response_writer, "{\"COMPOUND\":" );
        WriteResponseCOMPOUND( response_writer, &compound );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetCOMPOUNDListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        compound_array [] COMPOUND;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseCOMPOUNDList( &compound_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"COMPOUNDList\":[" );

        for compound_index, _ := range compound_array
        {
            if ( compound_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseCOMPOUND( response_writer, &compound_array[ compound_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleAddVALUEDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value VALUE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestInt64( request, &value.Id, "Id", &error_code )
         && GetRequestUuid( request, &value.Uuid, "Uuid", &error_code )
         && GetRequestString( request, &value.Name, "Name", &error_code )
         && GetRequestInt32( request, &value.Integer, "Integer", &error_code )
         && GetRequestString( request, &value.Text, "Text", &error_code )
         && AddDatabaseVALUE( &value, &error_code ) )
    {
        WriteResponse( response_writer, "{" );
        WriteResponse( response_writer, "\"Id\":" );
        WriteResponseInt64( response_writer, value.Id );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleSetVALUEDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value VALUE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestInt64( request, &value.Id, "Id", &error_code )
         && GetRequestUuid( request, &value.Uuid, "Uuid", &error_code )
         && GetRequestString( request, &value.Name, "Name", &error_code )
         && GetRequestInt32( request, &value.Integer, "Integer", &error_code )
         && GetRequestString( request, &value.Text, "Text", &error_code )
         && SetDatabaseVALUE( &value, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveVALUEDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value VALUE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestInt64( request, &value.Id, "Id", &error_code )
         && RemoveDatabaseVALUE( &value, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetVALUEDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value VALUE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestInt64( request, &value.Id, "Id", &error_code )
         && GetDatabaseVALUE( &value, &error_code ) )
    {
        WriteResponse( response_writer, "{\"VALUE\":" );
        WriteResponseVALUE( response_writer, &value );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetVALUEListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value_array [] VALUE;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseVALUEList( &value_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"VALUEList\":[" );

        for value_index, _ := range value_array
        {
            if ( value_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseVALUE( response_writer, &value_array[ value_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleAddDATADatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        data DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( request, &data.Uuid, "Uuid", &error_code )
         && GetRequestInt64( request, &data.ValueId, "ValueId", &error_code )
         && GetRequestUuid( request, &data.ValueUuid, "ValueUuid", &error_code )
         && AddDatabaseDATA( &data, &error_code ) )
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

func HandleSetDATADatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        data DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( request, &data.Uuid, "Uuid", &error_code )
         && GetRequestInt64( request, &data.ValueId, "ValueId", &error_code )
         && GetRequestUuid( request, &data.ValueUuid, "ValueUuid", &error_code )
         && SetDatabaseDATA( &data, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveDATADatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        data DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( request, &data.Uuid, "Uuid", &error_code )
         && RemoveDatabaseDATA( &data, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetDATADatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        data DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( request, &data.Uuid, "Uuid", &error_code )
         && GetDatabaseDATA( &data, &error_code ) )
    {
        WriteResponse( response_writer, "{\"DATA\":" );
        WriteResponseDATA( response_writer, &data );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetDATAListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        data_array [] DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseDATAList( &data_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"DATAList\":[" );

        for data_index, _ := range data_array
        {
            if ( data_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseDATA( response_writer, &data_array[ data_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}
