func RouteDatabaseRequests(
    router Router
    )
{
    router.Post( "/api/add_section", HandleAddSectionRequest );
    router.Post( "/api/set_section", HandleSetSectionRequest );
    router.Post( "/api/remove_section", HandleRemoveSectionRequest );
    router.Post( "/api/get_section", HandleGetSectionRequest );
    router.Post( "/api/get_section_array", HandleGetSectionArrayRequest );

    router.Post( "/api/add_user", HandleAddUserRequest );
    router.Post( "/api/set_user", HandleSetUserRequest );
    router.Post( "/api/remove_user", HandleRemoveUserRequest );
    router.Post( "/api/get_user", HandleGetUserRequest );
    router.Post( "/api/get_user_array", HandleGetUserArrayRequest );

    router.Post( "/api/add_article", HandleAddArticleRequest );
    router.Post( "/api/set_article", HandleSetArticleRequest );
    router.Post( "/api/remove_article", HandleRemoveArticleRequest );
    router.Post( "/api/get_article", HandleGetArticleRequest );
    router.Post( "/api/get_article_array", HandleGetArticleArrayRequest );

    router.Post( "/api/add_comment", HandleAddCommentRequest );
    router.Post( "/api/set_comment", HandleSetCommentRequest );
    router.Post( "/api/remove_comment", HandleRemoveCommentRequest );
    router.Post( "/api/get_comment", HandleGetCommentRequest );
    router.Post( "/api/get_comment_array", HandleGetCommentArrayRequest );

    router.Post( "/api/add_subscriber", HandleAddSubscriberRequest );
    router.Post( "/api/set_subscriber", HandleSetSubscriberRequest );
    router.Post( "/api/remove_subscriber", HandleRemoveSubscriberRequest );
    router.Post( "/api/get_subscriber", HandleGetSubscriberRequest );
    router.Post( "/api/get_subscriber_array", HandleGetSubscriberArrayRequest );
}
