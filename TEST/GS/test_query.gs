func AddDatabaseSimple(
    simple * SIMPLE,
    error_code * ERROR_CODE
    ) bool
{
    simple.Uuid = gocql.TimeUUID();

    error_
        := DatabaseSession.Query(
               "insert into \"SIMPLE\" ( \"Uuid\", \"Bool\", \"Int8\", \"Uint8\", \"Int16\", \"Uint16\", \"Int32\", \"Uint32\", \"Int64\", \"Uint64\", \"Float32\", \"Float64\", \"String\", \"Name\", \"Date\", \"DateTime\", \"Blob\", \"Option\", \"EnglishText\", \"FrenchText\", \"GermanText\", \"LatinText\", \"SpanishText\" ) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )",
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
               simple.Name,
               simple.Date,
               simple.DateTime,
               simple.Blob,
               simple.Option,
               simple.EnglishText,
               simple.FrenchText,
               simple.GermanText,
               simple.LatinText,
               simple.SpanishText
               ).Exec();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~


// ~~

function AddDatabaseSimple(
    string uuid,
    bool bool,
    int int_8,
    int uint_8,
    int int_16,
    int uint_16,
    int int_32,
    int uint_32,
    int int_64,
    int uint_64,
    float float_32,
    float float_64,
    string string,
    string name,
    string date,
    string date_time,
    string blob,
    string option,
    string english_text,
    string french_text,
    string german_text,
    string latin_text,
    string spanish_text
    )
{
}

// ~~

func SetDatabaseSimple(
    simple * SIMPLE,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into \"SIMPLE\" ( \"Uuid\", \"Bool\", \"Int8\", \"Uint8\", \"Int16\", \"Uint16\", \"Int32\", \"Uint32\", \"Int64\", \"Uint64\", \"Float32\", \"Float64\", \"String\", \"Name\", \"Date\", \"DateTime\", \"Blob\", \"Option\", \"EnglishText\", \"FrenchText\", \"GermanText\", \"LatinText\", \"SpanishText\" ) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )",
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
               simple.Name,
               simple.Date,
               simple.DateTime,
               simple.Blob,
               simple.Option,
               simple.EnglishText,
               simple.FrenchText,
               simple.GermanText,
               simple.LatinText,
               simple.SpanishText
               ).Exec();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

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
               "delete from \"SIMPLE\" where \"Uuid\" = ?",
               simple.Uuid
               ).Exec();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

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
               "select \"Bool\", \"Int8\", \"Uint8\", \"Int16\", \"Uint16\", \"Int32\", \"Uint32\", \"Int64\", \"Uint64\", \"Float32\", \"Float64\", \"String\", \"Name\", \"Date\", \"DateTime\", \"Blob\", \"Option\", \"EnglishText\", \"FrenchText\", \"GermanText\", \"LatinText\", \"SpanishText\" from \"SIMPLE\" where \"Uuid\" = ?",
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
                    &simple.Name,
                    &simple.Date,
                    &simple.DateTime,
                    &simple.Blob,
                    &simple.Option,
                    &simple.EnglishText,
                    &simple.FrenchText,
                    &simple.GermanText,
                    &simple.LatinText,
                    &simple.SpanishText
                    );

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseSimpleList(
    simple_array * [] SIMPLE,
    error_code * ERROR_CODE
    ) bool
{
    var
        simple SIMPLE;

    iterator
        := DatabaseSession.Query(
               "select \"Uuid\", \"Bool\", \"Int8\", \"Uint8\", \"Int16\", \"Uint16\", \"Int32\", \"Uint32\", \"Int64\", \"Uint64\", \"Float32\", \"Float64\", \"String\", \"Name\", \"Date\", \"DateTime\", \"Blob\", \"Option\", \"EnglishText\", \"FrenchText\", \"GermanText\", \"LatinText\", \"SpanishText\" from \"SIMPLE\""
               )
               .Consistency( gocql.One )
               .Iter();

    *simple_array = make( [] SIMPLE, 0 );

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
            &simple.Name,
            &simple.Date,
            &simple.DateTime,
            &simple.Blob,
            &simple.Option,
            &simple.EnglishText,
            &simple.FrenchText,
            &simple.GermanText,
            &simple.LatinText,
            &simple.SpanishText
            )
    {
        *simple_array = append( *simple_array, simple );
    }

    error_ := iterator.Close();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

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
               "insert into \"COMPOUND\" ( \"Location\", \"Name\", \"NameSet\", \"PhoneList\", \"EmailSet\", \"CompanyMap\", \"SimpleDate\", \"SimpleDateMap\", \"SimpleDateSet\", \"SimpleDateList\", \"NameSetMap\", \"Text\" ) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )",
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
               compound.NameSetMap,
               compound.Text
               ).Exec();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~


// ~~

function AddDatabaseCompound(
    string location,
    array name,
    array name_set,
    array phone_list,
    array email_set,
    array company_map,
    string simple_date,
    array simple_date_map,
    array simple_date_set,
    array simple_date_list,
    array name_set_map,
    string text
    )
{
}

// ~~

func SetDatabaseCompound(
    compound * COMPOUND,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into \"COMPOUND\" ( \"Id\", \"Location\", \"Name\", \"NameSet\", \"PhoneList\", \"EmailSet\", \"CompanyMap\", \"SimpleDate\", \"SimpleDateMap\", \"SimpleDateSet\", \"SimpleDateList\", \"NameSetMap\", \"Text\" ) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )",
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
               compound.NameSetMap,
               compound.Text
               ).Exec();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

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
               "delete from \"COMPOUND\" where \"Id\" = ?",
               compound.Id
               ).Exec();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

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
               "select \"Location\", \"Name\", \"NameSet\", \"PhoneList\", \"EmailSet\", \"CompanyMap\", \"SimpleDate\", \"SimpleDateMap\", \"SimpleDateSet\", \"SimpleDateList\", \"NameSetMap\", \"Text\",  from \"COMPOUND\" where \"Id\" = ?",
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
                    &compound.Text,
                    );

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseCompoundList(
    compound_array * [] COMPOUND,
    error_code * ERROR_CODE
    ) bool
{
    var
        compound COMPOUND;

    iterator
        := DatabaseSession.Query(
               "select \"Id\", \"Location\", \"Name\", \"NameSet\", \"PhoneList\", \"EmailSet\", \"CompanyMap\", \"SimpleDate\", \"SimpleDateMap\", \"SimpleDateSet\", \"SimpleDateList\", \"NameSetMap\", \"Text\" from \"COMPOUND\""
               )
               .Consistency( gocql.One )
               .Iter();

    *compound_array = make( [] COMPOUND, 0 );

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
            &compound.NameSetMap,
            &compound.Text
            )
    {
        *compound_array = append( *compound_array, compound );
    }

    error_ := iterator.Close();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func AddDatabaseValue(
    value * VALUE,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into \"VALUE\" ( \"Id\", \"Uuid\", \"Name\", \"Integer\", \"Text\" ) values ( ?, ?, ?, ?, ? )",
               value.Id,
               value.Uuid,
               value.Name,
               value.Integer,
               value.Text
               ).Exec();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~


// ~~

function AddDatabaseValue(
    int id,
    string uuid,
    string name,
    int integer,
    string text
    )
{
}

// ~~

func SetDatabaseValue(
    value * VALUE,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into \"VALUE\" ( \"Id\", \"Uuid\", \"Name\", \"Integer\", \"Text\" ) values ( ?, ?, ?, ?, ? )",
               value.Id,
               value.Uuid,
               value.Name,
               value.Integer,
               value.Text
               ).Exec();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseValue(
    value * VALUE,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "delete from \"VALUE\" where \"Id\" = ?",
               value.Id
               ).Exec();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseValue(
    value * VALUE,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "select \"Uuid\", \"Name\", \"Integer\", \"Text\" from \"VALUE\" where \"Id\" = ?",
               value.Id
               )
               .Consistency( gocql.One )
               .Scan(
                    &value.Uuid,
                    &value.Name,
                    &value.Integer,
                    &value.Text
                    );

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseValueList(
    value_array * [] VALUE,
    error_code * ERROR_CODE
    ) bool
{
    var
        value VALUE;

    iterator
        := DatabaseSession.Query(
               "select \"Id\", \"Uuid\", \"Name\", \"Integer\", \"Text\" from \"VALUE\""
               )
               .Consistency( gocql.One )
               .Iter();

    *value_array = make( [] VALUE, 0 );

    for iterator.Scan(
            &value.Id,
            &value.Uuid,
            &value.Name,
            &value.Integer,
            &value.Text
            )
    {
        *value_array = append( *value_array, value );
    }

    error_ := iterator.Close();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func AddDatabaseValueData(
    value_data * VALUE_DATA,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into \"VALUE_DATA\" ( \"Uuid\", \"ValueId\", \"ValueUuid\" ) values ( ?, ?, ? )",
               value_data.Uuid,
               value_data.ValueId,
               value_data.ValueUuid
               ).Exec();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~


// ~~

function AddDatabaseValueData(
    string uuid,
    int value_id,
    string value_uuid
    )
{
}

// ~~

func SetDatabaseValueData(
    value_data * VALUE_DATA,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into \"VALUE_DATA\" ( \"Uuid\", \"ValueId\", \"ValueUuid\" ) values ( ?, ?, ? )",
               value_data.Uuid,
               value_data.ValueId,
               value_data.ValueUuid
               ).Exec();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseValueData(
    value_data * VALUE_DATA,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "delete from \"VALUE_DATA\" where \"Uuid\" = ?",
               value_data.Uuid
               ).Exec();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseValueData(
    value_data * VALUE_DATA,
    error_code * ERROR_CODE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "select \"ValueId\", \"ValueUuid\",  from \"VALUE_DATA\" where \"Uuid\" = ?",
               value_data.Uuid
               )
               .Consistency( gocql.One )
               .Scan(
                    &value_data.ValueId,
                    &value_data.ValueUuid,
                    );

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseValueDataList(
    value_data_array * [] VALUE_DATA,
    error_code * ERROR_CODE
    ) bool
{
    var
        value_data VALUE_DATA;

    iterator
        := DatabaseSession.Query(
               "select \"Uuid\", \"ValueId\", \"ValueUuid\" from \"VALUE_DATA\""
               )
               .Consistency( gocql.One )
               .Iter();

    *value_data_array = make( [] VALUE_DATA, 0 );

    for iterator.Scan(
            &value_data.Uuid,
            &value_data.ValueId,
            &value_data.ValueUuid
            )
    {
        *value_data_array = append( *value_data_array, value_data );
    }

    error_ := iterator.Close();

    if ( error_ != nil )
    {
        error_code.SetError( error_, http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~
