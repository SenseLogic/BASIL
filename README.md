![](https://github.com/senselogic/BASIL/blob/master/LOGO/basil.png)

# Basil

Textual database builder.

## Features

* Database design using a simple textual specification.
* Random data generation from the field name, type, size and properties.
* Lorem ipsum sentences in Latin or English.
* Several export formats :
  * UML schema file.
  * SQL schema and data files.
  * CQL schema and data files.
  * AQL data file.
  * Go schema and data files.

## Sample

```cpp
BLOG | count 5

    SECTION

        Id : UINT64 | key, incremented
        Number : UINT64
        Name : STRING | capacity 45
        Text : STRING
        Image : STRING | capacity 45
        ArticleIdList : ARTICLE LIST | count 5 10

        ImageIndex : UINT64 | !stored

    USER

        Id : UINT64 | key, incremented
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
        ItIsAdministrator : BOOL | aqlname IsAdmin

    ARTICLE | count 15

        Id : UINT64 | key, incremented
        SectionId : SECTION REF
        UserId : USER REF
        Title : STRING
        Text : STRING
        Image : STRING | capacity 45
        Date : DATE

        Section : SECTION * | !stored
        User : USER * | !stored

        ImageIndex : UINT64 | !stored

    COMMENT | count 30

        Id : UINT64 | key, incremented
        ArticleId : ARTICLE REF
        UserId : USER REF
        Text : STRING | english 2 4 5 7
        Date : DATETIME

        Article : ARTICLE * | !stored
        User : USER * | !stored

    SUBSCRIBER

        Id : UINT64 | key, incremented
        Name : STRING | capacity 45
        Email : STRING | capacity 45
```

![](https://github.com/senselogic/BASIL/blob/master/TEST/blog.png)

## Syntax

```
# comment

{database name} [| {database property}, {database property}, ...]

    {table name} [| {table property}, {table property}, ...]

        {field name} : {field type} [| {field property}, {field property}, ...]
```

### Database properties

```
count {row count}
```

### Table properties

```
count {row count}
```

### Field properties

```
[!]stored
[!]key
[!]clustered
[!]indexed
[!]static
[!]required
[!]incremented
capacity {maximum character count}
cqlname {CQL field name}
aqlname {AQL field name}
goname {Go field name}
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
```

### Field name endings

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

An "Email" field is based on the "FirstName" and "LastName" fields if they are defined above.

A "Slug" field is based on the "Title" or "Name" field if it's defined above.

### Field types

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
.../... TUPLE
.../... MAP
... SET
... LIST
... REF
```

### Internal fields

Fields with the "!stored" property are included in the generated Go types without being stored on the database.

Pointer fields should end with "*", and arrays with "[]".

## Installation

Install the [DMD 2 compiler](https://dlang.org/download.html).

Build the executable with the following command line :

```bash
dmd -m64 basil.d
```

The UML diagrams can be drawn using [www.planttext.com](https://www.planttext.com/).

## Command line

```
basil [options] script_file.basil
```

### Options

```
--uml : generate the UML schema file
--sql : generate the SQL schema and data files
--cql : generate the CQL schema and data files
--aql : generate the AQL data file
--go : generate the Go schema and data files
```

### Examples

```bash
basil --uml blog.basil
```

Generates "blog.uml" from "blog.basil".

```bash
basil --uml --sql --go blog.basil
```

Generates "blog.uml", "blog.sql", "blog_data.sql", "blog.go" and "blog_data.go" from "blog.basil".

## Version

1.0

## Author

Eric Pelzer (ecstatic.coder@gmail.com).

## License

This project is licensed under the GNU General Public License version 3.

See the [LICENSE.md](LICENSE.md) file for details.
