type SECTION struct {
    Id uint64 `db:"-"`;
    Number uint64 `db:"-"`;
    Name string `db:"-"`;
    Text string `db:"-"`;
    Image string `db:"-"`;
    ImageIndex uint64;
}

// ~~

type USER struct {
    Id uint64 `db:"-"`;
    FirstName string `db:"-"`;
    LastName string `db:"-"`;
    Email string `db:"-"`;
    Pseudonym string `db:"-"`;
    Password string `db:"-"`;
    Phone string `db:"-"`;
    Street string `db:"-"`;
    City string `db:"-"`;
    Code string `db:"-"`;
    Region string `db:"-"`;
    Country string `db:"-"`;
    Company string `db:"-"`;
    ItIsAdministrator bool `db:"-"`;
}

// ~~

type ARTICLE struct {
    Id uint64 `db:"-"`;
    SectionId uint64 `db:"-"`;
    UserId uint64 `db:"-"`;
    Title string `db:"-"`;
    Text string `db:"-"`;
    Image string `db:"-"`;
    Date string `db:"-"`;
    Section * SECTION;
    User * USER;
    ImageIndex uint64;
}

// ~~

type COMMENT struct {
    Id uint64 `db:"-"`;
    ArticleId uint64 `db:"-"`;
    UserId uint64 `db:"-"`;
    Text string `db:"-"`;
    DateTime string `db:"-"`;
    Article * ARTICLE;
    User * USER;
}

// ~~

type SUBSCRIBER struct {
    Id uint64 `db:"-"`;
    Name string `db:"-"`;
    Email string `db:"-"`;
}

// ~~

func AddDatabaseSection(
    section * SECTION
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into SECTION( Number, Name, Text, Image ) values( ?, ?, ?, ? )",
               section.Number,
               section.Name,
               section.Text,
               section.Image
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func SetDatabaseSection(
    section * SECTION
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into SECTION( Id, Number, Name, Text, Image ) values( ?, ?, ?, ?, ? )",
               section.Id,
               section.Number,
               section.Name,
               section.Text,
               section.Image
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func RemoveDatabaseSection(
    section * SECTION
    ) bool
{
    error_
        := DatabaseSession.Query(
               "delete from SECTION where Id = ?",
               section.Id
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func GetDatabaseSection(
    section * SECTION
    ) bool
{
    error_
        := DatabaseSession.Query(
               "select Number, Name, Text, Image, ImageIndex from SECTION where Id = ?",
               section.Id
               ).Consistency( gocql.One ).Scan( &section.Number, &section.Name, &section.Text, &section.Image, &section.ImageIndex );

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func AddDatabaseUser(
    user * USER
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into USER( FirstName, LastName, Email, Pseudonym, Password, Phone, Street, City, Code, Region, Country, Company, ItIsAdministrator ) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )",
               user.FirstName,
               user.LastName,
               user.Email,
               user.Pseudonym,
               user.Password,
               user.Phone,
               user.Street,
               user.City,
               user.Code,
               user.Region,
               user.Country,
               user.Company,
               user.ItIsAdministrator
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func SetDatabaseUser(
    user * USER
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into USER( Id, FirstName, LastName, Email, Pseudonym, Password, Phone, Street, City, Code, Region, Country, Company, ItIsAdministrator ) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )",
               user.Id,
               user.FirstName,
               user.LastName,
               user.Email,
               user.Pseudonym,
               user.Password,
               user.Phone,
               user.Street,
               user.City,
               user.Code,
               user.Region,
               user.Country,
               user.Company,
               user.ItIsAdministrator
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func RemoveDatabaseUser(
    user * USER
    ) bool
{
    error_
        := DatabaseSession.Query(
               "delete from USER where Id = ?",
               user.Id
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func GetDatabaseUser(
    user * USER
    ) bool
{
    error_
        := DatabaseSession.Query(
               "select FirstName, LastName, Email, Pseudonym, Password, Phone, Street, City, Code, Region, Country, Company, ItIsAdministrator from USER where Id = ?",
               user.Id
               ).Consistency( gocql.One ).Scan( &user.FirstName, &user.LastName, &user.Email, &user.Pseudonym, &user.Password, &user.Phone, &user.Street, &user.City, &user.Code, &user.Region, &user.Country, &user.Company, &user.ItIsAdministrator );

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func AddDatabaseArticle(
    article * ARTICLE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into ARTICLE( SectionId, UserId, Title, Text, Image, Date ) values( ?, ?, ?, ?, ?, ? )",
               article.SectionId,
               article.UserId,
               article.Title,
               article.Text,
               article.Image,
               article.Date
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func SetDatabaseArticle(
    article * ARTICLE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into ARTICLE( Id, SectionId, UserId, Title, Text, Image, Date ) values( ?, ?, ?, ?, ?, ?, ? )",
               article.Id,
               article.SectionId,
               article.UserId,
               article.Title,
               article.Text,
               article.Image,
               article.Date
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func RemoveDatabaseArticle(
    article * ARTICLE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "delete from ARTICLE where Id = ?",
               article.Id
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func GetDatabaseArticle(
    article * ARTICLE
    ) bool
{
    error_
        := DatabaseSession.Query(
               "select SectionId, UserId, Title, Text, Image, Date, Section, User, ImageIndex from ARTICLE where Id = ?",
               article.Id
               ).Consistency( gocql.One ).Scan( &article.SectionId, &article.UserId, &article.Title, &article.Text, &article.Image, &article.Date, &article.Section, &article.User, &article.ImageIndex );

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func AddDatabaseComment(
    comment * COMMENT
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into COMMENT( ArticleId, UserId, Text, DateTime ) values( ?, ?, ?, ? )",
               comment.ArticleId,
               comment.UserId,
               comment.Text,
               comment.DateTime
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func SetDatabaseComment(
    comment * COMMENT
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into COMMENT( Id, ArticleId, UserId, Text, DateTime ) values( ?, ?, ?, ?, ? )",
               comment.Id,
               comment.ArticleId,
               comment.UserId,
               comment.Text,
               comment.DateTime
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func RemoveDatabaseComment(
    comment * COMMENT
    ) bool
{
    error_
        := DatabaseSession.Query(
               "delete from COMMENT where Id = ?",
               comment.Id
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func GetDatabaseComment(
    comment * COMMENT
    ) bool
{
    error_
        := DatabaseSession.Query(
               "select ArticleId, UserId, Text, DateTime, Article, User from COMMENT where Id = ?",
               comment.Id
               ).Consistency( gocql.One ).Scan( &comment.ArticleId, &comment.UserId, &comment.Text, &comment.DateTime, &comment.Article, &comment.User );

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func AddDatabaseSubscriber(
    subscriber * SUBSCRIBER
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into SUBSCRIBER( Name, Email ) values( ?, ? )",
               subscriber.Name,
               subscriber.Email
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func SetDatabaseSubscriber(
    subscriber * SUBSCRIBER
    ) bool
{
    error_
        := DatabaseSession.Query(
               "insert into SUBSCRIBER( Id, Name, Email ) values( ?, ?, ? )",
               subscriber.Id,
               subscriber.Name,
               subscriber.Email
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func RemoveDatabaseSubscriber(
    subscriber * SUBSCRIBER
    ) bool
{
    error_
        := DatabaseSession.Query(
               "delete from SUBSCRIBER where Id = ?",
               subscriber.Id
               ).Exec();

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func GetDatabaseSubscriber(
    subscriber * SUBSCRIBER
    ) bool
{
    error_
        := DatabaseSession.Query(
               "select Name, Email from SUBSCRIBER where Id = ?",
               subscriber.Id
               ).Consistency( gocql.One ).Scan( &subscriber.Name, &subscriber.Email );

    if ( error_ == nil )
    {
        return true;
    }

    LogError( error_ );

    return false;
}

// ~~

func WriteJsonSection(
    response_writer http.ResponseWriter,
    section * SECTION
    )
{
    WriteJsonText( response_writer, "{");
    WriteJsonText( response_writer, "\"Id\":" );
    WriteJsonUint64( response_writer, section.Id );
    WriteJsonText( response_writer, "\"Number\":" );
    WriteJsonUint64( response_writer, section.Number );
    WriteJsonText( response_writer, "\"Name\":" );
    WriteJsonString( response_writer, section.Name );
    WriteJsonText( response_writer, "\"Text\":" );
    WriteJsonString( response_writer, section.Text );
    WriteJsonText( response_writer, "\"Image\":" );
    WriteJsonString( response_writer, section.Image );
    WriteJsonText( response_writer, "}" );
}

// ~~

func WriteJsonUser(
    response_writer http.ResponseWriter,
    user * USER
    )
{
    WriteJsonText( response_writer, "{");
    WriteJsonText( response_writer, "\"Id\":" );
    WriteJsonUint64( response_writer, user.Id );
    WriteJsonText( response_writer, "\"FirstName\":" );
    WriteJsonString( response_writer, user.FirstName );
    WriteJsonText( response_writer, "\"LastName\":" );
    WriteJsonString( response_writer, user.LastName );
    WriteJsonText( response_writer, "\"Email\":" );
    WriteJsonString( response_writer, user.Email );
    WriteJsonText( response_writer, "\"Pseudonym\":" );
    WriteJsonString( response_writer, user.Pseudonym );
    WriteJsonText( response_writer, "\"Password\":" );
    WriteJsonString( response_writer, user.Password );
    WriteJsonText( response_writer, "\"Phone\":" );
    WriteJsonString( response_writer, user.Phone );
    WriteJsonText( response_writer, "\"Street\":" );
    WriteJsonString( response_writer, user.Street );
    WriteJsonText( response_writer, "\"City\":" );
    WriteJsonString( response_writer, user.City );
    WriteJsonText( response_writer, "\"Code\":" );
    WriteJsonString( response_writer, user.Code );
    WriteJsonText( response_writer, "\"Region\":" );
    WriteJsonString( response_writer, user.Region );
    WriteJsonText( response_writer, "\"Country\":" );
    WriteJsonString( response_writer, user.Country );
    WriteJsonText( response_writer, "\"Company\":" );
    WriteJsonString( response_writer, user.Company );
    WriteJsonText( response_writer, "\"ItIsAdministrator\":" );
    WriteJsonBool( response_writer, user.ItIsAdministrator );
    WriteJsonText( response_writer, "}" );
}

// ~~

func WriteJsonArticle(
    response_writer http.ResponseWriter,
    article * ARTICLE
    )
{
    WriteJsonText( response_writer, "{");
    WriteJsonText( response_writer, "\"Id\":" );
    WriteJsonUint64( response_writer, article.Id );
    WriteJsonText( response_writer, "\"SectionId\":" );
    WriteJsonUint64( response_writer, article.SectionId );
    WriteJsonText( response_writer, "\"UserId\":" );
    WriteJsonUint64( response_writer, article.UserId );
    WriteJsonText( response_writer, "\"Title\":" );
    WriteJsonString( response_writer, article.Title );
    WriteJsonText( response_writer, "\"Text\":" );
    WriteJsonString( response_writer, article.Text );
    WriteJsonText( response_writer, "\"Image\":" );
    WriteJsonString( response_writer, article.Image );
    WriteJsonText( response_writer, "\"Date\":" );
    WriteJsonString( response_writer, article.Date );
    WriteJsonText( response_writer, "}" );
}

// ~~

func WriteJsonComment(
    response_writer http.ResponseWriter,
    comment * COMMENT
    )
{
    WriteJsonText( response_writer, "{");
    WriteJsonText( response_writer, "\"Id\":" );
    WriteJsonUint64( response_writer, comment.Id );
    WriteJsonText( response_writer, "\"ArticleId\":" );
    WriteJsonUint64( response_writer, comment.ArticleId );
    WriteJsonText( response_writer, "\"UserId\":" );
    WriteJsonUint64( response_writer, comment.UserId );
    WriteJsonText( response_writer, "\"Text\":" );
    WriteJsonString( response_writer, comment.Text );
    WriteJsonText( response_writer, "\"DateTime\":" );
    WriteJsonString( response_writer, comment.DateTime );
    WriteJsonText( response_writer, "}" );
}

// ~~

func WriteJsonSubscriber(
    response_writer http.ResponseWriter,
    subscriber * SUBSCRIBER
    )
{
    WriteJsonText( response_writer, "{");
    WriteJsonText( response_writer, "\"Id\":" );
    WriteJsonUint64( response_writer, subscriber.Id );
    WriteJsonText( response_writer, "\"Name\":" );
    WriteJsonString( response_writer, subscriber.Name );
    WriteJsonText( response_writer, "\"Email\":" );
    WriteJsonString( response_writer, subscriber.Email );
    WriteJsonText( response_writer, "}" );
}

// ~~

func HandleAddSection(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        section SECTION;

    if ( GetRequestUint64( &section.Number, request, "Number" )
         && GetRequestString( &section.Name, request, "Name" )
         && GetRequestString( &section.Text, request, "Text" )
         && GetRequestString( &section.Image, request, "Image" )
         && AddDatabaseSection( &section ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleSetSection(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        section SECTION;

    if ( GetRequestUint64( &section.Id, request, "Id" )
         && GetRequestUint64( &section.Number, request, "Number" )
         && GetRequestString( &section.Name, request, "Name" )
         && GetRequestString( &section.Text, request, "Text" )
         && GetRequestString( &section.Image, request, "Image" )
         && SetDatabaseSection( &section ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleRemoveSection(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        section SECTION;

    if ( GetRequestUint64( &section.Id, request, "Id" )
         && RemoveDatabaseSection( &section ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleGetSection(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        section SECTION;

    if ( GetRequestUint64( &section.Id, request, "Id" )
         && GetDatabaseSection( &section ) )
    {
        WriteJsonSection( response_writer, &section );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleAddUser(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        user USER;

    if ( GetRequestString( &user.FirstName, request, "FirstName" )
         && GetRequestString( &user.LastName, request, "LastName" )
         && GetRequestString( &user.Email, request, "Email" )
         && GetRequestString( &user.Pseudonym, request, "Pseudonym" )
         && GetRequestString( &user.Password, request, "Password" )
         && GetRequestString( &user.Phone, request, "Phone" )
         && GetRequestString( &user.Street, request, "Street" )
         && GetRequestString( &user.City, request, "City" )
         && GetRequestString( &user.Code, request, "Code" )
         && GetRequestString( &user.Region, request, "Region" )
         && GetRequestString( &user.Country, request, "Country" )
         && GetRequestString( &user.Company, request, "Company" )
         && GetRequestBool( &user.ItIsAdministrator, request, "ItIsAdministrator" )
         && AddDatabaseUser( &user ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleSetUser(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        user USER;

    if ( GetRequestUint64( &user.Id, request, "Id" )
         && GetRequestString( &user.FirstName, request, "FirstName" )
         && GetRequestString( &user.LastName, request, "LastName" )
         && GetRequestString( &user.Email, request, "Email" )
         && GetRequestString( &user.Pseudonym, request, "Pseudonym" )
         && GetRequestString( &user.Password, request, "Password" )
         && GetRequestString( &user.Phone, request, "Phone" )
         && GetRequestString( &user.Street, request, "Street" )
         && GetRequestString( &user.City, request, "City" )
         && GetRequestString( &user.Code, request, "Code" )
         && GetRequestString( &user.Region, request, "Region" )
         && GetRequestString( &user.Country, request, "Country" )
         && GetRequestString( &user.Company, request, "Company" )
         && GetRequestBool( &user.ItIsAdministrator, request, "ItIsAdministrator" )
         && SetDatabaseUser( &user ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleRemoveUser(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        user USER;

    if ( GetRequestUint64( &user.Id, request, "Id" )
         && RemoveDatabaseUser( &user ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleGetUser(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        user USER;

    if ( GetRequestUint64( &user.Id, request, "Id" )
         && GetDatabaseUser( &user ) )
    {
        WriteJsonUser( response_writer, &user );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleAddArticle(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        article ARTICLE;

    if ( GetRequestUint64( &article.SectionId, request, "SectionId" )
         && GetRequestUint64( &article.UserId, request, "UserId" )
         && GetRequestString( &article.Title, request, "Title" )
         && GetRequestString( &article.Text, request, "Text" )
         && GetRequestString( &article.Image, request, "Image" )
         && GetRequestString( &article.Date, request, "Date" )
         && AddDatabaseArticle( &article ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleSetArticle(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        article ARTICLE;

    if ( GetRequestUint64( &article.Id, request, "Id" )
         && GetRequestUint64( &article.SectionId, request, "SectionId" )
         && GetRequestUint64( &article.UserId, request, "UserId" )
         && GetRequestString( &article.Title, request, "Title" )
         && GetRequestString( &article.Text, request, "Text" )
         && GetRequestString( &article.Image, request, "Image" )
         && GetRequestString( &article.Date, request, "Date" )
         && SetDatabaseArticle( &article ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleRemoveArticle(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        article ARTICLE;

    if ( GetRequestUint64( &article.Id, request, "Id" )
         && RemoveDatabaseArticle( &article ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleGetArticle(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        article ARTICLE;

    if ( GetRequestUint64( &article.Id, request, "Id" )
         && GetDatabaseArticle( &article ) )
    {
        WriteJsonArticle( response_writer, &article );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleAddComment(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        comment COMMENT;

    if ( GetRequestUint64( &comment.ArticleId, request, "ArticleId" )
         && GetRequestUint64( &comment.UserId, request, "UserId" )
         && GetRequestString( &comment.Text, request, "Text" )
         && GetRequestString( &comment.DateTime, request, "DateTime" )
         && AddDatabaseComment( &comment ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleSetComment(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        comment COMMENT;

    if ( GetRequestUint64( &comment.Id, request, "Id" )
         && GetRequestUint64( &comment.ArticleId, request, "ArticleId" )
         && GetRequestUint64( &comment.UserId, request, "UserId" )
         && GetRequestString( &comment.Text, request, "Text" )
         && GetRequestString( &comment.DateTime, request, "DateTime" )
         && SetDatabaseComment( &comment ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleRemoveComment(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        comment COMMENT;

    if ( GetRequestUint64( &comment.Id, request, "Id" )
         && RemoveDatabaseComment( &comment ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleGetComment(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        comment COMMENT;

    if ( GetRequestUint64( &comment.Id, request, "Id" )
         && GetDatabaseComment( &comment ) )
    {
        WriteJsonComment( response_writer, &comment );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleAddSubscriber(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        subscriber SUBSCRIBER;

    if ( GetRequestString( &subscriber.Name, request, "Name" )
         && GetRequestString( &subscriber.Email, request, "Email" )
         && AddDatabaseSubscriber( &subscriber ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleSetSubscriber(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        subscriber SUBSCRIBER;

    if ( GetRequestUint64( &subscriber.Id, request, "Id" )
         && GetRequestString( &subscriber.Name, request, "Name" )
         && GetRequestString( &subscriber.Email, request, "Email" )
         && SetDatabaseSubscriber( &subscriber ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleRemoveSubscriber(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        subscriber SUBSCRIBER;

    if ( GetRequestUint64( &subscriber.Id, request, "Id" )
         && RemoveDatabaseSubscriber( &subscriber ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

func HandleGetSubscriber(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        subscriber SUBSCRIBER;

    if ( GetRequestUint64( &subscriber.Id, request, "Id" )
         && GetDatabaseSubscriber( &subscriber ) )
    {
        WriteJsonSubscriber( response_writer, &subscriber );
    }
    else
    {
        WriteJsonError( response_writer );
    }
}

// ~~

