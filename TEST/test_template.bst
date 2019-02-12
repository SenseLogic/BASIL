##test_instance.go
package main;

[*type {{table_go_type}} struct {
<*    {{column_go_type}} {{column_go_name}};
*>}

// ~~

*]

##test_instance.gs
package main;

import "    fmt";

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
