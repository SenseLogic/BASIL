func HandleAddSectionRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        section SECTION;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( &section.Number, request, "Number", &error_code )
         && GetRequestString( &section.Name, request, "Name", &error_code )
         && GetRequestString( &section.Text, request, "Text", &error_code )
         && GetRequestString( &section.Image, request, "Image", &error_code )
         && AddDatabaseSection( &section, &error_code ) )
    {
        WriteJsonText( response_writer, "{" );
        WriteJsonText( response_writer, "\"Uuid\":" );
        WriteJsonUuid( response_writer, section.Uuid );
        WriteJsonText( response_writer, "}" );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleSetSectionRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        section SECTION;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &section.Uuid, request, "Uuid", &error_code )
         && GetRequestUint64( &section.Number, request, "Number", &error_code )
         && GetRequestString( &section.Name, request, "Name", &error_code )
         && GetRequestString( &section.Text, request, "Text", &error_code )
         && GetRequestString( &section.Image, request, "Image", &error_code )
         && SetDatabaseSection( &section, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveSectionRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        section SECTION;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &section.Uuid, request, "Uuid", &error_code )
         && RemoveDatabaseSection( &section, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSectionRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        section SECTION;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &section.Uuid, request, "Uuid", &error_code )
         && GetDatabaseSection( &section, &error_code ) )
    {
        WriteJsonSection( response_writer, &section );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleAddUserRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        user USER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestString( &user.FirstName, request, "FirstName", &error_code )
         && GetRequestString( &user.LastName, request, "LastName", &error_code )
         && GetRequestString( &user.Email, request, "Email", &error_code )
         && GetRequestString( &user.Pseudonym, request, "Pseudonym", &error_code )
         && GetRequestString( &user.Password, request, "Password", &error_code )
         && GetRequestString( &user.Phone, request, "Phone", &error_code )
         && GetRequestString( &user.Street, request, "Street", &error_code )
         && GetRequestString( &user.City, request, "City", &error_code )
         && GetRequestString( &user.Code, request, "Code", &error_code )
         && GetRequestString( &user.Region, request, "Region", &error_code )
         && GetRequestString( &user.Country, request, "Country", &error_code )
         && GetRequestString( &user.Company, request, "Company", &error_code )
         && GetRequestBool( &user.ItIsAdministrator, request, "ItIsAdministrator", &error_code )
         && AddDatabaseUser( &user, &error_code ) )
    {
        WriteJsonText( response_writer, "{" );
        WriteJsonText( response_writer, "\"Uuid\":" );
        WriteJsonUuid( response_writer, user.Uuid );
        WriteJsonText( response_writer, "}" );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleSetUserRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        user USER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &user.Uuid, request, "Uuid", &error_code )
         && GetRequestString( &user.FirstName, request, "FirstName", &error_code )
         && GetRequestString( &user.LastName, request, "LastName", &error_code )
         && GetRequestString( &user.Email, request, "Email", &error_code )
         && GetRequestString( &user.Pseudonym, request, "Pseudonym", &error_code )
         && GetRequestString( &user.Password, request, "Password", &error_code )
         && GetRequestString( &user.Phone, request, "Phone", &error_code )
         && GetRequestString( &user.Street, request, "Street", &error_code )
         && GetRequestString( &user.City, request, "City", &error_code )
         && GetRequestString( &user.Code, request, "Code", &error_code )
         && GetRequestString( &user.Region, request, "Region", &error_code )
         && GetRequestString( &user.Country, request, "Country", &error_code )
         && GetRequestString( &user.Company, request, "Company", &error_code )
         && GetRequestBool( &user.ItIsAdministrator, request, "ItIsAdministrator", &error_code )
         && SetDatabaseUser( &user, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveUserRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        user USER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &user.Uuid, request, "Uuid", &error_code )
         && RemoveDatabaseUser( &user, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleGetUserRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        user USER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &user.Uuid, request, "Uuid", &error_code )
         && GetDatabaseUser( &user, &error_code ) )
    {
        WriteJsonUser( response_writer, &user );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleAddArticleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        article ARTICLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &article.SectionId, request, "SectionId", &error_code )
         && GetRequestUuid( &article.UserId, request, "UserId", &error_code )
         && GetRequestString( &article.Title, request, "Title", &error_code )
         && GetRequestString( &article.Text, request, "Text", &error_code )
         && GetRequestString( &article.Image, request, "Image", &error_code )
         && GetRequestString( &article.Date, request, "Date", &error_code )
         && AddDatabaseArticle( &article, &error_code ) )
    {
        WriteJsonText( response_writer, "{" );
        WriteJsonText( response_writer, "\"Uuid\":" );
        WriteJsonUuid( response_writer, article.Uuid );
        WriteJsonText( response_writer, "}" );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleSetArticleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        article ARTICLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &article.Uuid, request, "Uuid", &error_code )
         && GetRequestUuid( &article.SectionId, request, "SectionId", &error_code )
         && GetRequestUuid( &article.UserId, request, "UserId", &error_code )
         && GetRequestString( &article.Title, request, "Title", &error_code )
         && GetRequestString( &article.Text, request, "Text", &error_code )
         && GetRequestString( &article.Image, request, "Image", &error_code )
         && GetRequestString( &article.Date, request, "Date", &error_code )
         && SetDatabaseArticle( &article, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveArticleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        article ARTICLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &article.Uuid, request, "Uuid", &error_code )
         && RemoveDatabaseArticle( &article, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleGetArticleRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        article ARTICLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &article.Uuid, request, "Uuid", &error_code )
         && GetDatabaseArticle( &article, &error_code ) )
    {
        WriteJsonArticle( response_writer, &article );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleAddCommentRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        comment COMMENT;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &comment.ArticleId, request, "ArticleId", &error_code )
         && GetRequestUuid( &comment.UserId, request, "UserId", &error_code )
         && GetRequestString( &comment.Text, request, "Text", &error_code )
         && GetRequestString( &comment.DateTime, request, "DateTime", &error_code )
         && AddDatabaseComment( &comment, &error_code ) )
    {
        WriteJsonText( response_writer, "{" );
        WriteJsonText( response_writer, "\"Uuid\":" );
        WriteJsonUuid( response_writer, comment.Uuid );
        WriteJsonText( response_writer, "}" );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleSetCommentRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        comment COMMENT;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &comment.Uuid, request, "Uuid", &error_code )
         && GetRequestUuid( &comment.ArticleId, request, "ArticleId", &error_code )
         && GetRequestUuid( &comment.UserId, request, "UserId", &error_code )
         && GetRequestString( &comment.Text, request, "Text", &error_code )
         && GetRequestString( &comment.DateTime, request, "DateTime", &error_code )
         && SetDatabaseComment( &comment, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveCommentRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        comment COMMENT;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &comment.Uuid, request, "Uuid", &error_code )
         && RemoveDatabaseComment( &comment, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleGetCommentRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        comment COMMENT;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &comment.Uuid, request, "Uuid", &error_code )
         && GetDatabaseComment( &comment, &error_code ) )
    {
        WriteJsonComment( response_writer, &comment );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleAddSubscriberRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        subscriber SUBSCRIBER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestString( &subscriber.Name, request, "Name", &error_code )
         && GetRequestString( &subscriber.Email, request, "Email", &error_code )
         && AddDatabaseSubscriber( &subscriber, &error_code ) )
    {
        WriteJsonText( response_writer, "{" );
        WriteJsonText( response_writer, "\"Uuid\":" );
        WriteJsonUuid( response_writer, subscriber.Uuid );
        WriteJsonText( response_writer, "}" );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleSetSubscriberRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        subscriber SUBSCRIBER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &subscriber.Uuid, request, "Uuid", &error_code )
         && GetRequestString( &subscriber.Name, request, "Name", &error_code )
         && GetRequestString( &subscriber.Email, request, "Email", &error_code )
         && SetDatabaseSubscriber( &subscriber, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveSubscriberRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        subscriber SUBSCRIBER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &subscriber.Uuid, request, "Uuid", &error_code )
         && RemoveDatabaseSubscriber( &subscriber, &error_code ) )
    {
        WriteJsonSuccess( response_writer );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSubscriberRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        subscriber SUBSCRIBER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUuid( &subscriber.Uuid, request, "Uuid", &error_code )
         && GetDatabaseSubscriber( &subscriber, &error_code ) )
    {
        WriteJsonSubscriber( response_writer, &subscriber );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}
