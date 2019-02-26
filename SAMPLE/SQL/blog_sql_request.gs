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
        WriteResponse( response_writer, "{" );
        WriteResponse( response_writer, "\"Id\":" );
        WriteResponseUint64( response_writer, section.Id );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &section.Id, request, "Id", &error_code )
         && GetRequestUint64( &section.Number, request, "Number", &error_code )
         && GetRequestString( &section.Name, request, "Name", &error_code )
         && GetRequestString( &section.Text, request, "Text", &error_code )
         && GetRequestString( &section.Image, request, "Image", &error_code )
         && SetDatabaseSection( &section, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &section.Id, request, "Id", &error_code )
         && RemoveDatabaseSection( &section, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &section.Id, request, "Id", &error_code )
         && GetDatabaseSection( &section, &error_code ) )
    {
        WriteResponse( response_writer, "{\"Section\":" );
        WriteResponseSection( response_writer, &section );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSectionListRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        section_array [] SECTION;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseSectionList( &section_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"SectionList\":[" );

        for section_index, _ := range section_array
        {
            if ( section_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseSection( response_writer, &section_array[ section_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
        WriteResponse( response_writer, "{" );
        WriteResponse( response_writer, "\"Id\":" );
        WriteResponseUint64( response_writer, user.Id );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &user.Id, request, "Id", &error_code )
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
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &user.Id, request, "Id", &error_code )
         && RemoveDatabaseUser( &user, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &user.Id, request, "Id", &error_code )
         && GetDatabaseUser( &user, &error_code ) )
    {
        WriteResponse( response_writer, "{\"User\":" );
        WriteResponseUser( response_writer, &user );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetUserListRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        user_array [] USER;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseUserList( &user_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"UserList\":[" );

        for user_index, _ := range user_array
        {
            if ( user_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseUser( response_writer, &user_array[ user_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &article.SectionId, request, "SectionId", &error_code )
         && GetRequestUint64( &article.UserId, request, "UserId", &error_code )
         && GetRequestString( &article.Title, request, "Title", &error_code )
         && GetRequestString( &article.Text, request, "Text", &error_code )
         && GetRequestString( &article.Image, request, "Image", &error_code )
         && GetRequestDateTime( &article.Date, request, "Date", &error_code )
         && AddDatabaseArticle( &article, &error_code ) )
    {
        WriteResponse( response_writer, "{" );
        WriteResponse( response_writer, "\"Id\":" );
        WriteResponseUint64( response_writer, article.Id );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &article.Id, request, "Id", &error_code )
         && GetRequestUint64( &article.SectionId, request, "SectionId", &error_code )
         && GetRequestUint64( &article.UserId, request, "UserId", &error_code )
         && GetRequestString( &article.Title, request, "Title", &error_code )
         && GetRequestString( &article.Text, request, "Text", &error_code )
         && GetRequestString( &article.Image, request, "Image", &error_code )
         && GetRequestDateTime( &article.Date, request, "Date", &error_code )
         && SetDatabaseArticle( &article, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &article.Id, request, "Id", &error_code )
         && RemoveDatabaseArticle( &article, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &article.Id, request, "Id", &error_code )
         && GetDatabaseArticle( &article, &error_code ) )
    {
        WriteResponse( response_writer, "{\"Article\":" );
        WriteResponseArticle( response_writer, &article );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetArticleListRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        article_array [] ARTICLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseArticleList( &article_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"ArticleList\":[" );

        for article_index, _ := range article_array
        {
            if ( article_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseArticle( response_writer, &article_array[ article_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &comment.ArticleId, request, "ArticleId", &error_code )
         && GetRequestUint64( &comment.UserId, request, "UserId", &error_code )
         && GetRequestString( &comment.Text, request, "Text", &error_code )
         && GetRequestDateTime( &comment.DateTime, request, "DateTime", &error_code )
         && AddDatabaseComment( &comment, &error_code ) )
    {
        WriteResponse( response_writer, "{" );
        WriteResponse( response_writer, "\"Id\":" );
        WriteResponseUint64( response_writer, comment.Id );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &comment.Id, request, "Id", &error_code )
         && GetRequestUint64( &comment.ArticleId, request, "ArticleId", &error_code )
         && GetRequestUint64( &comment.UserId, request, "UserId", &error_code )
         && GetRequestString( &comment.Text, request, "Text", &error_code )
         && GetRequestDateTime( &comment.DateTime, request, "DateTime", &error_code )
         && SetDatabaseComment( &comment, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &comment.Id, request, "Id", &error_code )
         && RemoveDatabaseComment( &comment, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &comment.Id, request, "Id", &error_code )
         && GetDatabaseComment( &comment, &error_code ) )
    {
        WriteResponse( response_writer, "{\"Comment\":" );
        WriteResponseComment( response_writer, &comment );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetCommentListRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        comment_array [] COMMENT;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseCommentList( &comment_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"CommentList\":[" );

        for comment_index, _ := range comment_array
        {
            if ( comment_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseComment( response_writer, &comment_array[ comment_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
        WriteResponse( response_writer, "{" );
        WriteResponse( response_writer, "\"Id\":" );
        WriteResponseUint64( response_writer, subscriber.Id );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &subscriber.Id, request, "Id", &error_code )
         && GetRequestString( &subscriber.Name, request, "Name", &error_code )
         && GetRequestString( &subscriber.Email, request, "Email", &error_code )
         && SetDatabaseSubscriber( &subscriber, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &subscriber.Id, request, "Id", &error_code )
         && RemoveDatabaseSubscriber( &subscriber, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
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
         && GetRequestUint64( &subscriber.Id, request, "Id", &error_code )
         && GetDatabaseSubscriber( &subscriber, &error_code ) )
    {
        WriteResponse( response_writer, "{\"Subscriber\":" );
        WriteResponseSubscriber( response_writer, &subscriber );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSubscriberListRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        subscriber_array [] SUBSCRIBER;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseSubscriberList( &subscriber_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"SubscriberList\":[" );

        for subscriber_index, _ := range subscriber_array
        {
            if ( subscriber_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseSubscriber( response_writer, &subscriber_array[ subscriber_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}
