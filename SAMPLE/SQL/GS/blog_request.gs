func HandleAddSECTIONDatabaseRequest(
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
         && AddDatabaseSECTION( &section, &error_code ) )
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

func HandleSetSECTIONDatabaseRequest(
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
         && SetDatabaseSECTION( &section, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveSECTIONDatabaseRequest(
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
         && RemoveDatabaseSECTION( &section, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSECTIONDatabaseRequest(
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
         && GetDatabaseSECTION( &section, &error_code ) )
    {
        WriteResponse( response_writer, "{\"SECTION\":" );
        WriteResponseSECTION( response_writer, &section );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSECTIONListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        section_array [] SECTION;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseSECTIONList( &section_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"SECTIONList\":[" );

        for section_index, _ := range section_array
        {
            if ( section_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseSECTION( response_writer, &section_array[ section_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleAddUSERDatabaseRequest(
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
         && AddDatabaseUSER( &user, &error_code ) )
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

func HandleSetUSERDatabaseRequest(
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
         && SetDatabaseUSER( &user, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveUSERDatabaseRequest(
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
         && RemoveDatabaseUSER( &user, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetUSERDatabaseRequest(
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
         && GetDatabaseUSER( &user, &error_code ) )
    {
        WriteResponse( response_writer, "{\"USER\":" );
        WriteResponseUSER( response_writer, &user );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetUSERListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        user_array [] USER;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseUSERList( &user_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"USERList\":[" );

        for user_index, _ := range user_array
        {
            if ( user_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseUSER( response_writer, &user_array[ user_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleAddARTICLEDatabaseRequest(
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
         && AddDatabaseARTICLE( &article, &error_code ) )
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

func HandleSetARTICLEDatabaseRequest(
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
         && SetDatabaseARTICLE( &article, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveARTICLEDatabaseRequest(
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
         && RemoveDatabaseARTICLE( &article, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetARTICLEDatabaseRequest(
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
         && GetDatabaseARTICLE( &article, &error_code ) )
    {
        WriteResponse( response_writer, "{\"ARTICLE\":" );
        WriteResponseARTICLE( response_writer, &article );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetARTICLEListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        article_array [] ARTICLE;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseARTICLEList( &article_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"ARTICLEList\":[" );

        for article_index, _ := range article_array
        {
            if ( article_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseARTICLE( response_writer, &article_array[ article_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleAddCOMMENTDatabaseRequest(
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
         && AddDatabaseCOMMENT( &comment, &error_code ) )
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

func HandleSetCOMMENTDatabaseRequest(
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
         && SetDatabaseCOMMENT( &comment, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveCOMMENTDatabaseRequest(
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
         && RemoveDatabaseCOMMENT( &comment, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetCOMMENTDatabaseRequest(
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
         && GetDatabaseCOMMENT( &comment, &error_code ) )
    {
        WriteResponse( response_writer, "{\"COMMENT\":" );
        WriteResponseCOMMENT( response_writer, &comment );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetCOMMENTListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        comment_array [] COMMENT;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseCOMMENTList( &comment_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"COMMENTList\":[" );

        for comment_index, _ := range comment_array
        {
            if ( comment_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseCOMMENT( response_writer, &comment_array[ comment_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleAddSUBSCRIBERDatabaseRequest(
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
         && AddDatabaseSUBSCRIBER( &subscriber, &error_code ) )
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

func HandleSetSUBSCRIBERDatabaseRequest(
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
         && SetDatabaseSUBSCRIBER( &subscriber, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleRemoveSUBSCRIBERDatabaseRequest(
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
         && RemoveDatabaseSUBSCRIBER( &subscriber, &error_code ) )
    {
        WriteResponseSuccess( response_writer );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSUBSCRIBERDatabaseRequest(
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
         && GetDatabaseSUBSCRIBER( &subscriber, &error_code ) )
    {
        WriteResponse( response_writer, "{\"SUBSCRIBER\":" );
        WriteResponseSUBSCRIBER( response_writer, &subscriber );
        WriteResponse( response_writer, "}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}

// ~~

func HandleGetSUBSCRIBERListDatabaseRequest(
    response_writer http.ResponseWriter,
    request * http.Request
    )
{
    var
        error_code ERROR_CODE;
    var
        subscriber_array [] SUBSCRIBER;

    if ( IsAdministratorSession( request, &error_code )
         && GetDatabaseSUBSCRIBERList( &subscriber_array, &error_code ) )
    {
        WriteResponse( response_writer, "{\"SUBSCRIBERList\":[" );

        for subscriber_index, _ := range subscriber_array
        {
            if ( subscriber_index > 0 )
            {
                 WriteResponse( response_writer, "," );
            }

            WriteResponseSUBSCRIBER( response_writer, &subscriber_array[ subscriber_index ] );
        }

        WriteResponse( response_writer, "]}" );
    }
    else
    {
        WriteResponseError( response_writer, &error_code );
    }
}
