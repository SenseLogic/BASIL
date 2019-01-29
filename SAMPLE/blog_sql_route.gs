func RouteRequest(
    router ROUTER
    )
{
    router.Post( "/add_section", HandleAddSectionRequest );
    router.Post( "/set_section", HandleSetSectionRequest );
    router.Post( "/remove_section", HandleRemoveSectionRequest );
    router.Post( "/get_section", HandleGetSectionRequest );

    router.Post( "/add_user", HandleAddUserRequest );
    router.Post( "/set_user", HandleSetUserRequest );
    router.Post( "/remove_user", HandleRemoveUserRequest );
    router.Post( "/get_user", HandleGetUserRequest );

    router.Post( "/add_article", HandleAddArticleRequest );
    router.Post( "/set_article", HandleSetArticleRequest );
    router.Post( "/remove_article", HandleRemoveArticleRequest );
    router.Post( "/get_article", HandleGetArticleRequest );

    router.Post( "/add_comment", HandleAddCommentRequest );
    router.Post( "/set_comment", HandleSetCommentRequest );
    router.Post( "/remove_comment", HandleRemoveCommentRequest );
    router.Post( "/get_comment", HandleGetCommentRequest );

    router.Post( "/add_subscriber", HandleAddSubscriberRequest );
    router.Post( "/set_subscriber", HandleSetSubscriberRequest );
    router.Post( "/remove_subscriber", HandleRemoveSubscriberRequest );
    router.Post( "/get_subscriber", HandleGetSubscriberRequest );
}
