func RouteDatabaseRequests(
    router chi.Router
    )
{
    router.Post( "/add_section", HandleAddSECTIONDatabaseRequest );
    router.Post( "/set_section", HandleSetSECTIONDatabaseRequest );
    router.Post( "/remove_section", HandleRemoveSECTIONDatabaseRequest );
    router.Post( "/get_section", HandleGetSECTIONDatabaseRequest );
    router.Post( "/get_section_list", HandleGetSECTIONListDatabaseRequest );

    router.Post( "/add_user", HandleAddUSERDatabaseRequest );
    router.Post( "/set_user", HandleSetUSERDatabaseRequest );
    router.Post( "/remove_user", HandleRemoveUSERDatabaseRequest );
    router.Post( "/get_user", HandleGetUSERDatabaseRequest );
    router.Post( "/get_user_list", HandleGetUSERListDatabaseRequest );

    router.Post( "/add_article", HandleAddARTICLEDatabaseRequest );
    router.Post( "/set_article", HandleSetARTICLEDatabaseRequest );
    router.Post( "/remove_article", HandleRemoveARTICLEDatabaseRequest );
    router.Post( "/get_article", HandleGetARTICLEDatabaseRequest );
    router.Post( "/get_article_list", HandleGetARTICLEListDatabaseRequest );

    router.Post( "/add_comment", HandleAddCOMMENTDatabaseRequest );
    router.Post( "/set_comment", HandleSetCOMMENTDatabaseRequest );
    router.Post( "/remove_comment", HandleRemoveCOMMENTDatabaseRequest );
    router.Post( "/get_comment", HandleGetCOMMENTDatabaseRequest );
    router.Post( "/get_comment_list", HandleGetCOMMENTListDatabaseRequest );

    router.Post( "/add_subscriber", HandleAddSUBSCRIBERDatabaseRequest );
    router.Post( "/set_subscriber", HandleSetSUBSCRIBERDatabaseRequest );
    router.Post( "/remove_subscriber", HandleRemoveSUBSCRIBERDatabaseRequest );
    router.Post( "/get_subscriber", HandleGetSUBSCRIBERDatabaseRequest );
    router.Post( "/get_subscriber_list", HandleGetSUBSCRIBERListDatabaseRequest );
}
