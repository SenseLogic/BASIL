%%test_types.go
package main;

// -- TYPES

<%type {{table_go_type}} struct {
<~    {{column_go_name}} {{column_go_type}};
~>}<?!{{table_is_last}}#

// ~~

?>%>
%%test_types.cs
// -- IMPORTS

using System;
using System.Collections.Generic;

// -- TYPES

<%{{table_csharp_type_declaration}}
{
{{table_csharp_attribute_declaration}}}<?!{{table_is_last}}#

// ~~

?>%>
%%test_tables.gs
package main;

// -- IMPORTS

import "fmt";

// -- FUNCTIONS

func main(
    )
{
    fmt.Println( "Tables :" );
<%    fmt.Println( "    {{table_name}}<?!{{table_is_last}}#,?>" );
    fmt.Println( "        Columns :" );
<~    fmt.Println( "            {{column_name}}<?!{{column_is_last}}#,?>" );
~>    fmt.Println( "        Key columns :" );
<~<?{{column_is_key}}#    fmt.Println( "            {{column_name}}<?!{{column_is_last_key}}#,?>" );
?>~>    fmt.Println( "        Not key columns :" );
<~<?!{{column_is_key}}#    fmt.Println( "            {{column_name}}<?!{{column_is_last_not_key}}#,?>" );
?>~>    fmt.Println( "        Stored columns :" );
<~<?{{column_is_stored}}#    fmt.Println( "            {{column_name}}<?!{{column_is_last_stored}}#,?>" );
?>~>    fmt.Println( "        Not stored columns :" );
<~<?!{{column_is_stored}}#    fmt.Println( "            {{column_name}}<?!{{column_is_last_not_stored}}#,?>" );
?>~>%>}
