func WriteResponseSection(
    writer io.Writer,
    section * SECTION
    )
{
    WriteResponse( writer, "{\"Id\":" );
    WriteResponseUint64( writer, section.Id );
    WriteResponse( writer, ",\"Number\":" );
    WriteResponseUint64( writer, section.Number );
    WriteResponse( writer, ",\"Name\":" );
    WriteResponseString( writer, section.Name );
    WriteResponse( writer, ",\"Text\":" );
    WriteResponseString( writer, section.Text );
    WriteResponse( writer, ",\"Image\":" );
    WriteResponseString( writer, section.Image );
    WriteResponse( writer, "}" );
}

// ~~

func WriteResponseUser(
    writer io.Writer,
    user * USER
    )
{
    WriteResponse( writer, "{\"Id\":" );
    WriteResponseUint64( writer, user.Id );
    WriteResponse( writer, ",\"FirstName\":" );
    WriteResponseString( writer, user.FirstName );
    WriteResponse( writer, ",\"LastName\":" );
    WriteResponseString( writer, user.LastName );
    WriteResponse( writer, ",\"Email\":" );
    WriteResponseString( writer, user.Email );
    WriteResponse( writer, ",\"Pseudonym\":" );
    WriteResponseString( writer, user.Pseudonym );
    WriteResponse( writer, ",\"Password\":" );
    WriteResponseString( writer, user.Password );
    WriteResponse( writer, ",\"Phone\":" );
    WriteResponseString( writer, user.Phone );
    WriteResponse( writer, ",\"Street\":" );
    WriteResponseString( writer, user.Street );
    WriteResponse( writer, ",\"City\":" );
    WriteResponseString( writer, user.City );
    WriteResponse( writer, ",\"Code\":" );
    WriteResponseString( writer, user.Code );
    WriteResponse( writer, ",\"Region\":" );
    WriteResponseString( writer, user.Region );
    WriteResponse( writer, ",\"Country\":" );
    WriteResponseString( writer, user.Country );
    WriteResponse( writer, ",\"Company\":" );
    WriteResponseString( writer, user.Company );
    WriteResponse( writer, ",\"ItIsAdministrator\":" );
    WriteResponseBool( writer, user.ItIsAdministrator );
    WriteResponse( writer, "}" );
}

// ~~

func WriteResponseArticle(
    writer io.Writer,
    article * ARTICLE
    )
{
    WriteResponse( writer, "{\"Id\":" );
    WriteResponseUint64( writer, article.Id );
    WriteResponse( writer, ",\"SectionId\":" );
    WriteResponseUint64( writer, article.SectionId );
    WriteResponse( writer, ",\"UserId\":" );
    WriteResponseUint64( writer, article.UserId );
    WriteResponse( writer, ",\"Title\":" );
    WriteResponseString( writer, article.Title );
    WriteResponse( writer, ",\"Text\":" );
    WriteResponseString( writer, article.Text );
    WriteResponse( writer, ",\"Image\":" );
    WriteResponseString( writer, article.Image );
    WriteResponse( writer, ",\"Date\":" );
    WriteResponseDateTime( writer, article.Date );
    WriteResponse( writer, "}" );
}

// ~~

func WriteResponseComment(
    writer io.Writer,
    comment * COMMENT
    )
{
    WriteResponse( writer, "{\"Id\":" );
    WriteResponseUint64( writer, comment.Id );
    WriteResponse( writer, ",\"ArticleId\":" );
    WriteResponseUint64( writer, comment.ArticleId );
    WriteResponse( writer, ",\"UserId\":" );
    WriteResponseUint64( writer, comment.UserId );
    WriteResponse( writer, ",\"Text\":" );
    WriteResponseString( writer, comment.Text );
    WriteResponse( writer, ",\"DateTime\":" );
    WriteResponseDateTime( writer, comment.DateTime );
    WriteResponse( writer, "}" );
}

// ~~

func WriteResponseSubscriber(
    writer io.Writer,
    subscriber * SUBSCRIBER
    )
{
    WriteResponse( writer, "{\"Id\":" );
    WriteResponseUint64( writer, subscriber.Id );
    WriteResponse( writer, ",\"Name\":" );
    WriteResponseString( writer, subscriber.Name );
    WriteResponse( writer, ",\"Email\":" );
    WriteResponseString( writer, subscriber.Email );
    WriteResponse( writer, "}" );
}
