func RouteDatabaseRequests(
    router Router
    )
{
    router.Post( "/add_simple", HandleAddSimpleRequest );
    router.Post( "/set_simple", HandleSetSimpleRequest );
    router.Post( "/remove_simple", HandleRemoveSimpleRequest );
    router.Post( "/get_simple", HandleGetSimpleRequest );
    router.Post( "/get_simple_array", HandleGetSimpleArrayRequest );

    router.Post( "/add_compound", HandleAddCompoundRequest );
    router.Post( "/set_compound", HandleSetCompoundRequest );
    router.Post( "/remove_compound", HandleRemoveCompoundRequest );
    router.Post( "/get_compound", HandleGetCompoundRequest );
    router.Post( "/get_compound_array", HandleGetCompoundArrayRequest );
}
