func HandleAddSectionDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        section SECTION;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &section.Number, "Number", &error_code )
         && GetRequestString( request, &section.Name, "Name", &error_code )
         && GetRequestString( request, &section.Text, "Text", &error_code )
         && GetRequestString( request, &section.Image, "Image", &error_code )
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

func HandleSetSectionDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        section SECTION;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &section.Id, "Id", &error_code )
         && GetRequestUint64( request, &section.Number, "Number", &error_code )
         && GetRequestString( request, &section.Name, "Name", &error_code )
         && GetRequestString( request, &section.Text, "Text", &error_code )
         && GetRequestString( request, &section.Image, "Image", &error_code )
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

func HandleRemoveSectionDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        section SECTION;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &section.Id, "Id", &error_code )
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

func HandleGetSectionDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        section SECTION;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &section.Id, "Id", &error_code )
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

func HandleGetSectionListDatabaseRequest(
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

func HandleAddUserDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        user USER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestString( request, &user.FirstName, "FirstName", &error_code )
         && GetRequestString( request, &user.LastName, "LastName", &error_code )
         && GetRequestString( request, &user.Email, "Email", &error_code )
         && GetRequestString( request, &user.Pseudonym, "Pseudonym", &error_code )
         && GetRequestString( request, &user.Password, "Password", &error_code )
         && GetRequestString( request, &user.Phone, "Phone", &error_code )
         && GetRequestString( request, &user.Street, "Street", &error_code )
         && GetRequestString( request, &user.City, "City", &error_code )
         && GetRequestString( request, &user.Code, "Code", &error_code )
         && GetRequestString( request, &user.Region, "Region", &error_code )
         && GetRequestString( request, &user.Country, "Country", &error_code )
         && GetRequestString( request, &user.Company, "Company", &error_code )
         && GetRequestBool( request, &user.ItIsAdministrator, "ItIsAdministrator", &error_code )
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

func HandleSetUserDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        user USER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &user.Id, "Id", &error_code )
         && GetRequestString( request, &user.FirstName, "FirstName", &error_code )
         && GetRequestString( request, &user.LastName, "LastName", &error_code )
         && GetRequestString( request, &user.Email, "Email", &error_code )
         && GetRequestString( request, &user.Pseudonym, "Pseudonym", &error_code )
         && GetRequestString( request, &user.Password, "Password", &error_code )
         && GetRequestString( request, &user.Phone, "Phone", &error_code )
         && GetRequestString( request, &user.Street, "Street", &error_code )
         && GetRequestString( request, &user.City, "City", &error_code )
         && GetRequestString( request, &user.Code, "Code", &error_code )
         && GetRequestString( request, &user.Region, "Region", &error_code )
         && GetRequestString( request, &user.Country, "Country", &error_code )
         && GetRequestString( request, &user.Company, "Company", &error_code )
         && GetRequestBool( request, &user.ItIsAdministrator, "ItIsAdministrator", &error_code )
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

func HandleRemoveUserDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        user USER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &user.Id, "Id", &error_code )
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

func HandleGetUserDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        user USER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &user.Id, "Id", &error_code )
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

func HandleGetUserListDatabaseRequest(
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

func HandleAddArticleDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        article ARTICLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &article.SectionId, "SectionId", &error_code )
         && GetRequestUint64( request, &article.UserId, "UserId", &error_code )
         && GetRequestString( request, &article.Title, "Title", &error_code )
         && GetRequestString( request, &article.Text, "Text", &error_code )
         && GetRequestString( request, &article.Image, "Image", &error_code )
         && GetRequestDateTime( request, &article.Date, "Date", &error_code )
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

func HandleSetArticleDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        article ARTICLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &article.Id, "Id", &error_code )
         && GetRequestUint64( request, &article.SectionId, "SectionId", &error_code )
         && GetRequestUint64( request, &article.UserId, "UserId", &error_code )
         && GetRequestString( request, &article.Title, "Title", &error_code )
         && GetRequestString( request, &article.Text, "Text", &error_code )
         && GetRequestString( request, &article.Image, "Image", &error_code )
         && GetRequestDateTime( request, &article.Date, "Date", &error_code )
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

func HandleRemoveArticleDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        article ARTICLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &article.Id, "Id", &error_code )
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

func HandleGetArticleDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        article ARTICLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &article.Id, "Id", &error_code )
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

func HandleGetArticleListDatabaseRequest(
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

func HandleAddCommentDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        comment COMMENT;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &comment.ArticleId, "ArticleId", &error_code )
         && GetRequestUint64( request, &comment.UserId, "UserId", &error_code )
         && GetRequestString( request, &comment.Text, "Text", &error_code )
         && GetRequestDateTime( request, &comment.DateTime, "DateTime", &error_code )
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

func HandleSetCommentDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        comment COMMENT;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &comment.Id, "Id", &error_code )
         && GetRequestUint64( request, &comment.ArticleId, "ArticleId", &error_code )
         && GetRequestUint64( request, &comment.UserId, "UserId", &error_code )
         && GetRequestString( request, &comment.Text, "Text", &error_code )
         && GetRequestDateTime( request, &comment.DateTime, "DateTime", &error_code )
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

func HandleRemoveCommentDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        comment COMMENT;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &comment.Id, "Id", &error_code )
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

func HandleGetCommentDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        comment COMMENT;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &comment.Id, "Id", &error_code )
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

func HandleGetCommentListDatabaseRequest(
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

func HandleAddSubscriberDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        subscriber SUBSCRIBER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestString( request, &subscriber.Name, "Name", &error_code )
         && GetRequestString( request, &subscriber.Email, "Email", &error_code )
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

func HandleSetSubscriberDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        subscriber SUBSCRIBER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &subscriber.Id, "Id", &error_code )
         && GetRequestString( request, &subscriber.Name, "Name", &error_code )
         && GetRequestString( request, &subscriber.Email, "Email", &error_code )
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

func HandleRemoveSubscriberDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        subscriber SUBSCRIBER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &subscriber.Id, "Id", &error_code )
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

func HandleGetSubscriberDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        subscriber SUBSCRIBER;

    if ( IsAdministratorSession( request, &error_code )
         && GetRequestUint64( request, &subscriber.Id, "Id", &error_code )
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

func HandleGetSubscriberListDatabaseRequest(
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
