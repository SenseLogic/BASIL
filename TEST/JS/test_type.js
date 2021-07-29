class SIMPLE
{
    constructor(
        )
    {
        this.Uuid = null;
        this.Bool = null;
        this.Int8 = null;
        this.Uint8 = null;
        this.Int16 = null;
        this.Uint16 = null;
        this.Int32 = null;
        this.Uint32 = null;
        this.Int64 = null;
        this.Uint64 = null;
        this.Float32 = null;
        this.Float64 = null;
        this.String = null;
        this.Name = null;
        this.Date = null;
        this.DateTime = null;
        this.Blob = null;
        this.Option = null;
        this.EnglishText = null;
        this.FrenchText = null;
        this.GermanText = null;
        this.LatinText = null;
        this.SpanishText = null;
        this.Integer = null;
        this.Natural = null;
        this.Real = null;
        this.Address = null;
        this.CategorySlug = null;
        this.CategoryName = null;
        this.CategorySection = null;
    }
}

// ~~

class COMPOUND
{
    constructor(
        )
    {
        this.Id = null;
        this.Location = null;
        this.Name = null;
        this.NameSet = null;
        this.PhoneList = null;
        this.EmailSet = null;
        this.CompanyMap = null;
        this.SimpleDate = null;
        this.SimpleDateMap = null;
        this.SimpleDateSet = null;
        this.SimpleDateList = null;
        this.NameSetMap = null;
        this.Text = null;
        this.SimplePointerArray = null;
    }
}

// ~~

class VALUE
{
    constructor(
        )
    {
        this.Id = null;
        this.Uuid = null;
        this.Name = null;
        this.Integer = null;
        this.Text = null;
    }
}

// ~~

class VALUE_DATA
{
    constructor(
        )
    {
        this.Uuid = null;
        this.ValueId = null;
        this.ValueUuid = null;
        this.InternalId = null;
        this.InternalUuid = null;
        this.InternalValueId = null;
        this.InternalValueUuid = null;
    }
}

// ~~

class INTERNAL_DATA
{
    constructor(
        )
    {
        this.Id = null;
        this.Uuid = null;
        this.ValueId = null;
        this.ValueUuid = null;
        this.FirstName = null;
        this.LastName = null;
        this.IsAwesome = null;
    }
}
