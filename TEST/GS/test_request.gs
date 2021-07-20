func HandleAddSimpleDatabaseRequest(
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
         && GetRequestString( request, &simple.Name, "Name", &error_code )
         && GetRequestDateTime( request, &simple.Date, "Date", &error_code )
         && GetRequestDateTime( request, &simple.DateTime, "DateTime", &error_code )
         && GetRequestBlob( request, &simple.Blob, "Blob", &error_code )
         && GetRequestString( request, &simple.Option, "Option", &error_code )
         && GetRequestString( request, &simple.EnglishText, "EnglishText", &error_code )
         && GetRequestString( request, &simple.FrenchText, "FrenchText", &error_code )
         && GetRequestString( request, &simple.GermanText, "GermanText", &error_code )
         && GetRequestString( request, &simple.LatinText, "LatinText", &error_code )
         && GetRequestString( request, &simple.SpanishText, "SpanishText", &error_code )
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

func HandleSetSimpleDatabaseRequest(
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
         && GetRequestString( request, &simple.Name, "Name", &error_code )
         && GetRequestDateTime( request, &simple.Date, "Date", &error_code )
         && GetRequestDateTime( request, &simple.DateTime, "DateTime", &error_code )
         && GetRequestBlob( request, &simple.Blob, "Blob", &error_code )
         && GetRequestString( request, &simple.Option, "Option", &error_code )
         && GetRequestString( request, &simple.EnglishText, "EnglishText", &error_code )
         && GetRequestString( request, &simple.FrenchText, "FrenchText", &error_code )
         && GetRequestString( request, &simple.GermanText, "GermanText", &error_code )
         && GetRequestString( request, &simple.LatinText, "LatinText", &error_code )
         && GetRequestString( request, &simple.SpanishText, "SpanishText", &error_code )
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

func HandleRemoveSimpleDatabaseRequest(
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

func HandleGetSimpleDatabaseRequest(
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

func HandleGetSimpleListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        simple_array [] SIMPLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseSimpleList( &simple_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"SimpleList\":[" );

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

func HandleAddCompoundDatabaseRequest(
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
         && GetRequestString( request, &compound.Text, "Text", &error_code )
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

func HandleSetCompoundDatabaseRequest(
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
         && GetRequestString( request, &compound.Text, "Text", &error_code )
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

func HandleRemoveCompoundDatabaseRequest(
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

func HandleGetCompoundDatabaseRequest(
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

func HandleGetCompoundListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        compound_array [] COMPOUND;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseCompoundList( &compound_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"CompoundList\":[" );

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

func HandleAddValueDatabaseRequest(
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
         && AddDatabaseValue( &value, &error_code ) )
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

func HandleSetValueDatabaseRequest(
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

func HandleRemoveValueDatabaseRequest(
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

func HandleGetValueDatabaseRequest(
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

func HandleGetValueListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value_array [] VALUE;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseValueList( &value_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"ValueList\":[" );

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

func HandleAddValueDataDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value_data VALUE_DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( request, &value_data.Uuid, "Uuid", &error_code )
         && GetRequestInt64( request, &value_data.ValueId, "ValueId", &error_code )
         && GetRequestUuid( request, &value_data.ValueUuid, "ValueUuid", &error_code )
         && AddDatabaseValueData( &value_data, &error_code ) )
    {
        WriteResponse( response_writer, "{" );
        WriteResponse( response_writer, "\"Uuid\":" );
        WriteResponseUuid( response_writer, value_data.Uuid );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleSetValueDataDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value_data VALUE_DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( request, &value_data.Uuid, "Uuid", &error_code )
         && GetRequestInt64( request, &value_data.ValueId, "ValueId", &error_code )
         && GetRequestUuid( request, &value_data.ValueUuid, "ValueUuid", &error_code )
         && SetDatabaseValueData( &value_data, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveValueDataDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value_data VALUE_DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( request, &value_data.Uuid, "Uuid", &error_code )
         && RemoveDatabaseValueData( &value_data, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetValueDataDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value_data VALUE_DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( request, &value_data.Uuid, "Uuid", &error_code )
         && GetDatabaseValueData( &value_data, &error_code ) )
    {
        WriteResponse( response_writer, "{\"ValueData\":" );
        WriteResponseValueData( response_writer, &value_data );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetValueDataListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        value_data_array [] VALUE_DATA;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseValueDataList( &value_data_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"ValueDataList\":[" );

        for value_data_index, _ := range value_data_array
        {
            if ( value_data_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseValueData( response_writer, &value_data_array[ value_data_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~
