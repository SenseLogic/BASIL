![](https://github.com/senselogic/BASIL/blob/master/LOGO/basil.png)

# Basil

Database designer and filler.

## Features

*   Describes database schemas through a concise textual specification.
*   Fills the database with user provided data.
*   Generates the remaining data based on the column names, types and properties.
*   Exports the database schema and data in the following formats :
    *   UML
    *   SQL
    *   CQL
*   Instantiates generic and custom template code for the following languages :
    *   Go / Generis
    *   C#
    *   Crystal / Cibyl
    *   Rust

## SQL sample

```cpp
BLOG | count 5

    SECTION

        Id : UINT64 | key, unique, incremented
        Number : UINT64
        Name : STRING | capacity 45
        Text : STRING
        Image : STRING | capacity 45

        ImageIndex : UINT64 | !stored

    USER

        Id : UINT64 | key, unique, incremented
        FirstName : STRING | capacity 45
        LastName : STRING | capacity 45
        Email : STRING | capacity 45
        Pseudonym : STRING | capacity 45
        Password : STRING | capacity 45
        Phone : STRING | capacity 45
        Street : STRING
        City : STRING | capacity 45
        Code : STRING | capacity 45
        Region : STRING | capacity 45
        Country : STRING | capacity 45
        Company : STRING | capacity 45
        ItIsAdministrator : BOOL

    ARTICLE | count 15

        Id : UINT64 | key, unique, incremented
        SectionId : SECTION.Id | indexed
        UserId : USER.Id | indexed
        Title : STRING
        Text : STRING
        Image : STRING | capacity 45
        Date : DATE

        Section : POINTER[ SECTION ] | !stored
        User : POINTER[ USER ] | !stored
        ImageIndex : UINT64 | !stored

    COMMENT | count 30

        Id : UINT64 | key, unique, incremented
        ArticleId : ARTICLE.Id | indexed
        UserId : USER.Id | indexed
        Text : STRING | english 2 4 5 7
        DateTime : DATETIME

        Article : POINTER[ ARTICLE ] | !stored
        User : POINTER[ USER ] | !stored

    SUBSCRIBER

        Id : UINT64 | key, unique, incremented
        Name : STRING | capacity 45
        Email : STRING | capacity 45

    %SECTION

        Number Name

            1 ~ Sports
            2 ~ Gaming
            3 ~ Entertainment
            4 ~ Science
            5 ~ History
            6 ~ Travel
            7 ~ Finance
```

![](https://github.com/senselogic/BASIL/blob/master/SAMPLE/SQL/blog.png)

## CQL sample

```cpp
BLOG | count 5

    SECTION

        Uuid : UUID | key, unique
        Number : UINT64
        Name : STRING
        Text : STRING
        Image : STRING

        ImageIndex : UINT64 | !stored

    USER

        Uuid : UUID | key, unique
        FirstName : STRING
        LastName : STRING
        Email : STRING
        Pseudonym : STRING
        Password : STRING
        Phone : STRING
        Street : STRING
        City : STRING
        Code : STRING
        Region : STRING
        Country : STRING
        Company : STRING
        ItIsAdministrator : BOOL

    ARTICLE | count 15

        Uuid : UUID | key, unique
        SectionUuid : SECTION.Uuid | indexed
        UserUuid : USER.Uuid | indexed
        Title : STRING
        Text : STRING
        Image : STRING
        Date : DATE

        Section : POINTER[ SECTION ] | !stored
        User : POINTER[ USER ] | !stored
        ImageIndex : UINT64 | !stored

    COMMENT | count 30

        Uuid : UUID | key, unique
        ArticleUuid : ARTICLE.Uuid | indexed
        UserUuid : USER.Uuid | indexed
        Text : STRING | english 2 4 5 7
        DateTime : DATETIME

        Article : POINTER[ ARTICLE ] | !stored
        User : POINTER[ USER ] | !stored

    SUBSCRIBER

        Uuid : UUID | key, unique
        Name : STRING
        Email : STRING

    %SECTION

        Number Name

            1 ~ Sports
            2 ~ Gaming
            3 ~ Entertainment
            4 ~ Science
            5 ~ History
            6 ~ Travel
            7 ~ Finance
```

![](https://github.com/senselogic/BASIL/blob/master/SAMPLE/CQL/blog.png)

## Sample Go template

```go
##types.go
package main;

[*type {{table_go_type}} struct {
<*    {{column_go_type}} {{column_go_name}};
*>}

// ~~

*]
```

## Syntax

```
-- comment

{database name} [| {database property}, {database property}, ...]

    {table name} [| {table property}, {table property}, ...]

        {column name} : {column type} [| {column property}, {column property}, ...]
        ...

    ...

    %{table name}

        {column name} {column name} ...

            {column value} ~ {column value} ~ ...
            ...

        ...

    ...
```

### Database properties

```
count {row count}
```

### Table properties

```
count {row count}
```

### Column properties

```
[!]stored
[!]key
[!]partitioned
[!]clustered
[!]indexed
[!]static
[!]required
[!]incremented
capacity {maximum character count}
sqlname {SQL column name}
cqlname {CQL column name}
goname {Go field name}
crystalname {Crystal field name}
csharpname {C# field name}
rustname {Rust field name}
firstname
lastname
fullname
lowercase
uppercase
real {minimum value} {maximum value}
integer {minimum value} {maximum value}
natural {minimum value} {maximum value} [{digit count}]
name {minimum letter count} {maximum letter count}
english {minimum sentence count} {maximum sentence count} {minimum word count} {maximum word count}
latin  {minimum sentence count} {maximum sentence count} {minimum word count} {maximum word count}
count {minimum element count} {maximum element count}
count {element count}
```

### Field name suffixes

```
Id
Year
Title
Slug
Text
FirstName
LastName
Name
Pseudonym
Password
Email
Phone
Street
Address
Code
City
Region
Country
Company
Image
File
Folder
Author
Isbn
Tags
```

The "Pseudonym" column is based on the prior "Email" column if it exists.

The "Email", "Login" and "Pseudonym" columns are based on the prior "FirstName" and "LastName" columns if they exist.

The "Slug" column is based on the prior "Title" or "Name" column if it exists.

### Column types

```
BOOL
INT8
UINT8
INT16
UINT16
INT32
UINT32
INT64
UINT64
FLOAT32
FLOAT64
STRING
DATE
DATETIME
UUID
BLOB
TABLE_NAME.ColumnName
TUPLE[ FIELD_TYPE, FIELD_TYPE, ... ]
TUPLE[ FieldName : FIELD_TYPE, FieldName : FIELD_TYPE, ... ]
LIST[ ELEMENT_TYPE ]
LIST[ ElementName : ELEMENT_TYPE ]
SET[ ELEMENT_TYPE ]
SET[ ElementName : ELEMENT_TYPE ]
MAP[ KEY_TYPE, ELEMENT_TYPE ]
MAP[ KeyName : KEY_TYPE, ElementName : ELEMENT_TYPE ]
ARRAY[ ELEMENT_TYPE ] | !stored
POINTER[ ELEMENT_TYPE ] | !stored
```

### Data

```
^ : unremovable space
§ : new line symbol
~ : value separator
\ : escape character
```

### Template tags

```
[*tables*]
[.stored tables.]
[!not stored tables!]
<*columns*>
<*^first columns^*>
<*$last column$*>
<#key columns#>
<#^first key columns^#>
<#$last key column$#>
<~not key columns~>
<~^first not key columns^~>
<~$last not key column$~>
<.stored columns.>
<.^first stored columns^.>
<.$last stored column$.>
<!not stored columns!>
<!^first not stored columns^!>
<!$last not stored column$!>
{{table_name}}
{{table_go_type}}
{{table_go_attribute}}
{{table_go_variable}}
{{table_crystal_type}}
{{table_csharp_type}}
{{table_rust_type}}
{{table_javascript_type}}
{{column_name}}
{{column_stored_name}}
{{column_stored_type}}
{{column_cql_name}}
{{column_cql_type}}
{{column_sql_name}}
{{column_sql_type}}
{{column_go_name}}
{{column_go_type}}
{{column_go_attribute}}
{{column_go_variable}}
{{column_crystal_name}}
{{column_crystal_type}}
{{column_csharp_name}}
{{column_csharp_type}}
{{column_rust_name}}
{{column_rust_type}}
{{column_javascript_name}}
{{column_javascript_type}}
##output file path
```

## Installation

Install the [DMD 2 compiler](https://dlang.org/download.html).

Build the executable with the following command line :

```bash
dmd -m64 basil.d
```

The UML diagrams can be drawn using [PlantText](https://www.planttext.com/) or [PlantUML](http://plantuml.com/).

## Command line

```
basil [options] script_file.bsl
```

### Options

```
--uml : generate the UML schema file
--sql : generate the SQL schema and data files
--cql : generate the CQL schema and data files
--go : generate the Go type file
--generis : generate the Generis type, query, response, request and route files
--crystal : generate the Crystal type file
--csharp : generate the C# type file
--rust : generate the Rust type file
```

The `--sql` and `--cql` options are mutually exclusive.

The `--go`, `--generis`, `--crystal`, `--csharp` and `--rust` options require the `--sql` or the `--cql` option.

### Examples

```bash
basil --uml blog.bsl
```

Generates "blog.uml" from "blog.bsl".

```bash
basil --uml --sql --go blog.bsl
```

Generates "blog.uml", "blog.sql", "blog_data.sql", "blog_sql_type.go" from "blog.bsl".

```bash
basil --uml --cql --go --template template.bst blog.bsl
```

Generates "blog.uml", "blog.sql", "blog_data.sql", "blog_sql_type.go" and custom files from "blog.bsl" and "blog.bsl".

## Version

4.0

## Author

Eric Pelzer (ecstatic.coder@gmail.com).

## License

This project is licensed under the GNU General Public License version 3.

See the [LICENSE.md](LICENSE.md) file for details.
