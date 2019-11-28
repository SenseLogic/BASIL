func RouteDatabaseRequests(
    router chi.Router
    )
{
    router.Post( "/add_simple", HandleAddSimpleDatabaseRequest );
    router.Post( "/set_simple", HandleSetSimpleDatabaseRequest );
    router.Post( "/remove_simple", HandleRemoveSimpleDatabaseRequest );
    router.Post( "/get_simple", HandleGetSimpleDatabaseRequest );
    router.Post( "/get_simple_list", HandleGetSimpleListDatabaseRequest );

    router.Post( "/add_compound", HandleAddCompoundDatabaseRequest );
    router.Post( "/set_compound", HandleSetCompoundDatabaseRequest );
    router.Post( "/remove_compound", HandleRemoveCompoundDatabaseRequest );
    router.Post( "/get_compound", HandleGetCompoundDatabaseRequest );
    router.Post( "/get_compound_list", HandleGetCompoundListDatabaseRequest );

    router.Post( "/add_value", HandleAddValueDatabaseRequest );
    router.Post( "/set_value", HandleSetValueDatabaseRequest );
    router.Post( "/remove_value", HandleRemoveValueDatabaseRequest );
    router.Post( "/get_value", HandleGetValueDatabaseRequest );
    router.Post( "/get_value_list", HandleGetValueListDatabaseRequest );

    router.Post( "/add_data", HandleAddDataDatabaseRequest );
    router.Post( "/set_data", HandleSetDataDatabaseRequest );
    router.Post( "/remove_data", HandleRemoveDataDatabaseRequest );
    router.Post( "/get_data", HandleGetDataDatabaseRequest );
    router.Post( "/get_data_list", HandleGetDataListDatabaseRequest );
}
