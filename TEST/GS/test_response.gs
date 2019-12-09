func WriteResponseSimple(
    writer io.Writer,
    simple * SIMPLE
    )
{
    WriteResponse( writer, "{\"Uuid\":" );
    WriteResponseUuid( writer, simple.Uuid );
    WriteResponse( writer, ",\"Bool\":" );
    WriteResponseBool( writer, simple.Bool );
    WriteResponse( writer, ",\"Int8\":" );
    WriteResponseInt8( writer, simple.Int8 );
    WriteResponse( writer, ",\"Uint8\":" );
    WriteResponseUint8( writer, simple.Uint8 );
    WriteResponse( writer, ",\"Int16\":" );
    WriteResponseInt16( writer, simple.Int16 );
    WriteResponse( writer, ",\"Uint16\":" );
    WriteResponseUint16( writer, simple.Uint16 );
    WriteResponse( writer, ",\"Int32\":" );
    WriteResponseInt32( writer, simple.Int32 );
    WriteResponse( writer, ",\"Uint32\":" );
    WriteResponseUint32( writer, simple.Uint32 );
    WriteResponse( writer, ",\"Int64\":" );
    WriteResponseInt64( writer, simple.Int64 );
    WriteResponse( writer, ",\"Uint64\":" );
    WriteResponseUint64( writer, simple.Uint64 );
    WriteResponse( writer, ",\"Float32\":" );
    WriteResponseFloat32( writer, simple.Float32 );
    WriteResponse( writer, ",\"Float64\":" );
    WriteResponseFloat64( writer, simple.Float64 );
    WriteResponse( writer, ",\"String\":" );
    WriteResponseString( writer, simple.String );
    WriteResponse( writer, ",\"Name\":" );
    WriteResponseString( writer, simple.Name );
    WriteResponse( writer, ",\"Date\":" );
    WriteResponseDateTime( writer, simple.Date );
    WriteResponse( writer, ",\"DateTime\":" );
    WriteResponseDateTime( writer, simple.DateTime );
    WriteResponse( writer, ",\"Blob\":" );
    WriteResponseBlob( writer, simple.Blob );
    WriteResponse( writer, "}" );
}

// ~~

func WriteResponseCompound(
    writer io.Writer,
    compound * COMPOUND
    )
{
    WriteResponse( writer, "{\"Id\":" );
    WriteResponseInt32( writer, compound.Id );
    WriteResponse( writer, ",\"Location\":" );
    WriteResponseString( writer, compound.Location );
    WriteResponse( writer, ",\"Name\":" );
    WriteResponseStringStringTuple( writer, compound.Name );
    WriteResponse( writer, ",\"NameSet\":" );
    WriteResponseStringStringTupleSet( writer, compound.NameSet );
    WriteResponse( writer, ",\"PhoneList\":" );
    WriteResponseStringList( writer, compound.PhoneList );
    WriteResponse( writer, ",\"EmailSet\":" );
    WriteResponseStringSet( writer, compound.EmailSet );
    WriteResponse( writer, ",\"CompanyMap\":" );
    WriteResponseStringStringMap( writer, compound.CompanyMap );
    WriteResponse( writer, ",\"SimpleDate\":" );
    WriteResponseDateTime( writer, compound.SimpleDate );
    WriteResponse( writer, ",\"SimpleDateMap\":" );
    WriteResponseStringStringTupleDateTimeMap( writer, compound.SimpleDateMap );
    WriteResponse( writer, ",\"SimpleDateSet\":" );
    WriteResponseDateTimeSet( writer, compound.SimpleDateSet );
    WriteResponse( writer, ",\"SimpleDateList\":" );
    WriteResponseDateTimeList( writer, compound.SimpleDateList );
    WriteResponse( writer, ",\"NameSetMap\":" );
    WriteResponseDateTimeStringStringTupleSetMap( writer, compound.NameSetMap );
    WriteResponse( writer, "}" );
}

// ~~

func WriteResponseValue(
    writer io.Writer,
    value * VALUE
    )
{
    WriteResponse( writer, "{\"Id\":" );
    WriteResponseInt64( writer, value.Id );
    WriteResponse( writer, ",\"Uuid\":" );
    WriteResponseUuid( writer, value.Uuid );
    WriteResponse( writer, ",\"Name\":" );
    WriteResponseString( writer, value.Name );
    WriteResponse( writer, ",\"Integer\":" );
    WriteResponseInt32( writer, value.Integer );
    WriteResponse( writer, ",\"Text\":" );
    WriteResponseString( writer, value.Text );
    WriteResponse( writer, "}" );
}

// ~~

func WriteResponseData(
    writer io.Writer,
    data * DATA
    )
{
    WriteResponse( writer, "{\"Uuid\":" );
    WriteResponseUuid( writer, data.Uuid );
    WriteResponse( writer, ",\"ValueId\":" );
    WriteResponseInt64( writer, data.ValueId );
    WriteResponse( writer, ",\"ValueUuid\":" );
    WriteResponseUuid( writer, data.ValueUuid );
    WriteResponse( writer, "}" );
}
