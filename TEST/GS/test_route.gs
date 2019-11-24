func RouteDatabaseRequests(
    router chi.Router
    )
{
    router.Post( "/add_simple", HandleAddSIMPLEDatabaseRequest );
    router.Post( "/set_simple", HandleSetSIMPLEDatabaseRequest );
    router.Post( "/remove_simple", HandleRemoveSIMPLEDatabaseRequest );
    router.Post( "/get_simple", HandleGetSIMPLEDatabaseRequest );
    router.Post( "/get_simple_list", HandleGetSIMPLEListDatabaseRequest );

    router.Post( "/add_compound", HandleAddCOMPOUNDDatabaseRequest );
    router.Post( "/set_compound", HandleSetCOMPOUNDDatabaseRequest );
    router.Post( "/remove_compound", HandleRemoveCOMPOUNDDatabaseRequest );
    router.Post( "/get_compound", HandleGetCOMPOUNDDatabaseRequest );
    router.Post( "/get_compound_list", HandleGetCOMPOUNDListDatabaseRequest );

    router.Post( "/add_value", HandleAddVALUEDatabaseRequest );
    router.Post( "/set_value", HandleSetVALUEDatabaseRequest );
    router.Post( "/remove_value", HandleRemoveVALUEDatabaseRequest );
    router.Post( "/get_value", HandleGetVALUEDatabaseRequest );
    router.Post( "/get_value_list", HandleGetVALUEListDatabaseRequest );

    router.Post( "/add_data", HandleAddDATADatabaseRequest );
    router.Post( "/set_data", HandleSetDATADatabaseRequest );
    router.Post( "/remove_data", HandleRemoveDATADatabaseRequest );
    router.Post( "/get_data", HandleGetDATADatabaseRequest );
    router.Post( "/get_data_list", HandleGetDATAListDatabaseRequest );
}
