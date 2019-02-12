func RouteDatabaseRequests(
    router Router
    )
{
    router.Post( "/api/add_simple", HandleAddSimpleRequest );
    router.Post( "/api/set_simple", HandleSetSimpleRequest );
    router.Post( "/api/remove_simple", HandleRemoveSimpleRequest );
    router.Post( "/api/get_simple", HandleGetSimpleRequest );
    router.Post( "/api/get_simple_array", HandleGetSimpleArrayRequest );

    router.Post( "/api/add_compound", HandleAddCompoundRequest );
    router.Post( "/api/set_compound", HandleSetCompoundRequest );
    router.Post( "/api/remove_compound", HandleRemoveCompoundRequest );
    router.Post( "/api/get_compound", HandleGetCompoundRequest );
    router.Post( "/api/get_compound_array", HandleGetCompoundArrayRequest );

    router.Post( "/api/add_value", HandleAddValueRequest );
    router.Post( "/api/set_value", HandleSetValueRequest );
    router.Post( "/api/remove_value", HandleRemoveValueRequest );
    router.Post( "/api/get_value", HandleGetValueRequest );
    router.Post( "/api/get_value_array", HandleGetValueArrayRequest );

    router.Post( "/api/add_data", HandleAddDataRequest );
    router.Post( "/api/set_data", HandleSetDataRequest );
    router.Post( "/api/remove_data", HandleRemoveDataRequest );
    router.Post( "/api/get_data", HandleGetDataRequest );
    router.Post( "/api/get_data_array", HandleGetDataArrayRequest );
}
