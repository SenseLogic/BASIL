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
        WriteJsonText( response_writer, "{\"Section\":" );
        WriteJsonSection( response_writer, &section );
        WriteJsonText( response_writer, "}" );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSectionArrayRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        section_array [] SECTION;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseSectionArray( &section_array, &error_code ) )
    {
        WriteJsonText( response_writer, "{\"SectionArray\":[" );

        for section_index, _ := range section_array
        {
            if ( section_index > 0 )
            {
                 WriteJsonText( response_writer, "," );
            }

            WriteJsonSection( response_writer, &section_array[ section_index ] );
        }

        WriteJsonText( response_writer, "]}" );
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
        WriteJsonText( response_writer, "{\"User\":" );
        WriteJsonUser( response_writer, &user );
        WriteJsonText( response_writer, "}" );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleGetUserArrayRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        user_array [] USER;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseUserArray( &user_array, &error_code ) )
    {
        WriteJsonText( response_writer, "{\"UserArray\":[" );

        for user_index, _ := range user_array
        {
            if ( user_index > 0 )
            {
                 WriteJsonText( response_writer, "," );
            }

            WriteJsonUser( response_writer, &user_array[ user_index ] );
        }

        WriteJsonText( response_writer, "]}" );
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
         && GetRequestUuid( &article.SectionUuid, request, "SectionUuid", &error_code )
         && GetRequestUuid( &article.UserUuid, request, "UserUuid", &error_code )
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
         && GetRequestUuid( &article.SectionUuid, request, "SectionUuid", &error_code )
         && GetRequestUuid( &article.UserUuid, request, "UserUuid", &error_code )
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
        WriteJsonText( response_writer, "{\"Article\":" );
        WriteJsonArticle( response_writer, &article );
        WriteJsonText( response_writer, "}" );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleGetArticleArrayRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        article_array [] ARTICLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseArticleArray( &article_array, &error_code ) )
    {
        WriteJsonText( response_writer, "{\"ArticleArray\":[" );

        for article_index, _ := range article_array
        {
            if ( article_index > 0 )
            {
                 WriteJsonText( response_writer, "," );
            }

            WriteJsonArticle( response_writer, &article_array[ article_index ] );
        }

        WriteJsonText( response_writer, "]}" );
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
         && GetRequestUuid( &comment.ArticleUuid, request, "ArticleUuid", &error_code )
         && GetRequestUuid( &comment.UserUuid, request, "UserUuid", &error_code )
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
         && GetRequestUuid( &comment.ArticleUuid, request, "ArticleUuid", &error_code )
         && GetRequestUuid( &comment.UserUuid, request, "UserUuid", &error_code )
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
        WriteJsonText( response_writer, "{\"Comment\":" );
        WriteJsonComment( response_writer, &comment );
        WriteJsonText( response_writer, "}" );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleGetCommentArrayRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        comment_array [] COMMENT;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseCommentArray( &comment_array, &error_code ) )
    {
        WriteJsonText( response_writer, "{\"CommentArray\":[" );

        for comment_index, _ := range comment_array
        {
            if ( comment_index > 0 )
            {
                 WriteJsonText( response_writer, "," );
            }

            WriteJsonComment( response_writer, &comment_array[ comment_index ] );
        }

        WriteJsonText( response_writer, "]}" );
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
        WriteJsonText( response_writer, "{\"Subscriber\":" );
        WriteJsonSubscriber( response_writer, &subscriber );
        WriteJsonText( response_writer, "}" );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSubscriberArrayRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        subscriber_array [] SUBSCRIBER;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseSubscriberArray( &subscriber_array, &error_code ) )
    {
        WriteJsonText( response_writer, "{\"SubscriberArray\":[" );

        for subscriber_index, _ := range subscriber_array
        {
            if ( subscriber_index > 0 )
            {
                 WriteJsonText( response_writer, "," );
            }

            WriteJsonSubscriber( response_writer, &subscriber_array[ subscriber_index ] );
        }

        WriteJsonText( response_writer, "]}" );
    }
    else
    {
        WriteJsonError( response_writer, &error_code );
    }
}
