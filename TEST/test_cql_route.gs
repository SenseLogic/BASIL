func RouteDatabaseRequests(
    router chi.Router
    )
{
    router.Post( "/add_simple", HandleAddSimpleRequest );
    router.Post( "/set_simple", HandleSetSimpleRequest );
    router.Post( "/remove_simple", HandleRemoveSimpleRequest );
    router.Post( "/get_simple", HandleGetSimpleRequest );
    router.Post( "/get_simple_list", HandleGetSimpleListRequest );

    router.Post( "/add_compound", HandleAddCompoundRequest );
    router.Post( "/set_compound", HandleSetCompoundRequest );
    router.Post( "/remove_compound", HandleRemoveCompoundRequest );
    router.Post( "/get_compound", HandleGetCompoundRequest );
    router.Post( "/get_compound_list", HandleGetCompoundListRequest );

    router.Post( "/add_value", HandleAddValueRequest );
    router.Post( "/set_value", HandleSetValueRequest );
    router.Post( "/remove_value", HandleRemoveValueRequest );
    router.Post( "/get_value", HandleGetValueRequest );
    router.Post( "/get_value_list", HandleGetValueListRequest );

    router.Post( "/add_data", HandleAddDataRequest );
    router.Post( "/set_data", HandleSetDataRequest );
    router.Post( "/remove_data", HandleRemoveDataRequest );
    router.Post( "/get_data", HandleGetDataRequest );
    router.Post( "/get_data_list", HandleGetDataListRequest );
}
