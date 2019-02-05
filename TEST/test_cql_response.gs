func WriteJsonSimple(
    response_writer http.ResponseWriter,
    simple * SIMPLE
    )
{
    WriteJsonText( response_writer, "{\"Uuid\":" );
    WriteJsonUuid( response_writer, simple.Uuid );
    WriteJsonText( response_writer, ",\"Bool\":" );
    WriteJsonBool( response_writer, simple.Bool );
    WriteJsonText( response_writer, ",\"Int8\":" );
    WriteJsonInt8( response_writer, simple.Int8 );
    WriteJsonText( response_writer, ",\"Uint8\":" );
    WriteJsonUint8( response_writer, simple.Uint8 );
    WriteJsonText( response_writer, ",\"Int16\":" );
    WriteJsonInt16( response_writer, simple.Int16 );
    WriteJsonText( response_writer, ",\"Uint16\":" );
    WriteJsonUint16( response_writer, simple.Uint16 );
    WriteJsonText( response_writer, ",\"Int32\":" );
    WriteJsonInt32( response_writer, simple.Int32 );
    WriteJsonText( response_writer, ",\"Uint32\":" );
    WriteJsonUint32( response_writer, simple.Uint32 );
    WriteJsonText( response_writer, ",\"Int64\":" );
    WriteJsonInt64( response_writer, simple.Int64 );
    WriteJsonText( response_writer, ",\"Uint64\":" );
    WriteJsonUint64( response_writer, simple.Uint64 );
    WriteJsonText( response_writer, ",\"Float32\":" );
    WriteJsonFloat32( response_writer, simple.Float32 );
    WriteJsonText( response_writer, ",\"Float64\":" );
    WriteJsonFloat64( response_writer, simple.Float64 );
    WriteJsonText( response_writer, ",\"String\":" );
    WriteJsonString( response_writer, simple.String );
    WriteJsonText( response_writer, ",\"Date\":" );
    WriteJsonString( response_writer, simple.Date );
    WriteJsonText( response_writer, ",\"DateTime\":" );
    WriteJsonString( response_writer, simple.DateTime );
    WriteJsonText( response_writer, ",\"Blob\":" );
    WriteJsonBlob( response_writer, simple.Blob );
    WriteJsonText( response_writer, "}" );
}

// ~~

func WriteJsonCompound(
    response_writer http.ResponseWriter,
    compound * COMPOUND
    )
{
    WriteJsonText( response_writer, "{\"Id\":" );
    WriteJsonInt32( response_writer, compound.Id );
    WriteJsonText( response_writer, ",\"Location\":" );
    WriteJsonString( response_writer, compound.Location );
    WriteJsonText( response_writer, ",\"Name\":" );
    WriteJsonStringStringTuple( response_writer, compound.Name );
    WriteJsonText( response_writer, ",\"NameSet\":" );
    WriteJsonStringStringTupleSet( response_writer, compound.NameSet );
    WriteJsonText( response_writer, ",\"PhoneList\":" );
    WriteJsonStringList( response_writer, compound.PhoneList );
    WriteJsonText( response_writer, ",\"EmailSet\":" );
    WriteJsonStringSet( response_writer, compound.EmailSet );
    WriteJsonText( response_writer, ",\"CompanyMap\":" );
    WriteJsonStringStringMap( response_writer, compound.CompanyMap );
    WriteJsonText( response_writer, ",\"SimpleDate\":" );
    WriteJsonString( response_writer, compound.SimpleDate );
    WriteJsonText( response_writer, ",\"SimpleDateMap\":" );
    WriteJsonStringStringTupleStringMap( response_writer, compound.SimpleDateMap );
    WriteJsonText( response_writer, ",\"SimpleDateSet\":" );
    WriteJsonStringSet( response_writer, compound.SimpleDateSet );
    WriteJsonText( response_writer, ",\"SimpleDateList\":" );
    WriteJsonStringList( response_writer, compound.SimpleDateList );
    WriteJsonText( response_writer, ",\"NameSetMap\":" );
    WriteJsonStringStringStringTupleSetMap( response_writer, compound.NameSetMap );
    WriteJsonText( response_writer, "}" );
}
