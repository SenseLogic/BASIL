![](https://github.com/senselogic/BASIL/blob/master/LOGO/basil.png)

# Basil

Database builder.

## Features

*   Describes database schemas through a concise textual specification.
*   Generates fake data based on the column name, type and properties.
*   Exports the database schema and data in several formats :
    *   UML schema file.
    *   SQL schema and data files.
    *   CQL schema and data files.
    *   Go SQL schema file.
    *   Go CQL schema file.
    *   Rust schema file.
    *   Crystal schema file.

## Sample

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
        SectionId : SECTION.Id | partitioned
        UserId : USER.Id | clustered
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
```

![](https://github.com/senselogic/BASIL/blob/master/SAMPLE/blog.png)

```
TEST | count 10

    SIMPLE

        Uuid : UUID | key, unique
        Bool : BOOL | partitioned
        Int8 : INT8 | clustered
        Uint8 : UINT8 | indexed
        Int16 : INT16
        Uint16 : UINT16
        Int32 : INT32
        Uint32 : UINT32
        Int64 : INT64
        Uint64 : UINT64
        Float32 : FLOAT32
        Float64 : FLOAT64
        String : STRING
        Date : DATE | unique
        DateTime : DATETIME
        Blob : BLOB

    COMPOUND

        Id : INT32 | key, unique, incremented
        Location : Country : STRING | uppercase
        Name : TUPLE[ FirstName : STRING, LastName : STRING ] | unique
        NameSet : SET[ TUPLE[ FirstName : STRING, LastName : STRING ] ] | count 2
        PhoneList : LIST[ Phone : STRING ] | count 2
        EmailSet : SET[ Email : STRING ] | count 2
        CompanyMap : MAP[ Phone : STRING, Company : STRING ] | count 2
        SimpleDate : SIMPLE.Date
        SimpleDateMap : MAP[ COMPOUND.Name, SIMPLE.Date ] | count 2
        SimpleDateSet : SET[ SIMPLE.Date ] | count 2
        SimpleDateList : LIST[ SIMPLE.Date ] | count 1 3
        NameSetMap : MAP[ SIMPLE.Date, COMPOUND.NameSet ] | count 2
        SimplePointerArray : ARRAY[ POINTER[ SIMPLE ] ] | !stored
```

![](https://github.com/senselogic/BASIL/blob/master/TEST/test.png)

## Syntax

```
# comment

{database name} [| {database property}, {database property}, ...]

    {table name} [| {table property}, {table property}, ...]

        {column name} : {column type} [| {column property}, {column property}, ...]
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
rustname {Rust field name}
crystalname {Crystal field name}
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

The "Email", "Login" and "Pseudonym" columns are based on the prior "FirstName" and "LastName" columns if they are defined before them.

The "Slug" column is based on the prior "Title" or "Name" column if it is defined before it.

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

## Installation

Install the [DMD 2 compiler](https://dlang.org/download.html).

Build the executable with the following command line :

```bash
dmd -m64 basil.d
```

The UML diagrams can be drawn using [PlantText](https://www.planttext.com/) or [PlantUML](http://plantuml.com/).

## Command line

```
basil [options] script_file.basil
```

### Options

```
--uml : generate the UML schema file
--sql : generate the SQL schema and data files
--cql : generate the CQL schema and data files
--gosql : generate the Go SQL schema file
--gocql : generate the Go CQL schema file
--rust : generate the Rust schema file
--crystal : generate the Crystal schema file
```

### Examples

```bash
basil --uml blog.basil
```

Generates "blog.uml" from "blog.basil".

```bash
basil --uml --sql --gosql blog.basil
```

Generates "blog.uml", "blog.sql", "blog_data.sql" and "blog_sql.go" from "blog.basil".

## Version

2.1

## Author

Eric Pelzer (ecstatic.coder@gmail.com).

## License

This project is licensed under the GNU General Public License version 3.

See the [LICENSE.md](LICENSE.md) file for details.
