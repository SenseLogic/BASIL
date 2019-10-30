public class SECTION
{
    public ulong
        Id,
        Number;
    public String
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
    public String
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
    public String
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
    public String
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
    public String
        Name,
        Email;
}
