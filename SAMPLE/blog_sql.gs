type SECTION struct {
    Id uint64 `db:"Id"`;
    Number uint64 `db:"Number"`;
    Name string `db:"Name"`;
    Text string `db:"Text"`;
    Image string `db:"Image"`;
    ImageIndex uint64;
}

// ~~

type USER struct {
    Id uint64 `db:"Id"`;
    FirstName string `db:"FirstName"`;
    LastName string `db:"LastName"`;
    Email string `db:"Email"`;
    Pseudonym string `db:"Pseudonym"`;
    Password string `db:"Password"`;
    Phone string `db:"Phone"`;
    Street string `db:"Street"`;
    City string `db:"City"`;
    Code string `db:"Code"`;
    Region string `db:"Region"`;
    Country string `db:"Country"`;
    Company string `db:"Company"`;
    ItIsAdministrator bool `db:"ItIsAdministrator"`;
}

// ~~

type ARTICLE struct {
    Id uint64 `db:"Id"`;
    SectionId uint64 `db:"SectionId"`;
    UserId uint64 `db:"UserId"`;
    Title string `db:"Title"`;
    Text string `db:"Text"`;
    Image string `db:"Image"`;
    Date string `db:"Date"`;
    Section * SECTION;
    User * USER;
    ImageIndex uint64;
}

// ~~

type COMMENT struct {
    Id uint64 `db:"Id"`;
    ArticleId uint64 `db:"ArticleId"`;
    UserId uint64 `db:"UserId"`;
    Text string `db:"Text"`;
    DateTime string `db:"DateTime"`;
    Article * ARTICLE;
    User * USER;
}

// ~~

type SUBSCRIBER struct {
    Id uint64 `db:"Id"`;
    Name string `db:"Name"`;
    Email string `db:"Email"`;
}

// ~~

func AddDatabaseSection(
    section * SECTION
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "insert into SECTION( Number, Name, Text, Image ) values( ?, ?, ?, ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               section.Number,
               section.Name,
               section.Text,
               section.Image
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseSection(
    section * SECTION
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "update SECTION set Number = ?, Name = ?, Text = ?, Image = ? where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               section.Number,
               section.Name,
               section.Text,
               section.Image,
               section.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseSection(
    section * SECTION
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "delete from SECTION where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               section.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseSection(
    section * SECTION
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "select Number, Name, Text, Image, ImageIndex from SECTION where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    rows, error_
        := statement.Query(
               section.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    for rows.Next()
    {
        error_
            = rows.Scan(
                  &section.Number,
                  &section.Name,
                  &section.Text,
                  &section.Image,
                  &section.ImageIndex
                  );

        if ( error_ != nil )
        {
            HandleError( error_ );

            return false;
        }
    }

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func AddDatabaseUser(
    user * USER
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "insert into USER( FirstName, LastName, Email, Pseudonym, Password, Phone, Street, City, Code, Region, Country, Company, ItIsAdministrator ) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
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
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseUser(
    user * USER
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "update USER set FirstName = ?, LastName = ?, Email = ?, Pseudonym = ?, Password = ?, Phone = ?, Street = ?, City = ?, Code = ?, Region = ?, Country = ?, Company = ?, ItIsAdministrator = ? where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
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
               user.ItIsAdministrator,
               user.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseUser(
    user * USER
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "delete from USER where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               user.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseUser(
    user * USER
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "select FirstName, LastName, Email, Pseudonym, Password, Phone, Street, City, Code, Region, Country, Company, ItIsAdministrator from USER where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    rows, error_
        := statement.Query(
               user.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    for rows.Next()
    {
        error_
            = rows.Scan(
                  &user.FirstName,
                  &user.LastName,
                  &user.Email,
                  &user.Pseudonym,
                  &user.Password,
                  &user.Phone,
                  &user.Street,
                  &user.City,
                  &user.Code,
                  &user.Region,
                  &user.Country,
                  &user.Company,
                  &user.ItIsAdministrator
                  );

        if ( error_ != nil )
        {
            HandleError( error_ );

            return false;
        }
    }

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func AddDatabaseArticle(
    article * ARTICLE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "insert into ARTICLE( SectionId, UserId, Title, Text, Image, Date ) values( ?, ?, ?, ?, ?, ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               article.SectionId,
               article.UserId,
               article.Title,
               article.Text,
               article.Image,
               article.Date
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseArticle(
    article * ARTICLE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "update ARTICLE set SectionId = ?, UserId = ?, Title = ?, Text = ?, Image = ?, Date = ? where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               article.SectionId,
               article.UserId,
               article.Title,
               article.Text,
               article.Image,
               article.Date,
               article.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseArticle(
    article * ARTICLE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "delete from ARTICLE where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               article.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseArticle(
    article * ARTICLE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "select SectionId, UserId, Title, Text, Image, Date, Section, User, ImageIndex from ARTICLE where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    rows, error_
        := statement.Query(
               article.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    for rows.Next()
    {
        error_
            = rows.Scan(
                  &article.SectionId,
                  &article.UserId,
                  &article.Title,
                  &article.Text,
                  &article.Image,
                  &article.Date,
                  &article.Section,
                  &article.User,
                  &article.ImageIndex
                  );

        if ( error_ != nil )
        {
            HandleError( error_ );

            return false;
        }
    }

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func AddDatabaseComment(
    comment * COMMENT
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "insert into COMMENT( ArticleId, UserId, Text, DateTime ) values( ?, ?, ?, ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               comment.ArticleId,
               comment.UserId,
               comment.Text,
               comment.DateTime
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseComment(
    comment * COMMENT
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "update COMMENT set ArticleId = ?, UserId = ?, Text = ?, DateTime = ? where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               comment.ArticleId,
               comment.UserId,
               comment.Text,
               comment.DateTime,
               comment.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseComment(
    comment * COMMENT
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "delete from COMMENT where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               comment.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseComment(
    comment * COMMENT
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "select ArticleId, UserId, Text, DateTime, Article, User from COMMENT where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    rows, error_
        := statement.Query(
               comment.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    for rows.Next()
    {
        error_
            = rows.Scan(
                  &comment.ArticleId,
                  &comment.UserId,
                  &comment.Text,
                  &comment.DateTime,
                  &comment.Article,
                  &comment.User
                  );

        if ( error_ != nil )
        {
            HandleError( error_ );

            return false;
        }
    }

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func AddDatabaseSubscriber(
    subscriber * SUBSCRIBER
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "insert into SUBSCRIBER( Name, Email ) values( ?, ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               subscriber.Name,
               subscriber.Email
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseSubscriber(
    subscriber * SUBSCRIBER
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "update SUBSCRIBER set Name = ?, Email = ? where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               subscriber.Name,
               subscriber.Email,
               subscriber.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseSubscriber(
    subscriber * SUBSCRIBER
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "delete from SUBSCRIBER where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    result, error_
        := statement.Exec(
               subscriber.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseSubscriber(
    subscriber * SUBSCRIBER
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "select Name, Email from SUBSCRIBER where Id = ? )"
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    rows, error_
        := statement.Query(
               subscriber.Id
               );

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    for rows.Next()
    {
        error_
            = rows.Scan(
                  &subscriber.Name,
                  &subscriber.Email
                  );

        if ( error_ != nil )
        {
            HandleError( error_ );

            return false;
        }
    }

    if ( error_ != nil )
    {
        HandleError( error_ );

        return false;
    }

    return true;
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

func HandleAddSectionRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        section SECTION;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &section.Number, request, "Number" )
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

func HandleSetSectionRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        section SECTION;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &section.Id, request, "Id" )
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

func HandleRemoveSectionRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        section SECTION;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &section.Id, request, "Id" )
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

func HandleGetSectionRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        section SECTION;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &section.Id, request, "Id" )
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

func HandleAddUserRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        user USER;

    if ( IsAuthorizedRequest( request )
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

func HandleSetUserRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        user USER;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &user.Id, request, "Id" )
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

func HandleRemoveUserRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        user USER;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &user.Id, request, "Id" )
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

func HandleGetUserRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        user USER;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &user.Id, request, "Id" )
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

func HandleAddArticleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        article ARTICLE;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &article.SectionId, request, "SectionId" )
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

func HandleSetArticleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        article ARTICLE;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &article.Id, request, "Id" )
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

func HandleRemoveArticleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        article ARTICLE;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &article.Id, request, "Id" )
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

func HandleGetArticleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        article ARTICLE;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &article.Id, request, "Id" )
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

func HandleAddCommentRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        comment COMMENT;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &comment.ArticleId, request, "ArticleId" )
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

func HandleSetCommentRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        comment COMMENT;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &comment.Id, request, "Id" )
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

func HandleRemoveCommentRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        comment COMMENT;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &comment.Id, request, "Id" )
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

func HandleGetCommentRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        comment COMMENT;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &comment.Id, request, "Id" )
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

func HandleAddSubscriberRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        subscriber SUBSCRIBER;

    if ( IsAuthorizedRequest( request )
         && GetRequestString( &subscriber.Name, request, "Name" )
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

func HandleSetSubscriberRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        subscriber SUBSCRIBER;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &subscriber.Id, request, "Id" )
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

func HandleRemoveSubscriberRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        subscriber SUBSCRIBER;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &subscriber.Id, request, "Id" )
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

func HandleGetSubscriberRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        subscriber SUBSCRIBER;

    if ( IsAuthorizedRequest( request )
         && GetRequestUint64( &subscriber.Id, request, "Id" )
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

router.Post( "/add_section", HandleAddSection );
router.Post( "/set_section", HandleAddSection );
router.Post( "/remove_section", HandleAddSection );
router.Post( "/get_section", HandleAddSection );

router.Post( "/add_user", HandleAddUser );
router.Post( "/set_user", HandleAddUser );
router.Post( "/remove_user", HandleAddUser );
router.Post( "/get_user", HandleAddUser );

router.Post( "/add_article", HandleAddArticle );
router.Post( "/set_article", HandleAddArticle );
router.Post( "/remove_article", HandleAddArticle );
router.Post( "/get_article", HandleAddArticle );

router.Post( "/add_comment", HandleAddComment );
router.Post( "/set_comment", HandleAddComment );
router.Post( "/remove_comment", HandleAddComment );
router.Post( "/get_comment", HandleAddComment );

router.Post( "/add_subscriber", HandleAddSubscriber );
router.Post( "/set_subscriber", HandleAddSubscriber );
router.Post( "/remove_subscriber", HandleAddSubscriber );
router.Post( "/get_subscriber", HandleAddSubscriber );

