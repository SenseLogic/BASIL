class SECTION
{
    constructor(
        )
    {
        this.Uuid = null;
        this.Number = null;
        this.Name = null;
        this.Text = null;
        this.Image = null;
        this.ImageIndex = null;
    }
}

// ~~

class USER
{
    constructor(
        )
    {
        this.Uuid = null;
        this.FirstName = null;
        this.LastName = null;
        this.Email = null;
        this.Pseudonym = null;
        this.Password = null;
        this.Phone = null;
        this.Street = null;
        this.City = null;
        this.Code = null;
        this.Region = null;
        this.Country = null;
        this.Company = null;
        this.ItIsAdministrator = null;
    }
}

// ~~

class ARTICLE
{
    constructor(
        )
    {
        this.Uuid = null;
        this.SectionUuid = null;
        this.UserUuid = null;
        this.Title = null;
        this.Text = null;
        this.Image = null;
        this.Date = null;
        this.Section = null;
        this.User = null;
        this.ImageIndex = null;
    }
}

// ~~

class COMMENT
{
    constructor(
        )
    {
        this.Uuid = null;
        this.ArticleUuid = null;
        this.UserUuid = null;
        this.Text = null;
        this.DateTime = null;
        this.Article = null;
        this.User = null;
    }
}

// ~~

class SUBSCRIBER
{
    constructor(
        )
    {
        this.Uuid = null;
        this.Name = null;
        this.Email = null;
    }
}
