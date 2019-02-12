func WriteResponseSimple(
    response_writer http.ResponseWriter,
    simple * SIMPLE
    )
{
    WriteResponse( response_writer, "{\"Uuid\":" );
    WriteResponseUuid( response_writer, simple.Uuid );
    WriteResponse( response_writer, ",\"Bool\":" );
    WriteResponseBool( response_writer, simple.Bool );
    WriteResponse( response_writer, ",\"Int8\":" );
    WriteResponseInt8( response_writer, simple.Int8 );
    WriteResponse( response_writer, ",\"Uint8\":" );
    WriteResponseUint8( response_writer, simple.Uint8 );
    WriteResponse( response_writer, ",\"Int16\":" );
    WriteResponseInt16( response_writer, simple.Int16 );
    WriteResponse( response_writer, ",\"Uint16\":" );
    WriteResponseUint16( response_writer, simple.Uint16 );
    WriteResponse( response_writer, ",\"Int32\":" );
    WriteResponseInt32( response_writer, simple.Int32 );
    WriteResponse( response_writer, ",\"Uint32\":" );
    WriteResponseUint32( response_writer, simple.Uint32 );
    WriteResponse( response_writer, ",\"Int64\":" );
    WriteResponseInt64( response_writer, simple.Int64 );
    WriteResponse( response_writer, ",\"Uint64\":" );
    WriteResponseUint64( response_writer, simple.Uint64 );
    WriteResponse( response_writer, ",\"Float32\":" );
    WriteResponseFloat32( response_writer, simple.Float32 );
    WriteResponse( response_writer, ",\"Float64\":" );
    WriteResponseFloat64( response_writer, simple.Float64 );
    WriteResponse( response_writer, ",\"String\":" );
    WriteResponseString( response_writer, simple.String );
    WriteResponse( response_writer, ",\"Date\":" );
    WriteResponseString( response_writer, simple.Date );
    WriteResponse( response_writer, ",\"DateTime\":" );
    WriteResponseString( response_writer, simple.DateTime );
    WriteResponse( response_writer, ",\"Blob\":" );
    WriteResponseBlob( response_writer, simple.Blob );
    WriteResponse( response_writer, "}" );
}

// ~~

func WriteResponseCompound(
    response_writer http.ResponseWriter,
    compound * COMPOUND
    )
{
    WriteResponse( response_writer, "{\"Id\":" );
    WriteResponseInt32( response_writer, compound.Id );
    WriteResponse( response_writer, ",\"Location\":" );
    WriteResponseString( response_writer, compound.Location );
    WriteResponse( response_writer, ",\"Name\":" );
    WriteResponseStringStringTuple( response_writer, compound.Name );
    WriteResponse( response_writer, ",\"NameSet\":" );
    WriteResponseStringStringTupleSet( response_writer, compound.NameSet );
    WriteResponse( response_writer, ",\"PhoneList\":" );
    WriteResponseStringList( response_writer, compound.PhoneList );
    WriteResponse( response_writer, ",\"EmailSet\":" );
    WriteResponseStringSet( response_writer, compound.EmailSet );
    WriteResponse( response_writer, ",\"CompanyMap\":" );
    WriteResponseStringStringMap( response_writer, compound.CompanyMap );
    WriteResponse( response_writer, ",\"SimpleDate\":" );
    WriteResponseString( response_writer, compound.SimpleDate );
    WriteResponse( response_writer, ",\"SimpleDateMap\":" );
    WriteResponseStringStringTupleStringMap( response_writer, compound.SimpleDateMap );
    WriteResponse( response_writer, ",\"SimpleDateSet\":" );
    WriteResponseStringSet( response_writer, compound.SimpleDateSet );
    WriteResponse( response_writer, ",\"SimpleDateList\":" );
    WriteResponseStringList( response_writer, compound.SimpleDateList );
    WriteResponse( response_writer, ",\"NameSetMap\":" );
    WriteResponseStringStringStringTupleSetMap( response_writer, compound.NameSetMap );
    WriteResponse( response_writer, "}" );
}

// ~~

func WriteResponseValue(
    response_writer http.ResponseWriter,
    value * VALUE
    )
{
    WriteResponse( response_writer, "{\"Uuid\":" );
    WriteResponseUuid( response_writer, value.Uuid );
    WriteResponse( response_writer, ",\"Name\":" );
    WriteResponseString( response_writer, value.Name );
    WriteResponse( response_writer, ",\"Integer\":" );
    WriteResponseInt32( response_writer, value.Integer );
    WriteResponse( response_writer, ",\"Text\":" );
    WriteResponseString( response_writer, value.Text );
    WriteResponse( response_writer, "}" );
}

// ~~

func WriteResponseData(
    response_writer http.ResponseWriter,
    data * DATA
    )
{
    WriteResponse( response_writer, "{\"Uuid\":" );
    WriteResponseUuid( response_writer, data.Uuid );
    WriteResponse( response_writer, ",\"ValueUuid\":" );
    WriteResponseUuid( response_writer, data.ValueUuid );
    WriteResponse( response_writer, "}" );
}
