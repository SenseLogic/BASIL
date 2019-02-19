func WriteResponseSection(
    response_writer http.ResponseWriter,
    section * SECTION
    )
{
    WriteResponse( response_writer, "{\"Id\":" );
    WriteResponseUint64( response_writer, section.Id );
    WriteResponse( response_writer, ",\"Number\":" );
    WriteResponseUint64( response_writer, section.Number );
    WriteResponse( response_writer, ",\"Name\":" );
    WriteResponseString( response_writer, section.Name );
    WriteResponse( response_writer, ",\"Text\":" );
    WriteResponseString( response_writer, section.Text );
    WriteResponse( response_writer, ",\"Image\":" );
    WriteResponseString( response_writer, section.Image );
    WriteResponse( response_writer, "}" );
}

// ~~

func WriteResponseUser(
    response_writer http.ResponseWriter,
    user * USER
    )
{
    WriteResponse( response_writer, "{\"Id\":" );
    WriteResponseUint64( response_writer, user.Id );
    WriteResponse( response_writer, ",\"FirstName\":" );
    WriteResponseString( response_writer, user.FirstName );
    WriteResponse( response_writer, ",\"LastName\":" );
    WriteResponseString( response_writer, user.LastName );
    WriteResponse( response_writer, ",\"Email\":" );
    WriteResponseString( response_writer, user.Email );
    WriteResponse( response_writer, ",\"Pseudonym\":" );
    WriteResponseString( response_writer, user.Pseudonym );
    WriteResponse( response_writer, ",\"Password\":" );
    WriteResponseString( response_writer, user.Password );
    WriteResponse( response_writer, ",\"Phone\":" );
    WriteResponseString( response_writer, user.Phone );
    WriteResponse( response_writer, ",\"Street\":" );
    WriteResponseString( response_writer, user.Street );
    WriteResponse( response_writer, ",\"City\":" );
    WriteResponseString( response_writer, user.City );
    WriteResponse( response_writer, ",\"Code\":" );
    WriteResponseString( response_writer, user.Code );
    WriteResponse( response_writer, ",\"Region\":" );
    WriteResponseString( response_writer, user.Region );
    WriteResponse( response_writer, ",\"Country\":" );
    WriteResponseString( response_writer, user.Country );
    WriteResponse( response_writer, ",\"Company\":" );
    WriteResponseString( response_writer, user.Company );
    WriteResponse( response_writer, ",\"ItIsAdministrator\":" );
    WriteResponseBool( response_writer, user.ItIsAdministrator );
    WriteResponse( response_writer, "}" );
}

// ~~

func WriteResponseArticle(
    response_writer http.ResponseWriter,
    article * ARTICLE
    )
{
    WriteResponse( response_writer, "{\"Id\":" );
    WriteResponseUint64( response_writer, article.Id );
    WriteResponse( response_writer, ",\"SectionId\":" );
    WriteResponseUint64( response_writer, article.SectionId );
    WriteResponse( response_writer, ",\"UserId\":" );
    WriteResponseUint64( response_writer, article.UserId );
    WriteResponse( response_writer, ",\"Title\":" );
    WriteResponseString( response_writer, article.Title );
    WriteResponse( response_writer, ",\"Text\":" );
    WriteResponseString( response_writer, article.Text );
    WriteResponse( response_writer, ",\"Image\":" );
    WriteResponseString( response_writer, article.Image );
    WriteResponse( response_writer, ",\"Date\":" );
    WriteResponseDateTime( response_writer, article.Date );
    WriteResponse( response_writer, "}" );
}

// ~~

func WriteResponseComment(
    response_writer http.ResponseWriter,
    comment * COMMENT
    )
{
    WriteResponse( response_writer, "{\"Id\":" );
    WriteResponseUint64( response_writer, comment.Id );
    WriteResponse( response_writer, ",\"ArticleId\":" );
    WriteResponseUint64( response_writer, comment.ArticleId );
    WriteResponse( response_writer, ",\"UserId\":" );
    WriteResponseUint64( response_writer, comment.UserId );
    WriteResponse( response_writer, ",\"Text\":" );
    WriteResponseString( response_writer, comment.Text );
    WriteResponse( response_writer, ",\"DateTime\":" );
    WriteResponseDateTime( response_writer, comment.DateTime );
    WriteResponse( response_writer, "}" );
}

// ~~

func WriteResponseSubscriber(
    response_writer http.ResponseWriter,
    subscriber * SUBSCRIBER
    )
{
    WriteResponse( response_writer, "{\"Id\":" );
    WriteResponseUint64( response_writer, subscriber.Id );
    WriteResponse( response_writer, ",\"Name\":" );
    WriteResponseString( response_writer, subscriber.Name );
    WriteResponse( response_writer, ",\"Email\":" );
    WriteResponseString( response_writer, subscriber.Email );
    WriteResponse( response_writer, "}" );
}
