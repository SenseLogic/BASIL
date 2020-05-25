public class SECTION
{
    public Guid
        Uuid;
    public ulong
        Number;
    public string
        Name,
        Text,
        Image;
    public ulong
        ImageIndex;
}

// ~~

public class USER
{
    public Guid
        Uuid;
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
    public Guid
        Uuid,
        SectionUuid,
        UserUuid;
    public string
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
    public Guid
        Uuid,
        ArticleUuid,
        UserUuid;
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
    public Guid
        Uuid;
    public string
        Name,
        Email;
}
