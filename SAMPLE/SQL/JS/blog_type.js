class SECTION
{
    constructor(
        )
    {
        this.Id = null;
        this.Number = null;
        this.Slug = null;
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
        this.Id = null;
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
        this.Id = null;
        this.SectionId = null;
        this.UserId = null;
        this.Slug = null;
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
        this.Id = null;
        this.ArticleId = null;
        this.UserId = null;
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
        this.Id = null;
        this.Name = null;
        this.Email = null;
    }
}
