public class SECTION
{
    public ulong
        Id,
        Number;
    public string
        Slug,
        Name,
        Text,
        Image;
    public ulong
        ImageIndex;
}

// ~~

public class USER
{
    public ulong
        Id;
    public string
        FirstName,
        LastName,
        Email,
        Pseudonym,
        Password,
        Phone,
        Street,
        City,
        Code,
        Region,
        Country,
        Company;
    public bool
        ItIsAdministrator;
}

// ~~

public class ARTICLE
{
    public ulong
        Id,
        SectionId,
        UserId;
    public string
        Slug,
        Title,
        Text,
        Image;
    public DateTime
        Date;
    public SECTION
        Section;
    public USER
        User;
    public ulong
        ImageIndex;
}

// ~~

public class COMMENT
{
    public ulong
        Id,
        ArticleId,
        UserId;
    public string
        Text;
    public DateTime
        DateTime;
    public ARTICLE
        Article;
    public USER
        User;
}

// ~~

public class SUBSCRIBER
{
    public ulong
        Id;
    public string
        Name,
        Email;
}
