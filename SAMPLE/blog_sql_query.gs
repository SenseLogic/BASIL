func AddDatabaseSection(
    section * SECTION,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "insert into SECTION( Number, Name, Text, Image ) values( ?, ?, ?, ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseSection(
    section * SECTION,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "update SECTION set Number = ?, Name = ?, Text = ?, Image = ? where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseSection(
    section * SECTION,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "delete from SECTION where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    result, error_
        := statement.Exec(
               section.Id
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseSection(
    section * SECTION,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "select Number, Name, Text, Image, ImageIndex from SECTION where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    rows, error_
        := statement.Query(
               section.Id
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
            error_code.Set( error_ , http.StatusBadRequest );

            return false;
        }
    }

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func AddDatabaseUser(
    user * USER,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "insert into USER( FirstName, LastName, Email, Pseudonym, Password, Phone, Street, City, Code, Region, Country, Company, ItIsAdministrator ) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseUser(
    user * USER,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "update USER set FirstName = ?, LastName = ?, Email = ?, Pseudonym = ?, Password = ?, Phone = ?, Street = ?, City = ?, Code = ?, Region = ?, Country = ?, Company = ?, ItIsAdministrator = ? where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseUser(
    user * USER,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "delete from USER where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    result, error_
        := statement.Exec(
               user.Id
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseUser(
    user * USER,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "select FirstName, LastName, Email, Pseudonym, Password, Phone, Street, City, Code, Region, Country, Company, ItIsAdministrator from USER where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    rows, error_
        := statement.Query(
               user.Id
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
            error_code.Set( error_ , http.StatusBadRequest );

            return false;
        }
    }

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func AddDatabaseArticle(
    article * ARTICLE,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "insert into ARTICLE( SectionId, UserId, Title, Text, Image, Date ) values( ?, ?, ?, ?, ?, ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseArticle(
    article * ARTICLE,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "update ARTICLE set SectionId = ?, UserId = ?, Title = ?, Text = ?, Image = ?, Date = ? where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseArticle(
    article * ARTICLE,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "delete from ARTICLE where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    result, error_
        := statement.Exec(
               article.Id
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseArticle(
    article * ARTICLE,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "select SectionId, UserId, Title, Text, Image, Date, Section, User, ImageIndex from ARTICLE where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    rows, error_
        := statement.Query(
               article.Id
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
            error_code.Set( error_ , http.StatusBadRequest );

            return false;
        }
    }

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func AddDatabaseComment(
    comment * COMMENT,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "insert into COMMENT( ArticleId, UserId, Text, DateTime ) values( ?, ?, ?, ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseComment(
    comment * COMMENT,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "update COMMENT set ArticleId = ?, UserId = ?, Text = ?, DateTime = ? where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseComment(
    comment * COMMENT,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "delete from COMMENT where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    result, error_
        := statement.Exec(
               comment.Id
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseComment(
    comment * COMMENT,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "select ArticleId, UserId, Text, DateTime, Article, User from COMMENT where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    rows, error_
        := statement.Query(
               comment.Id
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
            error_code.Set( error_ , http.StatusBadRequest );

            return false;
        }
    }

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func AddDatabaseSubscriber(
    subscriber * SUBSCRIBER,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "insert into SUBSCRIBER( Name, Email ) values( ?, ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    result, error_
        := statement.Exec(
               subscriber.Name,
               subscriber.Email
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func SetDatabaseSubscriber(
    subscriber * SUBSCRIBER,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "update SUBSCRIBER set Name = ?, Email = ? where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func RemoveDatabaseSubscriber(
    subscriber * SUBSCRIBER,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "delete from SUBSCRIBER where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    result, error_
        := statement.Exec(
               subscriber.Id
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}

// ~~

func GetDatabaseSubscriber(
    subscriber * SUBSCRIBER,
    error_code * ERROR_CODE
    ) bool
{
    statement, error_
        := DatabaseSession.Prepare(
               "select Name, Email from SUBSCRIBER where Id = ? )"
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    rows, error_
        := statement.Query(
               subscriber.Id
               );

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

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
            error_code.Set( error_ , http.StatusBadRequest );

            return false;
        }
    }

    if ( error_ != nil )
    {
        error_code.Set( error_ , http.StatusBadRequest );

        return false;
    }

    return true;
}
