func RouteDatabaseRequests(
    router chi.Router
    )
{
    router.Post( "/add_section", HandleAddSectionDatabaseRequest );
    router.Post( "/set_section", HandleSetSectionDatabaseRequest );
    router.Post( "/remove_section", HandleRemoveSectionDatabaseRequest );
    router.Post( "/get_section", HandleGetSectionDatabaseRequest );
    router.Post( "/get_section_list", HandleGetSectionListDatabaseRequest );

    router.Post( "/add_user", HandleAddUserDatabaseRequest );
    router.Post( "/set_user", HandleSetUserDatabaseRequest );
    router.Post( "/remove_user", HandleRemoveUserDatabaseRequest );
    router.Post( "/get_user", HandleGetUserDatabaseRequest );
    router.Post( "/get_user_list", HandleGetUserListDatabaseRequest );

    router.Post( "/add_article", HandleAddArticleDatabaseRequest );
    router.Post( "/set_article", HandleSetArticleDatabaseRequest );
    router.Post( "/remove_article", HandleRemoveArticleDatabaseRequest );
    router.Post( "/get_article", HandleGetArticleDatabaseRequest );
    router.Post( "/get_article_list", HandleGetArticleListDatabaseRequest );

    router.Post( "/add_comment", HandleAddCommentDatabaseRequest );
    router.Post( "/set_comment", HandleSetCommentDatabaseRequest );
    router.Post( "/remove_comment", HandleRemoveCommentDatabaseRequest );
    router.Post( "/get_comment", HandleGetCommentDatabaseRequest );
    router.Post( "/get_comment_list", HandleGetCommentListDatabaseRequest );

    router.Post( "/add_subscriber", HandleAddSubscriberDatabaseRequest );
    router.Post( "/set_subscriber", HandleSetSubscriberDatabaseRequest );
    router.Post( "/remove_subscriber", HandleRemoveSubscriberDatabaseRequest );
    router.Post( "/get_subscriber", HandleGetSubscriberDatabaseRequest );
    router.Post( "/get_subscriber_list", HandleGetSubscriberListDatabaseRequest );
}
