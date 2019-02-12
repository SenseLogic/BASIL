func WriteResponseSection(
    response_writer http.ResponseWriter,
    section * SECTION
    )
{
    WriteResponse( response_writer, "{\"Uuid\":" );
    WriteResponseUuid( response_writer, section.Uuid );
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
    WriteResponse( response_writer, "{\"Uuid\":" );
    WriteResponseUuid( response_writer, user.Uuid );
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
    WriteResponse( response_writer, "{\"Uuid\":" );
    WriteResponseUuid( response_writer, article.Uuid );
    WriteResponse( response_writer, ",\"SectionUuid\":" );
    WriteResponseUuid( response_writer, article.SectionUuid );
    WriteResponse( response_writer, ",\"UserUuid\":" );
    WriteResponseUuid( response_writer, article.UserUuid );
    WriteResponse( response_writer, ",\"Title\":" );
    WriteResponseString( response_writer, article.Title );
    WriteResponse( response_writer, ",\"Text\":" );
    WriteResponseString( response_writer, article.Text );
    WriteResponse( response_writer, ",\"Image\":" );
    WriteResponseString( response_writer, article.Image );
    WriteResponse( response_writer, ",\"Date\":" );
    WriteResponseString( response_writer, article.Date );
    WriteResponse( response_writer, "}" );
}

// ~~

func WriteResponseComment(
    response_writer http.ResponseWriter,
    comment * COMMENT
    )
{
    WriteResponse( response_writer, "{\"Uuid\":" );
    WriteResponseUuid( response_writer, comment.Uuid );
    WriteResponse( response_writer, ",\"ArticleUuid\":" );
    WriteResponseUuid( response_writer, comment.ArticleUuid );
    WriteResponse( response_writer, ",\"UserUuid\":" );
    WriteResponseUuid( response_writer, comment.UserUuid );
    WriteResponse( response_writer, ",\"Text\":" );
    WriteResponseString( response_writer, comment.Text );
    WriteResponse( response_writer, ",\"DateTime\":" );
    WriteResponseString( response_writer, comment.DateTime );
    WriteResponse( response_writer, "}" );
}

// ~~

func WriteResponseSubscriber(
    response_writer http.ResponseWriter,
    subscriber * SUBSCRIBER
    )
{
    WriteResponse( response_writer, "{\"Uuid\":" );
    WriteResponseUuid( response_writer, subscriber.Uuid );
    WriteResponse( response_writer, ",\"Name\":" );
    WriteResponseString( response_writer, subscriber.Name );
    WriteResponse( response_writer, ",\"Email\":" );
    WriteResponseString( response_writer, subscriber.Email );
    WriteResponse( response_writer, "}" );
}
