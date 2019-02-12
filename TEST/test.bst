##test_types.go
package main;

// -- TYPES

[*type {{table_go_type}} struct {
<*    {{column_go_name}} {{column_go_type}};
*>}

// ~~

*]
##test_types.cs
// -- IMPORTS

using System;
using System.Collections.Generic;

// -- TYPES

[*{{table_csharp_type_declaration}}
{
{{table_csharp_attribute_declaration}}}

// ~~

*]
##test_tables.gs
package main;

// -- IMPORTS

import "fmt";

// -- FUNCTIONS

func main(
    )
{
    fmt.Println( "Tables :" );
[*    fmt.Println( "    {{table_name}}" );
    fmt.Println( "        Columns :" );
<*    fmt.Println( "            {{column_name}}" );
*>    fmt.Println( "        Columns :" );
<*^    fmt.Println( "            {{column_name}}," );
^*><*$    fmt.Println( "            {{column_name}}" );
$*>    fmt.Println( "        Key columns :" );
<#    fmt.Println( "            {{column_name}}" );
#>    fmt.Println( "        Key columns :" );
<#^    fmt.Println( "            {{column_name}}," );
^#><#$    fmt.Println( "            {{column_name}}" );
$#>    fmt.Println( "        Not key columns :" );
<~    fmt.Println( "            {{column_name}}" );
~>    fmt.Println( "        Not key columns :" );
<~^    fmt.Println( "            {{column_name}}," );
^~><~$    fmt.Println( "            {{column_name}}" );
$~>    fmt.Println( "        Stored columns :" );
<.    fmt.Println( "            {{column_name}}" );
.>    fmt.Println( "        Stored columns :" );
<.^    fmt.Println( "            {{column_name}}," );
^.><.$    fmt.Println( "            {{column_name}}" );
$.>    fmt.Println( "        Not stored columns :" );
<!    fmt.Println( "            {{column_name}}" );
!>    fmt.Println( "        Not stored columns :" );
<!^    fmt.Println( "            {{column_name}}," );
^!><!$    fmt.Println( "            {{column_name}}" );
$!>*]    fmt.Println( "Stored tables :" );
[.    fmt.Println( "    {{table_name}}" );
    fmt.Println( "        Columns :" );
<*    fmt.Println( "            {{column_name}}" );
*>    fmt.Println( "        Columns :" );
<*^    fmt.Println( "            {{column_name}}," );
^*><*$    fmt.Println( "            {{column_name}}" );
$*>.]    fmt.Println( "Not stored tables :" );
[!    fmt.Println( "    {{table_name}}" );
    fmt.Println( "        Columns :" );
<*    fmt.Println( "            {{column_name}}" );
*>    fmt.Println( "        Columns :" );
<*^    fmt.Println( "            {{column_name}}," );
^*><*$    fmt.Println( "            {{column_name}}" );
$*>!]}
