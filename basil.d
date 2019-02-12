/*
    This file is part of the Basil distribution.

    https://github.com/senselogic/BASIL

    Copyright (C) 2017 Eric Pelzer (ecstatic.coder@gmail.com)

    Basil is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, version 3.

    Basil is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Basil.  If not, see <http://www.gnu.org/licenses/>.
*/

// -- IMPORTS

import core.stdc.stdlib : exit;
import std.algorithm : countUntil;
import std.ascii : isDigit, isLower, isUpper;
import std.conv : to;
import std.file : dirEntries, readText, thisExePath, write, SpanMode;
import std.random : uniform;
import std.path : dirName;
import std.regex : regex, replaceAll, Regex;
import std.stdio : writeln;
import std.string : endsWith, format, indexOf, join, lineSplitter, replace, startsWith, split, strip, stripRight, toLower, toUpper;
import std.uuid : sha1UUID;

// -- TYPES

class LINK
{
    // -- ATTRIBUTES

    string
        Word;
    long
        VertexIndex;
    bool
        IsFinal;

    // -- CONSTRUCTORS

    this(
        string word,
        long vertex_index,
        bool it_is_final
        )
    {
        Word = word;
        VertexIndex = vertex_index;
        IsFinal = it_is_final;
    }
}

// ~~

class VERTEX
{
    // -- ATTRIBUTES

    string
        Word;
    bool
        IsInitial;
    LINK[]
        LinkArray;

    // -- CONSTRUCTORS

    this(
        string word
        )
    {
        Word = word;
        IsInitial = false;
        LinkArray = null;
    }
}

// ~~

class RANDOM
{
    // -- ATTRIBUTES

    string[]
        FirstNameArray,
        LastNameArray,
        CityNameArray,
        RegionNameArray,
        CountryNameArray;
    VERTEX[]
        VertexArray;
    long[ string ]
        VertexIndexMap;
    string[]
        WordArray,
        SyllableArray;

    // -- CONSTRUCTORS

    this(
        )
    {
        MakeFirstNameArray();
        MakeLastNameArray();
        MakeCityNameArray(),
        MakeRegionNameArray(),
        MakeCountryNameArray(),
        MakeVertexArray();
        MakeWordArray();
        MakeSyllableArray();
    }

    // -- OPERATIONS

    void MakeNameArray(
        ref string[] name_array,
        string file_path,
        bool lines_are_split = false,
        bool case_is_fixed = false
        )
    {
        string
            text;

        text = GetExecutablePath( file_path ).readText().replace( "\r", "" );

        while ( text.startsWith( "\n" ) )
        {
            text = text[ 1 .. $ ];
        }

        while ( text.endsWith( "\n" ) )
        {
            text = text[ 0 .. $ - 1 ];
        }

        text = text.replace( "\n\n", "\n" );

        if ( lines_are_split )
        {
            name_array = text.replace( "\n", " " ).strip().split( ' ' );
        }
        else
        {
            name_array = text.split( '\n' );
        }

        if ( case_is_fixed )
        {
            foreach ( ref name; name_array )
            {
                name = name.toLower().GetCapitalizedText();
            }
        }
    }

    // ~~

    void MakeFirstNameArray(
        )
    {
        MakeNameArray( FirstNameArray, "first_name_table.txt", true, true );
    }

    // ~~

    void MakeLastNameArray(
        )
    {
        MakeNameArray( LastNameArray, "last_name_table.txt", true, true );
    }

    // ~~

    void MakeCityNameArray(
        )
    {
        MakeNameArray( CityNameArray, "city_name_table.txt" );
    }

    // ~~

    void MakeRegionNameArray(
        )
    {
        MakeNameArray( RegionNameArray, "region_name_table.txt" );
    }

    // ~~

    void MakeCountryNameArray(
        )
    {
        MakeNameArray( CountryNameArray, "country_name_table.txt" );
    }

    // ~~

    long GetVertexIndex(
        string word
        )
    {
        long
            vertex_index;
        long *
            found_vertex_index;
        string
            key;
        VERTEX
            vertex;

        key = "[" ~ word ~ "]";

        found_vertex_index = ( key in VertexIndexMap );

        if ( found_vertex_index != null )
        {
            return *found_vertex_index;
        }
        else
        {
            vertex = new VERTEX( word );
            vertex_index = VertexArray.length;
            VertexArray ~= vertex;
            VertexIndexMap[ key ] = vertex_index;

            return vertex_index;
        }
    }

    // ~~

    void AddLink(
        VERTEX vertex,
        string word,
        long vertex_index,
        bool it_is_final
        )
    {
        foreach ( ref link; vertex.LinkArray )
        {
            if ( link.VertexIndex == vertex_index )
            {
                if ( it_is_final )
                {
                    link.IsFinal = true;
                }

                return;
            }
        }

        vertex.LinkArray ~= new LINK( word, vertex_index, it_is_final );
    }

    // ~~

    void MakeVertexArray(
        )
    {
        bool
            it_is_final;
        long
            vertex_index;
        string
            text;
        string[]
            verse_array,
            word_array;
        VERTEX
            prior_vertex,
            vertex;

        text = GetExecutablePath( "english_text.txt" ).readText();
        verse_array = text.strip().replace( "\r", "" ).split( '\n' );

        VertexArray = null;
        VertexIndexMap = null;

        foreach ( ref verse; verse_array )
        {
            word_array = verse.split( ' ' );
            prior_vertex = null;

            foreach ( word_index, ref word; word_array )
            {
                vertex_index = GetVertexIndex( word );
                vertex = VertexArray[ vertex_index ];

                if ( word_index == 0 )
                {
                    vertex.IsInitial = true;
                }

                if ( prior_vertex !is null )
                {
                    it_is_final = ( word_index == word_array.length.to!long() - 1 );

                    AddLink( prior_vertex, word, vertex_index, it_is_final );
                }

                prior_vertex = vertex;
            }
        }
    }

    // ~~

    void MakeWordArray(
        )
    {
        string
            text;

        text = GetExecutablePath( "latin_text.txt" ).readText();
        WordArray = text.replace( "\r", "" ).replace( "\n", " " ).strip().split( ' ' );

        GetExecutablePath( "word_table.txt" ).write( WordArray.join( '\n' ) );
    }

    // ~~

    void MakeSyllableArray(
        )
    {
        string
            old_text,
            text;
        Regex!char
            consonants_voyels_consonants_expression,
            voyels_consonants_voyels_expression;

        voyels_consonants_voyels_expression = regex( ` ([aeiou]+)([bcdfghjklmnpqrstvwx]+)([aeiou]+)([^ ])` );
        consonants_voyels_consonants_expression = regex( ` ([bcdfghjklmnpqrstvwx]+)([aeiou]+)([bcdfghjklmnpqrstvwx]+)([^ ])` );
        text = FirstNameArray.join( ' ' ) ~ " " ~ LastNameArray.join( ' ' ).toLower();

        do
        {
            old_text = text;

            text = text.replaceAll( voyels_consonants_voyels_expression, " $1$2$3 $2$3$4" );
            text = text.replaceAll( consonants_voyels_consonants_expression, " $1$2$3 $2$3$4" );
            text = text.strip();
        }
        while ( text != old_text );

        text ~= " a b c d e f g h i j k l m n o p q r s t u v w x y z";

        SyllableArray = text.strip().split( ' ' );

        GetExecutablePath( "syllable_table.txt" ).write( SyllableArray.join( '\n' ) );
    }

    // ~~

    double MakeReal(
        double minimum_value,
        double maximum_value
        )
    {
        return uniform!"[]"( minimum_value, maximum_value );
    }

    // ~~

    long MakeInteger(
        long minimum_value,
        long maximum_value
        )
    {
        return uniform!"[]"( minimum_value, maximum_value );
    }

    // ~~

    ulong MakeNatural(
        )
    {
        return uniform!"[]"( 0, ulong( -1 ) );
    }

    // ~~

    ulong MakeNatural(
        ulong minimum_value,
        ulong maximum_value
        )
    {
        return uniform!"[]"( minimum_value, maximum_value );
    }

    // ~~

    string MakeNatural(
        ulong minimum_value,
        ulong maximum_value,
        long digit_count
        )
    {
        string
            text;

        text = MakeNatural( minimum_value, maximum_value ).to!string();

        while ( text.length < digit_count )
        {
            text = "0" ~ text;
        }

        return text;
    }

    // ~~

    long MakeIndex(
        long count
        )
    {
        return MakeInteger( 0, count - 1 );
    }

    // ~~

    long MakeIndex( ELEMENT )(
        ELEMENT[] array
        )
    {
        return MakeInteger( 0, array.length.to!long() - 1 );
    }

    // ~~

    ELEMENT PickElement( ELEMENT )(
        ELEMENT[] array
        )
    {
        return array[ MakeIndex( array.length ) ];
    }

    // ~~

    char MakeLowercaseLetter()
    {
        return "abcdefghijklmnopqrstuvwxyz"[ MakeIndex( 26 ) ];
    }

    // ~~

    char MakeUppercaseLetter()
    {
        return "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[ MakeIndex( 26 ) ];
    }

    // ~~

    char MakeDigit()
    {
        return "0123456789"[ MakeIndex( 10 ) ];
    }

    // ~~

    char MakeHexadecimalDigit()
    {
        return "0123456789abcdef"[ MakeIndex( 10 ) ];
    }

    // ~~

    char MakeSeparator()
    {
        return ".,;:!?+-=*/%^&#@"[ MakeIndex( 16 ) ];
    }

    // ~~

    string MakeDate(
        )
    {
        return
            MakeInteger( 2000, 2015 ).to!string()
            ~ "-"
            ~ MakeNatural( 1, 12, 2 ).to!string()
            ~ "-"
            ~ MakeNatural( 1, 28, 2 ).to!string();
    }

    // ~~

    string MakeTime(
        )
    {
        return
            MakeNatural( 0, 23, 2 ).to!string()
            ~ ":"
            ~ MakeNatural( 0, 59, 2 ).to!string()
            ~ ":"
            ~ MakeNatural( 0, 59, 2 ).to!string();
    }

    // ~~

    string MakeBlob(
        long hexadecimal_digit_count
        )
    {
        string
            blob;

        foreach ( hexadecimal_digit_index; 0 .. hexadecimal_digit_count )
        {
            blob ~= MakeHexadecimalDigit();
        }

        return blob;
    }


    // ~~

    string MakeUuid(
        )
    {
        return
            MakeBlob( 8 )
            ~ "-"
            ~ MakeBlob( 4 )
            ~ "-"
            ~ MakeBlob( 4 )
            ~ "-"
            ~ MakeBlob( 4 )
            ~ "-"
            ~ MakeBlob( 12 );
    }

    // ~~

    string MakeName(
        long minimum_letter_count,
        long maximum_letter_count
        )
    {
        long
            letter_count;
        string
            name,
            syllable;

        letter_count = MakeInteger( minimum_letter_count, maximum_letter_count );

        do
        {
            name = "";

            do
            {
                syllable = PickElement( SyllableArray );

                if ( name.length + syllable.length <= letter_count
                     && ( ( name == ""
                            && ( syllable.length == 1
                                 || !syllable.StartsByConsonant()
                                 || !syllable[ 1 .. $ ].StartsByConsonant() ) )
                          || ( name != ""
                               && name.EndsByVowel() != syllable.StartsByVowel() ) ) )
                {
                    name ~= syllable;
                }
            }
            while ( name.length < letter_count );
        }
        while ( !name.EndsByVowel()
                && !name[ 0 .. $ - 1 ].EndsByVowel() );

        return name;
    }

    // ~~

    string MakeFirstName(
        )
    {
        return PickElement( FirstNameArray );
    }

    // ~~

    string MakeLastName(
        )
    {
        return PickElement( LastNameArray );
    }

    // ~~

    string MakeCityName(
        )
    {
        return PickElement( CityNameArray );
    }

    // ~~

    string MakeRegionName(
        )
    {
        return PickElement( RegionNameArray );
    }

    // ~~

    string MakeCountryName(
        )
    {
        return PickElement( CountryNameArray );
    }

    // ~~

    string MakeWord(
        )
    {
        return PickElement( WordArray );
    }

    // ~~

    string MakeEnglishSentence(
        long minimum_word_count,
        long maximum_word_count
        )
    {
        bool
            vertex_is_final;
        long
            word_count;
        string
            sentence;
        string[]
            word_array;
        VERTEX
            prior_vertex,
            vertex;
        LINK
            link;

        do
        {
            word_count = MakeInteger( minimum_word_count, maximum_word_count );

            do
            {
                vertex = PickElement( VertexArray );
            }
            while ( !vertex.IsInitial );

            word_array = null;
            word_array ~= vertex.Word;

            prior_vertex = vertex;
            vertex_is_final = false;

            do
            {
                if ( vertex.LinkArray.length == 0 )
                {
                    break;
                }

                link = PickElement( vertex.LinkArray );
                vertex = VertexArray[ link.VertexIndex ];

                if ( vertex.Word == prior_vertex.Word )
                {
                    break;
                }

                prior_vertex = vertex;

                word_array ~= vertex.Word;
                vertex_is_final = link.IsFinal;
            }
            while ( word_array.length < word_count
                    || !vertex_is_final );
        }
        while ( word_array.length != word_count
                || !vertex_is_final );

        sentence = word_array.join( ' ' );

        return sentence;
    }

    // ~~

    string MakeLatinSentence(
        long minimum_word_count,
        long maximum_word_count
        )
    {
        long
            word_count;
        string
            sentence;

        sentence = "";
        word_count = MakeInteger( minimum_word_count, maximum_word_count );

        foreach ( word_index; 0 .. word_count )
        {
            sentence ~= PickElement( WordArray );

            if ( word_index < word_count - 1 )
            {
                sentence ~= " ";
            }
        }

        return sentence;
    }

    // ~~

    string MakeSentence(
        string language,
        long minimum_word_count,
        long maximum_word_count
        )
    {
        if ( language == "english" )
        {
            return MakeEnglishSentence( minimum_word_count, maximum_word_count );
        }
        else
        {
            return MakeLatinSentence( minimum_word_count, maximum_word_count );
        }
    }

    // ~~

    string MakeText(
        string language,
        long minimum_sentence_count,
        long maximum_sentence_count,
        long minimum_word_count = 8,
        long maximum_word_count = 16
        )
    {
        char
            punctuation_character;
        float
            punctuation_probability;
        long
            sentence_count;
        string
            sentence,
            text;

        text = "";
        punctuation_probability = 0.25;
        punctuation_character = '.';

        sentence_count = MakeInteger( minimum_sentence_count, maximum_sentence_count );

        foreach ( sentence_index; 0 .. sentence_count )
        {
            sentence = MakeSentence( language, minimum_word_count, maximum_word_count );

            if ( punctuation_character == '.' )
            {
                sentence = sentence.GetCapitalizedText();
            }

            text ~= sentence;

            if ( sentence_index < sentence_count - 1
                 && MakeReal( 0.0, 1.0 ) > punctuation_probability )
            {
                punctuation_probability += 0.50;
                punctuation_character = ',';
            }
            else
            {
                punctuation_probability = 0.25;
                punctuation_character = '.';
            }

            text ~= punctuation_character;

            if ( sentence_index < sentence_count - 1 )
            {
                text ~= " ";
            }
        }

        return text;
    }
}

// ~~

class TYPE
{
    // -- ATTRIBUTES

    TABLE
        Table;
    COLUMN
        Column,
        ForeignColumn;
    string
        ColumnName,
        Name,
        BaseName;
    TYPE
        ActualType;
    TYPE[]
        SubTypeArray;

    // -- CONSTRUCTORS

    this(
        )
    {
    }

    // ~~

    this(
        TABLE table,
        COLUMN column,
        string column_name,
        string type_name
        )
    {
        char
            character;
        long
            bracket_level,
            character_index;
        string
            sub_type;

        Table = table;
        Column = column;
        ColumnName = column.Name;
        Name = type_name.replace( " ", "" );
        BaseName = Name;

        bracket_level = 0;

        for ( character_index = 0;
              character_index < Name.length;
              ++character_index )
        {
            character = Name[ character_index ];

            if ( character == ':' )
            {
                if ( bracket_level == 0 )
                {
                    ColumnName = Name[ 0 .. character_index ];
                    Name = Name[ character_index + 1 .. $ ];
                    BaseName = Name;
                    sub_type = "";
                    character_index = -1;
                }
                else
                {
                    sub_type ~= character;
                }
            }
            else if ( character == '[' )
            {
                ++bracket_level;

                if ( bracket_level == 1 )
                {
                    BaseName = Name[ 0 .. character_index ];
                    sub_type = "";
                }
                else
                {
                    sub_type ~= character;
                }
            }
            else if ( character == ','
                      || character == ']' )
            {
                if ( bracket_level == 1 )
                {
                    SubTypeArray ~= new TYPE( table, column, "", sub_type );
                    sub_type = "";
                }
                else
                {
                    sub_type ~= character;
                }

                if ( character == ']' )
                {
                    --bracket_level;
                }
            }
            else
            {
                sub_type ~= character;
            }
        }
    }

    // -- INQUIRIES

    bool IsUuid(
        )
    {
        return ActualType.Name == "UUID";
    }

    // ~~

    long GetElementValueCount(
        )
    {
        long
            element_value_count;

        element_value_count = Random.MakeInteger( Column.MinimumRandomCount, Column.MaximumRandomCount );

        if ( SubTypeArray[ 0 ].ForeignColumn !is null
             && element_value_count > SubTypeArray[ 0 ].ForeignColumn.Table.RowCount )
        {
            element_value_count = SubTypeArray[ 0 ].ForeignColumn.Table.RowCount;
        }

        return element_value_count;
    }


    // ~~

    string GetSqlText(
        )
    {
        string
            type_name;

        type_name = ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            return "TINYINT UNSIGNED";
        }
        else if ( type_name == "INT8" )
        {
            return "TINYINT";
        }
        else if ( type_name == "UINT8" )
        {
            return "TINYINT UNSIGNED";
        }
        else if ( type_name == "INT16" )
        {
            return "SMALLINT";
        }
        else if ( type_name == "UINT16" )
        {
            return "SMALLINT UNSIGNED";
        }
        else if ( type_name == "INT32" )
        {
            return "INT";
        }
        else if ( type_name == "UINT32" )
        {
            return "INT UNSIGNED";
        }
        else if ( type_name == "INT64" )
        {
            return "BIGINT";
        }
        else if ( type_name == "UINT64" )
        {
            return "BIGINT UNSIGNED";
        }
        else if ( type_name == "FLOAT32" )
        {
            return "FLOAT";
        }
        else if ( type_name == "FLOAT64" )
        {
            return "DOUBLE";
        }
        else if ( type_name == "STRING" )
        {
            if ( Column.Capacity != 0 )
            {
                return "VARCHAR( " ~ Column.Capacity.to!string() ~ " )";
            }
            else
            {
                return "TEXT";
            }
        }
        else if ( type_name == "DATE" )
        {
            return "DATE";
        }
        else if ( type_name == "DATETIME" )
        {
            return "DATETIME";
        }
        else if ( type_name == "UUID" )
        {
            return "VARCHAR(36)";
        }
        else if ( type_name == "BLOB" )
        {
            return "BLOB";
        }
        else
        {
            return "TEXT";
        }
    }

    // ~~

    string GetSubTypeSqlText(
        bool type_is_frozen
        )
    {
        string
            sub_types_cql_text;

        foreach ( ref sub_type; ActualType.SubTypeArray )
        {
            if ( sub_types_cql_text != "" )
            {
                sub_types_cql_text ~= ",";
            }

            sub_types_cql_text ~= sub_type.GetCqlText( true, type_is_frozen );
        }

        return sub_types_cql_text;
    }

    // ~~

    string GetCqlText(
        bool type_is_nested = false,
        bool type_is_frozen = false
        )
    {
        string
            type_prefix,
            type_suffix,
            type_name;


        type_name = ActualType.BaseName;

        if ( type_is_nested
             && !type_is_frozen
             && ( type_name == "TUPLE"
                  || type_name == "LIST"
                  || type_name == "SET"
                  || type_name == "MAP" ) )
        {
            type_is_frozen = true;

            type_prefix = "frozen<";
            type_suffix = ">";
        }

        if ( type_name == "BOOL" )
        {
            return "boolean";
        }
        else if ( type_name == "INT8" )
        {
            return "tinyint";
        }
        else if ( type_name == "UINT8" )
        {
            return "tinyint";
        }
        else if ( type_name == "INT16" )
        {
            return "smallint";
        }
        else if ( type_name == "UINT16" )
        {
            return "smallint";
        }
        else if ( type_name == "INT32" )
        {
            return "int";
        }
        else if ( type_name == "UINT32" )
        {
            return "int";
        }
        else if ( type_name == "INT64" )
        {
            return "bigint";
        }
        else if ( type_name == "UINT64" )
        {
            return "bigint";
        }
        else if ( type_name == "FLOAT32" )
        {
            return "float";
        }
        else if ( type_name == "FLOAT64" )
        {
            return "double";
        }
        else if ( type_name == "STRING" )
        {
            return "text";
        }
        else if ( type_name == "DATE" )
        {
            return "timestamp";
        }
        else if ( type_name == "DATETIME" )
        {
            return "timestamp";
        }
        else if ( type_name == "UUID" )
        {
            return "uuid";
        }
        else if ( type_name == "BLOB" )
        {
            return "blob";
        }
        else if ( type_name == "TUPLE" )
        {
            return type_prefix ~ "tuple<" ~ GetSubTypeSqlText( type_is_frozen ) ~ ">" ~ type_suffix;
        }
        else if ( type_name == "LIST" )
        {
            return type_prefix ~ "list<" ~ GetSubTypeSqlText( type_is_frozen ) ~ ">" ~ type_suffix;
        }
        else if ( type_name == "SET" )
        {
            return type_prefix ~ "set<" ~ GetSubTypeSqlText( type_is_frozen ) ~ ">" ~ type_suffix;
        }
        else if ( type_name == "MAP" )
        {
            return type_prefix ~ "map<" ~ GetSubTypeSqlText( type_is_frozen ) ~ ">" ~ type_suffix;
        }
        else
        {
            return "text";
        }
    }

    // ~~

    string GetSubTypeGoText(
        )
    {
        string
            sub_types_go_text;

        foreach ( ref sub_type; ActualType.SubTypeArray )
        {
            if ( sub_types_go_text != "" )
            {
                sub_types_go_text ~= "_";
            }

            sub_types_go_text ~= sub_type.GetGoText();
        }

        return sub_types_go_text;
    }

    // ~~

    string GetGoText(
        )
    {
        string
            type_name;

        type_name = ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            return "bool";
        }
        else if ( type_name == "INT8" )
        {
            return "int8";
        }
        else if ( type_name == "UINT8" )
        {
            return "uint8";
        }
        else if ( type_name == "INT16" )
        {
            return "int16";
        }
        else if ( type_name == "UINT16" )
        {
            return "uint16";
        }
        else if ( type_name == "INT32" )
        {
            return "int32";
        }
        else if ( type_name == "UINT32" )
        {
            return "uint32";
        }
        else if ( type_name == "INT64" )
        {
            return "int64";
        }
        else if ( type_name == "UINT64" )
        {
            return "uint64";
        }
        else if ( type_name == "FLOAT32" )
        {
            return "float32";
        }
        else if ( type_name == "FLOAT64" )
        {
            return "float64";
        }
        else if ( type_name == "STRING" )
        {
            return "string";
        }
        else if ( type_name == "DATE" )
        {
            return "string";
        }
        else if ( type_name == "DATETIME" )
        {
            return "string";
        }
        else if ( type_name == "UUID" )
        {
            return "gocql.UUID";
        }
        else if ( type_name == "BLOB" )
        {
            return "[] byte";
        }
        else if ( type_name == "POINTER" )
        {
            return "* " ~ GetSubTypeGoText();
        }
        else if ( type_name == "ARRAY" )
        {
            return "[] " ~ GetSubTypeGoText();
        }
        else if ( type_name == "TUPLE" )
        {
            return GetSubTypeGoText().toUpper() ~ "_TUPLE";
        }
        else if ( type_name == "LIST" )
        {
            return GetSubTypeGoText().toUpper() ~ "_LIST";
        }
        else if ( type_name == "SET" )
        {
            return GetSubTypeGoText().toUpper() ~ "_SET";
        }
        else if ( type_name == "MAP" )
        {
            return GetSubTypeGoText().toUpper() ~ "_MAP";
        }
        else
        {
            return Name;
        }
    }

    // ~~

    string GetSubTypeGoAttributeText(
        )
    {
        string
            sub_types_go_text;

        foreach ( ref sub_type; ActualType.SubTypeArray )
        {
            sub_types_go_text ~= sub_type.GetGoAttributeText();
        }

        return sub_types_go_text;
    }

    // ~~

    string GetGoAttributeText(
        )
    {
        string
            type_name;

        type_name = ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            return "Bool";
        }
        else if ( type_name == "INT8" )
        {
            return "Int8";
        }
        else if ( type_name == "UINT8" )
        {
            return "Uint8";
        }
        else if ( type_name == "INT16" )
        {
            return "Int16";
        }
        else if ( type_name == "UINT16" )
        {
            return "Uint16";
        }
        else if ( type_name == "INT32" )
        {
            return "Int32";
        }
        else if ( type_name == "UINT32" )
        {
            return "Uint32";
        }
        else if ( type_name == "INT64" )
        {
            return "Int64";
        }
        else if ( type_name == "UINT64" )
        {
            return "Uint64";
        }
        else if ( type_name == "FLOAT32" )
        {
            return "Float32";
        }
        else if ( type_name == "FLOAT64" )
        {
            return "Float64";
        }
        else if ( type_name == "STRING" )
        {
            return "String";
        }
        else if ( type_name == "DATE" )
        {
            return "String";
        }
        else if ( type_name == "DATETIME" )
        {
            return "String";
        }
        else if ( type_name == "UUID" )
        {
            return "Uuid";
        }
        else if ( type_name == "BLOB" )
        {
            return "Blob";
        }
        else if ( type_name == "POINTER" )
        {
            return GetSubTypeGoAttributeText() ~ "Pointer";
        }
        else if ( type_name == "ARRAY" )
        {
            return GetSubTypeGoAttributeText() ~ "Array";
        }
        else if ( type_name == "TUPLE" )
        {
            return GetSubTypeGoAttributeText() ~ "Tuple";
        }
        else if ( type_name == "LIST" )
        {
            return GetSubTypeGoAttributeText() ~ "List";
        }
        else if ( type_name == "SET" )
        {
            return GetSubTypeGoAttributeText() ~ "Set";
        }
        else if ( type_name == "MAP" )
        {
            return GetSubTypeGoAttributeText() ~ "Map";
        }
        else
        {
            return Name;
        }
    }

    // ~~

    string GetSubTypeCrystalText(
        )
    {
        string
            sub_types_crystal_text;

        foreach ( ref sub_type; ActualType.SubTypeArray )
        {
            if ( sub_types_crystal_text != "" )
            {
                sub_types_crystal_text ~= ",";
            }

            sub_types_crystal_text ~= sub_type.GetCrystalText();
        }

        return sub_types_crystal_text;
    }

    // ~~

    string GetCrystalText(
        )
    {
        string
            type_name;

        type_name = ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            return "bool";
        }
        else if ( type_name == "INT8" )
        {
            return "Int8";
        }
        else if ( type_name == "UINT8" )
        {
            return "Uint8";
        }
        else if ( type_name == "INT16" )
        {
            return "Int16";
        }
        else if ( type_name == "UINT16" )
        {
            return "Uint16";
        }
        else if ( type_name == "INT32" )
        {
            return "Int32";
        }
        else if ( type_name == "UINT32" )
        {
            return "Uint32";
        }
        else if ( type_name == "INT64" )
        {
            return "Int64";
        }
        else if ( type_name == "UINT64" )
        {
            return "Uint64";
        }
        else if ( type_name == "FLOAT32" )
        {
            return "Float32";
        }
        else if ( type_name == "FLOAT64" )
        {
            return "Float64";
        }
        else if ( type_name == "STRING" )
        {
            return "String";
        }
        else if ( type_name == "DATE" )
        {
            return "String";
        }
        else if ( type_name == "DATETIME" )
        {
            return "String";
        }
        else if ( type_name == "UUID" )
        {
            return "String";
        }
        else if ( type_name == "BLOB" )
        {
            return "String";
        }
        else if ( type_name == "POINTER" )
        {
            return GetSubTypeCrystalText();
        }
        else if ( type_name == "ARRAY" )
        {
            return "Array(" ~ GetSubTypeCrystalText() ~ ")";
        }
        else if ( type_name == "TUPLE" )
        {
            return "Tuple(" ~ GetSubTypeCrystalText() ~ ")";
        }
        else if ( type_name == "LIST" )
        {
            return "List(" ~ GetSubTypeCrystalText() ~ ")";
        }
        else if ( type_name == "SET" )
        {
            return "Set(" ~ GetSubTypeCrystalText() ~ ")";
        }
        else if ( type_name == "MAP" )
        {
            return "Hash(" ~ GetSubTypeCrystalText() ~ ")";
        }
        else
        {
            return Name;
        }
    }

    // ~~

    string GetSubTypeCsharpText(
        )
    {
        string
            sub_types_csharp_text;

        foreach ( ref sub_type; ActualType.SubTypeArray )
        {
            if ( sub_types_csharp_text != "" )
            {
                sub_types_csharp_text ~= ",";
            }

            sub_types_csharp_text ~= sub_type.GetCsharpText();
        }

        return sub_types_csharp_text;
    }

    // ~~

    string GetCsharpText(
        )
    {
        string
            type_name;

        type_name = ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            return "bool";
        }
        else if ( type_name == "INT8" )
        {
            return "sbyte";
        }
        else if ( type_name == "UINT8" )
        {
            return "byte";
        }
        else if ( type_name == "INT16" )
        {
            return "int";
        }
        else if ( type_name == "UINT16" )
        {
            return "uint";
        }
        else if ( type_name == "INT32" )
        {
            return "int";
        }
        else if ( type_name == "UINT32" )
        {
            return "uint";
        }
        else if ( type_name == "INT64" )
        {
            return "long";
        }
        else if ( type_name == "UINT64" )
        {
            return "ulong";
        }
        else if ( type_name == "FLOAT32" )
        {
            return "float";
        }
        else if ( type_name == "FLOAT64" )
        {
            return "double";
        }
        else if ( type_name == "STRING" )
        {
            return "String";
        }
        else if ( type_name == "DATE" )
        {
            return "DateTime";
        }
        else if ( type_name == "DATETIME" )
        {
            return "DateTime";
        }
        else if ( type_name == "UUID" )
        {
            return "Guid";
        }
        else if ( type_name == "BLOB" )
        {
            return "String";
        }
        else if ( type_name == "POINTER" )
        {
            return GetSubTypeCsharpText();
        }
        else if ( type_name == "ARRAY" )
        {
            return "List<" ~ GetSubTypeCsharpText() ~ ">";
        }
        else if ( type_name == "TUPLE" )
        {
            return "Tuple<" ~ GetSubTypeCsharpText() ~ ">";
        }
        else if ( type_name == "LIST" )
        {
            return "LinkedList<" ~ GetSubTypeCsharpText() ~ ">";
        }
        else if ( type_name == "SET" )
        {
            return "LinkedList<" ~ GetSubTypeCsharpText() ~ ">";
        }
        else if ( type_name == "MAP" )
        {
            return "Dictionary<" ~ GetSubTypeCsharpText() ~ ">";
        }
        else
        {
            return Name;
        }
    }

    // ~~

    string GetSubTypeRustText(
        )
    {
        string
            sub_types_rust_text;

        foreach ( ref sub_type; ActualType.SubTypeArray )
        {
            if ( sub_types_rust_text != "" )
            {
                sub_types_rust_text ~= ",";
            }

            sub_types_rust_text ~= sub_type.GetRustText();
        }

        return sub_types_rust_text;
    }

    // ~~

    string GetRustText(
        )
    {
        string
            type_name;

        type_name = ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            return "bool";
        }
        else if ( type_name == "INT8" )
        {
            return "i8";
        }
        else if ( type_name == "UINT8" )
        {
            return "u8";
        }
        else if ( type_name == "INT16" )
        {
            return "i16";
        }
        else if ( type_name == "UINT16" )
        {
            return "u16";
        }
        else if ( type_name == "INT32" )
        {
            return "i32";
        }
        else if ( type_name == "UINT32" )
        {
            return "u32";
        }
        else if ( type_name == "INT64" )
        {
            return "i64";
        }
        else if ( type_name == "UINT64" )
        {
            return "u64";
        }
        else if ( type_name == "FLOAT32" )
        {
            return "f32";
        }
        else if ( type_name == "FLOAT64" )
        {
            return "f64";
        }
        else if ( type_name == "STRING" )
        {
            return "String";
        }
        else if ( type_name == "DATE" )
        {
            return "String";
        }
        else if ( type_name == "DATETIME" )
        {
            return "String";
        }
        else if ( type_name == "UUID" )
        {
            return "String";
        }
        else if ( type_name == "BLOB" )
        {
            return "String";
        }
        else if ( type_name == "POINTER" )
        {
            return "Weak<" ~ GetSubTypeRustText() ~ ">";
        }
        else if ( type_name == "ARRAY" )
        {
            return "Vec<" ~ GetSubTypeRustText() ~ ">";
        }
        else if ( type_name == "TUPLE" )
        {
            return "(" ~ GetSubTypeRustText() ~ ")";
        }
        else if ( type_name == "LIST" )
        {
            return "List<" ~ GetSubTypeRustText() ~ ">";
        }
        else if ( type_name == "SET" )
        {
            return "List<" ~ GetSubTypeRustText() ~ ">";
        }
        else if ( type_name == "MAP" )
        {
            return "Map<" ~ GetSubTypeRustText() ~ ">";
        }
        else
        {
            return Name;
        }
    }

    // ~~

    string GetJavascriptText(
        )
    {
        return GetGoText();
    }

    // -- OPERATIONS

    COLUMN GetForeignColumn(
        )
    {
        if ( ForeignColumn is null )
        {
            ForeignColumn = Schema.FindForeignColumn( BaseName );
        }

        return ForeignColumn;
    }

    // ~~

    TYPE GetActualType(
        )
    {
        COLUMN
            foreign_column;

        if ( BaseName.indexOf( '.' ) >= 0 )
        {
            foreign_column = GetForeignColumn();

            if ( foreign_column is null )
            {
                Abort( "Invalid foreign column : " ~ BaseName );
            }

            return foreign_column.Type.GetActualType();
        }
        else
        {
            return this;
        }
    }

    // ~~

    void SetActualType(
        )
    {
        ActualType = GetActualType();

        foreach ( sub_type; SubTypeArray )
        {
            sub_type.SetActualType();
        }
    }
}

// ~~

class VALUE
{
    // -- ATTRIBUTES

    TYPE
        Type;
    string
        Text;
    VALUE[]
        SubValueArray,
        KeyValueArray,
        ElementValueArray;

    // -- CONSTRUCTORS

    this(
        )
    {
    }

    // ~~

    this(
        TYPE type
        )
    {
        Type = type;

        foreach ( ref sub_type; type.SubTypeArray )
        {
            SubValueArray ~= new VALUE( sub_type );
        }
    }

    // -- INQUIRIES

    bool IsEqual(
        VALUE value
        )
    {
        if ( Text != value.Text )
        {
            return false;
        }

        if ( SubValueArray.length != value.SubValueArray.length )
        {
            return false;
        }

        foreach ( sub_value_index; 0 .. SubValueArray.length )
        {
            if ( !SubValueArray[ sub_value_index ].IsEqual( value.SubValueArray[ sub_value_index ] ) )
            {
                return false;
            }
        }

        if ( KeyValueArray.length != value.KeyValueArray.length )
        {
            return false;
        }

        foreach ( key_value_index; 0 .. KeyValueArray.length )
        {
            if ( !KeyValueArray[ key_value_index ].IsEqual( value.KeyValueArray[ key_value_index ] ) )
            {
                return false;
            }
        }

        if ( ElementValueArray.length != value.ElementValueArray.length )
        {
            return false;
        }

        foreach ( element_value_index; 0 .. ElementValueArray.length )
        {
            if ( !ElementValueArray[ element_value_index ].IsEqual( value.ElementValueArray[ element_value_index ] ) )
            {
                return false;
            }
        }

        return true;
    }

    // ~~

    bool IsPriorValue(
        VALUE[] value_array,
        long value_index
        )
    {
        long
            prior_value_index;

        for ( prior_value_index = 0;
              prior_value_index < value_index;
              ++prior_value_index )
        {
            if ( value_array[ prior_value_index ].IsEqual( value_array[ value_index ] ) )
            {
                return true;
            }
        }

        return false;
    }

    // -- OPERATIONS

    void Set(
        VALUE value
        )
    {
        Text = value.Text;
        SubValueArray = value.SubValueArray;
        KeyValueArray = value.KeyValueArray;
        ElementValueArray = value.ElementValueArray;
    }

    // ~~

    void Make(
        long row_index,
        long row_count,
        bool it_is_sub_value = false
        )
    {
        long
            blob_byte_count,
            element_value_count,
            element_value_index,
            prior_row_index;
        string
            prior_email,
            prior_first_name,
            prior_last_name,
            prior_name,
            prior_title;
        ulong
            random_natural;

        do
        {
            if ( Type.BaseName.indexOf( '.' ) >= 0 )
            {
                Type.GetForeignColumn().MakeValues();

                Set( Random.PickElement( Type.ForeignColumn.ValueArray ) );
            }
            else if ( Type.Column.IsRandomReal )
            {
                Text = Random.MakeReal( Type.Column.MinimumRandomReal, Type.Column.MaximumRandomReal ).to!string();
            }
            if ( Type.Column.IsRandomInteger )
            {
                Text = Random.MakeInteger( Type.Column.MinimumRandomInteger, Type.Column.MaximumRandomInteger ).to!string();
            }
            if ( Type.Column.IsRandomNatural )
            {
                Text = Random.MakeNatural( Type.Column.MinimumRandomNatural, Type.Column.MaximumRandomNatural, Type.Column.MinimumRandomCount ).to!string();
            }
            else if ( Type.Column.IsRandomName )
            {
                Text = Random.MakeName( Type.Column.MinimumRandomCount, Type.Column.MaximumRandomCount );
            }
            else if ( Type.Column.IsRandomFirstName )
            {
                Text = Random.MakeFirstName();
            }
            else if ( Type.Column.IsRandomLastName )
            {
                Text = Random.MakeLastName();
            }
            else if ( Type.Column.IsRandomFullName )
            {
                Text
                    = Random.MakeFirstName()
                      ~ " "
                      ~ Random.MakeLastName();
            }
            else if ( Type.Column.IsRandomEnglish )
            {
                Text = Random.MakeText( "english", Type.Column.MinimumRandomCount, Type.Column.MaximumRandomCount, Type.Column.MinimumRandomInteger, Type.Column.MaximumRandomInteger );
            }
            else if ( Type.Column.IsRandomLatin )
            {
                Text = Random.MakeText( "latin", Type.Column.MinimumRandomCount, Type.Column.MaximumRandomCount, Type.Column.MinimumRandomInteger, Type.Column.MaximumRandomInteger );
            }
            else if ( Type.BaseName == "STRING" )
            {
                if ( Type.ColumnName.endsWith( "Title" ) )
                {
                    Text = Random.MakeSentence( "english", 4, 8 ).GetCapitalizedText() ~ ".";
                }
                else if ( Type.ColumnName.endsWith( "Slug" ) )
                {
                    prior_title = Type.Column.FindPriorColumnValue( "Title", row_index );
                    prior_name = Type.Column.FindPriorColumnValue( "Name", row_index );

                    if ( prior_title != "" )
                    {
                        Text = prior_title;
                    }
                    else if ( prior_name != "" )
                    {
                        Text = prior_name;
                    }
                    else
                    {
                        Text = Random.MakeName( 6, 12 );
                    }

                    Text
                        = Text
                               .toLower()
                               .replace( " ", "-" )
                               .replace( "\"", "-" )
                               .replace( ".", "" );
                }
                else if ( Type.ColumnName.endsWith( "Text" ) )
                {
                    Text = Random.MakeText( "english", 5, 10 );
                }
                else if ( Type.ColumnName.endsWith( "FirstName" ) )
                {
                    Text = Random.MakeFirstName();
                }
                else if ( Type.ColumnName.endsWith( "LastName" ) )
                {
                    Text = Random.MakeLastName();
                }
                else if ( Type.ColumnName.endsWith( "Name" ) )
                {
                    Text = Random.MakeLastName();
                }
                else if ( Type.ColumnName.endsWith( "Login" )
                          || Type.ColumnName.endsWith( "Pseudonym" ) )
                {
                    prior_email = Type.Column.FindPriorColumnValue( "Email", row_index );

                    if ( prior_email != "" )
                    {
                        Text = prior_email.split( '@' )[ 0 ].replace( ".", "" );
                    }
                    else
                    {
                        prior_first_name = Type.Column.FindPriorColumnValue( "FirstName", row_index );
                        prior_last_name = Type.Column.FindPriorColumnValue( "LastName", row_index );

                        Text
                            = ( ( prior_first_name != "" ) ? prior_first_name : Random.MakeFirstName() ).toLower()
                              ~ ( ( prior_last_name != "" ) ? prior_last_name : Random.MakeLastName() ).toLower();
                    }
                }
                else if ( Type.ColumnName.endsWith( "Password" ) )
                {
                    Text
                        = Random.MakeName( 4, 8 )
                                .InsertCharacter( Random.MakeUppercaseLetter() )
                                .InsertCharacter( Random.MakeDigit() )
                                .InsertCharacter( Random.MakeSeparator() );
                }
                else if ( Type.ColumnName.endsWith( "Email" ) )
                {
                    prior_first_name = Type.Column.FindPriorColumnValue( "FirstName", row_index );
                    prior_last_name = Type.Column.FindPriorColumnValue( "LastName", row_index );

                    Text
                        = ( ( prior_first_name != "" ) ? prior_first_name : Random.MakeFirstName() ).toLower()
                          ~ "."
                          ~ ( ( prior_last_name != "" ) ? prior_last_name : Random.MakeLastName() ).toLower()
                          ~ [
                              "@gmail.com",
                              "@yahoo.com",
                              "@outlook.com",
                              "@live.com",
                              "@hotmail.com",
                              "@mail.com"
                            ][ Random.MakeIndex( 6 ) ];
                }
                else if ( Type.ColumnName.endsWith( "Phone" ) )
                {
                    Text
                        = "+"
                          ~ Random.MakeInteger( 10, 99 ).to!string()
                          ~ " "
                          ~ Random.MakeInteger( 100, 999 ).to!string()
                          ~ " "
                          ~ Random.MakeInteger( 100, 999 ).to!string()
                          ~ " "
                          ~ Random.MakeInteger( 100, 999 ).to!string();
                }
                else if ( Type.ColumnName.endsWith( "Street" )
                          || Type.ColumnName.endsWith( "Address" ) )
                {
                    Text
                        = Random.MakeInteger( 1, 100 ).to!string()
                          ~ " "
                          ~ Random.MakeLastName()
                          ~ " "
                          ~ [
                              "Street",
                              "Court",
                              "Avenue",
                              "Boulevard",
                              "Lane",
                              "Alley",
                              "Drive",
                              "Park"
                            ][ Random.MakeIndex( 8 ) ];
                }
                else if ( Type.ColumnName.endsWith( "Code" ) )
                {
                    Text = Random.MakeInteger( 1000, 9999 ).to!string();
                }
                else if ( Type.ColumnName.endsWith( "City" ) )
                {
                    Text = Random.MakeCityName();
                }
                else if ( Type.ColumnName.endsWith( "Region" ) )
                {
                    Text = Random.MakeRegionName();
                }
                else if ( Type.ColumnName.endsWith( "Country" ) )
                {
                    Text = Random.MakeCountryName();
                }
                else if ( Type.ColumnName.endsWith( "Company" ) )
                {
                    Text
                        = Random.MakeLastName()
                          ~ " "
                          ~ [
                              "Company",
                              "Limited",
                              "Incorporated",
                              "Corporation",
                              "Union",
                              "Trust",
                              "Cooperative",
                              "Institute",
                              "Foundation",
                              "Association",
                              "Bank",
                              "Fund",
                              "Insurance",
                              "Security",
                              "Services",
                              "Club",
                              "Society",
                              "College",
                              "University",
                              "Church",
                              "Media",
                              "News",
                              "Magazine",
                              "Network",
                              "Channel",
                              "Group",
                              "Agency",
                              "Consulting",
                              "Team",
                              "Center",
                              "Design",
                              "Studio",
                              "Central",
                              "Direct",
                              "Tech",
                              "Store",
                              "Market",
                              "Online",
                              "Shop",
                              "Express",
                              "Point",
                              "Labs",
                              "Software",
                              "Depot",
                              "Logic",
                              "Factory",
                              "Fx",
                              "Solutions",
                              "Dynamics",
                              "Associates",
                              "Fashion",
                              "Vision"
                            ][ Random.MakeIndex( 52 ) ];
                }
                else if ( Type.ColumnName.endsWith( "Image" ) )
                {
                    Text
                        = Random.MakeName( 8, 8 )
                          ~ [
                              ".jpg",
                              ".png",
                              ".gif"
                            ][ Random.MakeIndex( 3 ) ];
                }
                else if ( Type.ColumnName.endsWith( "File" ) )
                {
                    Text
                        = Random.MakeName( 8, 8 )
                          ~ [
                              ".pdf",
                              ".doc",
                              ".odt"
                            ][ Random.MakeIndex( 3 ) ];
                }
                else if ( Type.ColumnName.endsWith( "Folder" ) )
                {
                    Text = Random.MakeName( 8, 8 ) ~ "/";
                }
                else if ( Type.ColumnName.endsWith( "Author" ) )
                {
                    Text
                        = Random.MakeFirstName()
                          ~ " "
                          ~ Random.MakeLastName();
                }
                else if ( Type.ColumnName.endsWith( "Isbn" ) )
                {
                    Text
                        = Random.MakeInteger( 100, 999 ).to!string()
                          ~ "-"
                          ~ Random.MakeInteger( 1000000000, 9999999999 ).to!string();
                }
                else if ( Type.ColumnName.endsWith( "Tags" ) )
                {
                    Text = Random.MakeEnglishSentence( 5, 10 ).replace( " ", ", " );
                }
                else
                {
                    Text = GetCapitalizedText( Random.MakeName( 6, 12 ) );
                }
            }
            else if ( Type.BaseName == "BOOL" )
            {
                Text = Random.MakeInteger( 0, 1 ).to!string();
            }
            else if ( Type.BaseName == "INT8"
                      || Type.BaseName == "UINT8"
                      || Type.BaseName == "INT16"
                      || Type.BaseName == "UINT16"
                      || Type.BaseName == "INT32"
                      || Type.BaseName == "UINT32"
                      || Type.BaseName == "INT64"
                      || Type.BaseName == "UINT64" )
            {
                if ( Type.ColumnName == "Id" )
                {
                    if ( Type.Column.IsIncremented )
                    {
                        Text = ( row_index + 1 ).to!string();
                    }
                    else
                    {
                        random_natural = Random.MakeNatural();

                        if ( Type.BaseName == "INT8" )
                        {
                            random_natural = random_natural & 7;
                        }
                        else if ( Type.BaseName == "UINT8" )
                        {
                            random_natural = random_natural & 8;
                        }
                        else if ( Type.BaseName == "INT16" )
                        {
                            random_natural = random_natural & 15;
                        }
                        else if ( Type.BaseName == "UINT16" )
                        {
                            random_natural = random_natural & 16;
                        }
                        else if ( Type.BaseName == "INT32" )
                        {
                            random_natural = random_natural & 31;
                        }
                        else if ( Type.BaseName == "UINT32" )
                        {
                            random_natural = random_natural & 32;
                        }
                        else if ( Type.BaseName == "INT64" )
                        {
                            random_natural = random_natural & 63;
                        }

                        Text = random_natural.to!string();
                    }
                }
                else if ( Type.ColumnName.endsWith( "Year" ) )
                {
                    Text = Random.MakeInteger( 2000, 2015 ).to!string();
                }
                else
                {
                    if ( Type.BaseName == "INT8"
                         || Type.BaseName == "UINT8" )
                    {
                        Text = Random.MakeInteger( 1, 100 ).to!string();
                    }
                    else
                    {
                        Text = Random.MakeInteger( 1, 1000 ).to!string();
                    }
                }
            }
            else if ( Type.BaseName == "FLOAT32"
                      || Type.BaseName == "FLOAT64" )
            {
                Text = ( Random.MakeInteger( 1000, 9999 ) / 100.0 ).to!string();
            }
            else if ( Type.BaseName == "DATE" )
            {
                Text = Random.MakeDate();
            }
            else if ( Type.BaseName == "DATETIME" )
            {
                Text = Random.MakeDate() ~ " " ~ Random.MakeTime();
            }
            else if ( Type.BaseName == "UUID" )
            {
                Text = Random.MakeUuid();
            }
            else if ( Type.BaseName == "BLOB" )
            {
                blob_byte_count = Random.MakeInteger( Type.Column.MinimumRandomCount, Type.Column.MaximumRandomCount );

                Text = Random.MakeBlob( blob_byte_count * 2 );
            }
            else if ( Type.BaseName == "TUPLE" )
            {
                foreach ( ref sub_value; SubValueArray )
                {
                    sub_value.Make( row_index, row_count, true );
                }
            }
            else if ( Type.BaseName == "LIST" )
            {
                element_value_count = Type.GetElementValueCount();

                ElementValueArray = new VALUE[ element_value_count ];

                for ( element_value_index = 0;
                      element_value_index < element_value_count;
                      ++element_value_index )
                {
                    ElementValueArray[ element_value_index ] = new VALUE( Type.SubTypeArray[ 0 ] );
                    ElementValueArray[ element_value_index ].Make( row_index, row_count, true );
                }
            }
            else if ( Type.BaseName == "SET" )
            {
                element_value_count = Type.GetElementValueCount();

                ElementValueArray = new VALUE[ element_value_count ];

                for ( element_value_index = 0;
                      element_value_index < element_value_count;
                      ++element_value_index )
                {
                    ElementValueArray[ element_value_index ] = new VALUE( Type.SubTypeArray[ 0 ] );
                    ElementValueArray[ element_value_index ].Make( row_index, row_count, true );

                    if ( IsPriorValue( ElementValueArray, element_value_index ) )
                    {
                        --element_value_index;
                    }
                }
            }
            else if ( Type.BaseName == "MAP" )
            {
                element_value_count = Type.GetElementValueCount();

                KeyValueArray = new VALUE[ element_value_count ];
                ElementValueArray = new VALUE[ element_value_count ];

                for ( element_value_index = 0;
                      element_value_index < element_value_count;
                      ++element_value_index )
                {
                    KeyValueArray[ element_value_index ] = new VALUE( Type.SubTypeArray[ 0 ] );
                    KeyValueArray[ element_value_index ].Make( row_index, row_count, true );

                    if ( IsPriorValue( KeyValueArray, element_value_index ) )
                    {
                        --element_value_index;
                    }
                    else
                    {
                        ElementValueArray[ element_value_index ] = new VALUE( Type.SubTypeArray[ 1 ] );
                        ElementValueArray[ element_value_index ].Make( row_index, row_count, true );
                    }
                }
            }

            if ( Type.Column.IsLowercase )
            {
                Text = Text.toLower();
            }

            if ( Type.Column.IsUppercase )
            {
                Text = Text.toUpper();
            }
        }
        while ( !it_is_sub_value
                && Type.Column.IsUnique
                && Type.Column.HasPriorValue( this, row_index ) );
    }

    // ~~

    string GetSqlText(
        bool it_is_sub_value = false
        )
    {
        string
            sql_text,
            type_name;

        type_name = Type.ActualType.BaseName;

        if ( type_name == "TUPLE" )
        {
            foreach ( sub_value_index, ref sub_value; SubValueArray )
            {
                if ( sub_value_index > 0 )
                {
                    sql_text ~= ", ";
                }

                sql_text ~= sub_value.GetSqlText( true );
            }

            sql_text = "( " ~ sql_text ~ " )";
        }
        else if ( type_name == "LIST" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    sql_text ~= ", ";
                }

                sql_text ~= element_value.GetSqlText( true );
            }

            sql_text = "[ " ~ sql_text ~ " ]";
        }
        else if ( type_name == "SET" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    sql_text ~= ", ";
                }

                sql_text ~= element_value.GetSqlText( true );
            }

            sql_text = "{ " ~ sql_text ~ " }";
        }
        else if ( type_name == "MAP" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    sql_text ~= ", ";
                }

                sql_text ~= KeyValueArray[ element_value_index ].GetSqlText( true ) ~ " : " ~ element_value.GetSqlText( true );
            }

            sql_text = "{ " ~ sql_text ~ " }";
        }
        else
        {
            sql_text = Text;
        }

        if ( !it_is_sub_value )
        {
            sql_text = sql_text.replace( "\"", "\\\"" );
        }

        return "\"" ~ sql_text ~ "\"";
    }

    // ~~

    string GetCqlText(
        )
    {
        string
            cql_text,
            type_name;

        type_name = Type.ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            if ( Text == "1" )
            {
                cql_text = "true";
            }
            else
            {
                cql_text = "false";
            }
        }
        else if ( type_name == "INT8"
                  || type_name == "UINT8"
                  || type_name == "INT16"
                  || type_name == "UINT16"
                  || type_name == "INT32"
                  || type_name == "UINT32"
                  || type_name == "INT64"
                  || type_name == "UINT64"
                  || type_name == "FLOAT32"
                  || type_name == "FLOAT64" )
        {
            cql_text = Text;
        }
        else if ( type_name == "DATE"
                  || type_name == "DATETIME" )
        {
            cql_text = "'" ~ Text ~ "'";
        }
        else if ( type_name == "UUID" )
        {
            cql_text = Text;
        }
        else if ( type_name == "BLOB" )
        {
            cql_text = "0x" ~ Text;
        }
        else if ( type_name == "TUPLE" )
        {
            foreach ( sub_value_index, ref sub_value; SubValueArray )
            {
                if ( sub_value_index > 0 )
                {
                    cql_text ~= ", ";
                }

                cql_text ~= sub_value.GetCqlText();
            }

            cql_text = "( " ~ cql_text ~ " )";
        }
        else if ( type_name == "LIST" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    cql_text ~= ", ";
                }

                cql_text ~= element_value.GetCqlText();
            }

            cql_text = "[ " ~ cql_text ~ " ]";
        }
        else if ( type_name == "SET" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    cql_text ~= ", ";
                }

                cql_text ~= element_value.GetCqlText();
            }

            cql_text = "{ " ~ cql_text ~ " }";
        }
        else if ( type_name == "MAP" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    cql_text ~= ", ";
                }

                cql_text ~= KeyValueArray[ element_value_index ].GetCqlText() ~ " : " ~ element_value.GetCqlText();
            }

            cql_text = "{ " ~ cql_text ~ " }";
        }
        else
        {
            cql_text = "'" ~ Text.replace( "'", "''" ) ~ "'";
        }

        return cql_text;
    }
}

// ~~

class COLUMN
{
    // -- ATTRIBUTES

    TABLE
        Table;
    string
        Name;
    TYPE
        Type;
    bool
        IsStored,
        IsLastStored,
        IsUnique,
        IsKey,
        IsLastKey,
        IsPartitioned,
        IsClustered,
        IsIndexed,
        IsStatic,
        IsRequired,
        IsIncremented,
        IsForeign,
        IsProcessed,
        IsFilled;
    long
        Capacity;
    bool
        IsRandomReal;
    double
        MinimumRandomReal,
        MaximumRandomReal;
    bool
        IsRandomInteger;
    long
        MinimumRandomInteger,
        MaximumRandomInteger;
    bool
        IsRandomNatural;
    ulong
        MinimumRandomNatural,
        MaximumRandomNatural;
    long
        MinimumRandomCount,
        MaximumRandomCount;
    bool
        IsRandomName,
        IsRandomFirstName,
        IsRandomLastName,
        IsRandomFullName,
        IsRandomEnglish,
        IsRandomLatin;
    bool
        IsLowercase,
        IsUppercase;
    VALUE[]
        ValueArray;
    COLUMN
        ForeignColumn;
    string
        SqlName,
        SqlType;
    string[]
        SqlPropertyArray;
    string
        CqlName,
        CqlType,
        StoredName,
        StoredType,
        GoName,
        GoType,
        GoAttribute,
        GoVariable,
        CrystalName,
        CrystalType,
        CsharpName,
        CsharpType,
        RustName,
        RustType,
        JavascriptName,
        JavascriptType;

    // -- CONSTRUCTORS

    this(
        TABLE table,
        string name,
        string type
        )
    {
        Table = table;
        Name = name.replace( " ", "" );
        Type = new TYPE( table, this, Name, type );
        IsStored = true;
        MinimumRandomCount = table.RowCount;
        MaximumRandomCount = table.RowCount;
    }

    // -- INQUIRIES

    bool HasPriorValue(
        VALUE value,
        long row_index
        )
    {
        foreach ( prior_row_index; 0 .. row_index )
        {
            if ( ValueArray[ prior_row_index ].IsEqual( value ) )
            {
                return true;
            }
        }

        return false;
    }

    // ~~

    string FindPriorColumnValue(
        string prior_column_name_suffix,
        long row_index
        )
    {
        foreach ( prior_column; Table.ColumnArray )
        {
            if ( prior_column == this )
            {
                return "";
            }
            else if ( prior_column.IsStored
                      && prior_column.Name.endsWith( prior_column_name_suffix ) )
            {
                prior_column.MakeValues();

                return prior_column.ValueArray[ row_index ].Text;
            }
        }

        return "";
    }

    // ~~

    string ReplaceTags(
        string template_text
        )
    {
        return
            template_text
                .replace( "{{column_name}}", Name )
                .replace( "{{column_stored_name}}", StoredName )
                .replace( "{{column_stored_type}}", StoredType )
                .replace( "{{column_cql_name}}", CqlName )
                .replace( "{{column_cql_type}}", CqlType )
                .replace( "{{column_sql_name}}", SqlName )
                .replace( "{{column_sql_type}}", SqlType )
                .replace( "{{column_go_name}}", GoName )
                .replace( "{{column_go_type}}", GoType )
                .replace( "{{column_go_attribute}}", GoAttribute )
                .replace( "{{column_go_variable}}", GoVariable )
                .replace( "{{column_crystal_name}}", CrystalName )
                .replace( "{{column_crystal_type}}", CrystalType )
                .replace( "{{column_csharp_name}}", CsharpName )
                .replace( "{{column_csharp_type}}", CsharpType )
                .replace( "{{column_rust_name}}", RustName )
                .replace( "{{column_rust_type}}", RustType )
                .replace( "{{column_javascript_name}}", JavascriptName )
                .replace( "{{column_javascript_type}}", JavascriptType );
    }

    // -- OPERATIONS

    void SetPropertyValue(
        string property_text
        )
    {
        string[]
            value_text_array;
        string
            property_name;

        value_text_array = property_text.split( ' ' );

        if ( value_text_array.length > 0 )
        {
            if ( value_text_array.length == 1 )
            {
                if ( value_text_array[ 0 ].startsWith( '!' ) )
                {
                    value_text_array[ 0 ] = value_text_array[ 0 ][ 1 .. $ ];
                    value_text_array ~= "0";
                }
                else
                {
                    value_text_array ~= "1";
                }
            }

            property_name = value_text_array[ 0 ];

            if ( value_text_array.length == 2 )
            {
                if ( property_name == "stored" )
                {
                    IsStored = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "unique" )
                {
                    IsUnique = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "key" )
                {
                    IsKey = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "partitioned" )
                {
                    IsPartitioned = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "clustered" )
                {
                    IsClustered = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "indexed" )
                {
                    IsIndexed = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "static" )
                {
                    IsStatic = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "required" )
                {
                    IsRequired = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "incremented" )
                {
                    IsIncremented = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "capacity" )
                {
                    Capacity = value_text_array[ 1 ].to!long();
                }
                else if ( property_name == "sqlname" )
                {
                    SqlName = value_text_array[ 1 ];
                }
                else if ( property_name == "cqlname" )
                {
                    CqlName = value_text_array[ 1 ];
                }
                else if ( property_name == "goname" )
                {
                    GoName = value_text_array[ 1 ];
                }
                else if ( property_name == "crystalname" )
                {
                    CrystalName = value_text_array[ 1 ];
                }
                else if ( property_name == "csharpname" )
                {
                    CsharpName = value_text_array[ 1 ];
                }
                else if ( property_name == "rustname" )
                {
                    RustName = value_text_array[ 1 ];
                }
                else if ( property_name == "javascriptname" )
                {
                    JavascriptName = value_text_array[ 1 ];
                }
                else if ( property_name == "firstname" )
                {
                    IsRandomFirstName = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "lastname" )
                {
                    IsRandomLastName = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "fullname" )
                {
                    IsRandomFullName = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "lowercase" )
                {
                    IsLowercase = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "uppercase" )
                {
                    IsUppercase = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "count" )
                {
                    MinimumRandomCount = value_text_array[ 1 ].to!long();
                    MaximumRandomCount = MinimumRandomCount;
                }
                else
                {
                    Abort( "Invalid column property : " ~ property_text );
                }
            }
            else if ( value_text_array.length == 3 )
            {
                if ( property_name == "real" )
                {
                    IsRandomReal = true;
                    MinimumRandomReal = value_text_array[ 1 ].to!double();
                    MaximumRandomReal = value_text_array[ 2 ].to!double();
                }
                else if ( property_name == "integer" )
                {
                    IsRandomInteger = true;
                    MinimumRandomInteger = value_text_array[ 1 ].to!long();
                    MaximumRandomInteger = value_text_array[ 2 ].to!long();
                }
                else if ( property_name == "natural" )
                {
                    IsRandomNatural = true;
                    MinimumRandomNatural = value_text_array[ 1 ].to!ulong();
                    MaximumRandomNatural = value_text_array[ 2 ].to!ulong();
                    MinimumRandomCount = 0;
                }
                else if ( property_name == "name" )
                {
                    IsRandomName = true;
                    MinimumRandomCount = value_text_array[ 1 ].to!long();
                    MaximumRandomCount = value_text_array[ 2 ].to!long();
                }
                else if ( property_name == "count" )
                {
                    MinimumRandomCount = value_text_array[ 1 ].to!long();
                    MaximumRandomCount = value_text_array[ 2 ].to!long();
                }
                else
                {
                    Abort( "Invalid column property : " ~ property_text );
                }
            }
            else if ( value_text_array.length == 4 )
            {
                if ( property_name == "natural" )
                {
                    IsRandomNatural = true;
                    MinimumRandomNatural = value_text_array[ 1 ].to!ulong();
                    MaximumRandomNatural = value_text_array[ 2 ].to!ulong();
                    MinimumRandomCount = value_text_array[ 3 ].to!long();
                }
            }
            else if ( value_text_array.length == 5 )
            {
                if ( property_name == "english" )
                {
                    IsRandomEnglish = true;
                    MinimumRandomCount = value_text_array[ 1 ].to!long();
                    MaximumRandomCount = value_text_array[ 2 ].to!long();
                    MinimumRandomInteger = value_text_array[ 3 ].to!long();
                    MaximumRandomInteger = value_text_array[ 4 ].to!long();
                }
                else if ( property_name == "latin" )
                {
                    IsRandomLatin = true;
                    MinimumRandomCount = value_text_array[ 1 ].to!long();
                    MaximumRandomCount = value_text_array[ 2 ].to!long();
                    MinimumRandomInteger = value_text_array[ 3 ].to!long();
                    MaximumRandomInteger = value_text_array[ 4 ].to!long();
                }
            }
            else
            {
                Abort( "Invalid column property : " ~ property_text );
            }
        }
    }

    // ~~

    void SetForeignColumn(
        )
    {
        Type.SetActualType();
        ForeignColumn = Type.ForeignColumn;
        IsForeign = ForeignColumn !is null;
    }

    // ~~

    void MakeType(
        )
    {
        writeln( "Processing column : ", Table.Name, ".", Name );

        SetForeignColumn();

        if ( SqlName == "" )
        {
            SqlName = Name;
        }

        if ( CqlName == "" )
        {
            CqlName = Name;
        }

        if ( GoName == "" )
        {
            GoName = Name;
        }

        if ( CrystalName == "" )
        {
            CrystalName = GetSnakeCaseText( Name );
        }

        if ( CsharpName == "" )
        {
            CsharpName = Name;
        }

        if ( RustName == "" )
        {
            RustName = GetSnakeCaseText( Name );
        }

        if ( JavascriptName == "" )
        {
            JavascriptName = Name;
        }

        SqlType = Type.GetSqlText();
        CqlType = Type.GetCqlText();

        if ( SqlOptionIsEnabled )
        {
            StoredName = SqlName;
            StoredType = SqlType;
        }

        if ( CqlOptionIsEnabled )
        {
            StoredName = CqlName;
            StoredType = CqlType;
        }

        GoType = Type.GetGoText().replace( "GOCQL.UUID", "UUID" );
        GoAttribute = Type.GetGoAttributeText();
        GoVariable = GoName.GetSnakeCaseText();
        CrystalType = Type.GetCrystalText();
        CsharpType = Type.GetCsharpText();
        RustType = Type.GetRustText();
        JavascriptType = Type.GetJavascriptText();

        if ( IsKey || IsRequired )
        {
            SqlPropertyArray ~= "NOT NULL";
        }
        else
        {
            SqlPropertyArray ~= "NULL";
        }

        if ( IsIncremented )
        {
            SqlPropertyArray ~= "AUTO_INCREMENT";
        }
    }

    // ~~

    void AddValue(
        string text
        )
    {
        VALUE
            value;

        value = new VALUE( Type );

        if ( Type.IsUuid()
             && text.startsWith( '#' ) )
        {
            text = sha1UUID( text ).toString();
        }

        value.Text = text;
        ValueArray ~= value;
    }

    // ~~

    void MakeValues(
        )
    {
        if ( IsProcessed )
        {
            Abort( "Mutual column dependency : " ~ Table.Name ~ "." ~ Name );
        }

        if ( !IsFilled )
        {
            writeln( "Filling column : " ~ Table.Name ~ "." ~ Name );

            IsProcessed = true;
            ValueArray = new VALUE[ Table.RowCount ];

            foreach ( row_index; 0 .. Table.RowCount )
            {
                if ( IsStored )
                {
                    ValueArray[ row_index ] = new VALUE( Type );
                    ValueArray[ row_index ].Make( row_index, Table.RowCount );
                }
            }

            IsFilled = true;
            IsProcessed = false;
        }
    }
}

// ~~

class TABLE
{
    // -- ATTRIBUTES

    string
        SchemaName,
        Name,
        GoType,
        GoAttribute,
        GoVariable,
        CrystalType,
        CsharpType,
        RustType,
        JavascriptType;
    string[]
        KeyNameArray;
    COLUMN[]
        ColumnArray;
    bool
        IsStored,
        IsLastStored;
    long
        RowCount;
    string
        GoAttributeDeclaration,
        GoTypeDeclaration,
        GenerisAttributeDeclaration,
        GenerisTypeDeclaration,
        CrystalAttributeDeclaration,
        CrystalTypeDeclaration,
        CybilAttributeDeclaration,
        CybilTypeDeclaration,
        CsharpAttributeDeclaration,
        CsharpTypeDeclaration,
        RustAttributeDeclaration,
        RustTypeDeclaration,
        JavascriptAttributeDeclaration,
        JavascriptTypeDeclaration;

    // -- CONSTRUCTORS

    this(
        SCHEMA schema,
        string name
        )
    {
        SchemaName = schema.Name;
        Name = name;
        GoType = name;
        GoAttribute = name.GetPascalCaseText();
        GoVariable = name.GetSnakeCaseText();
        CrystalType = name;
        CsharpType = name;
        RustType = name;
        JavascriptType = name;
        KeyNameArray = null;
        ColumnArray = null;
        IsStored = true;
        IsLastStored = false;
        RowCount = schema.RowCount;
    }

    // -- INQUIRIES

    COLUMN FindColumn(
        string column_name
        )
    {
        foreach ( ref column; ColumnArray )
        {
            if ( column.Name == column_name )
            {
                return column;
            }
        }

        return null;
    }

    // ~~

    string GetAddDatabaseGenerisCode(
        )
    {
        long
            column_count,
            column_index;
        string
            generis_code;

        generis_code
            = "func AddDatabase" ~ GoAttribute ~ "(\n"
              ~ "    " ~ GoVariable ~ " * " ~ GoType ~ ",\n"
              ~ "    error_code * ERROR_CODE\n"
              ~ "    ) bool\n"
              ~ "{\n";

        column_count = 0;

        foreach ( ref column; ColumnArray )
        {
            if ( column.IsKey
                 && column.IsUnique
                 && column.StoredType == "uuid" )
            {
                generis_code
                    ~= "    " ~ GoVariable ~ "." ~ column.GoName ~ " = gocql.TimeUUID();\n";

                ++column_count;
            }
        }

        if ( column_count > 0 )
        {
            generis_code ~="\n";
        }

        if ( SqlOptionIsEnabled )
        {
            generis_code
                ~= "    statement, error_\n"
                   ~ "        := DatabaseSession.Prepare(\n"
                   ~ "               \"insert into " ~ Name ~ "( ";

            column_count = 0;

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    if ( column_count > 0 )
                    {
                        generis_code ~= ", ";
                    }

                    generis_code ~= column.StoredName;

                    ++column_count;
                }
            }

            generis_code ~= " ) values( ";

            column_count = 0;

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    if ( column_count > 0 )
                    {
                        generis_code ~= ", ";
                    }

                    generis_code ~= "?";

                    ++column_count;
                }
            }

            generis_code
                ~= " )\"\n"
                   ~ "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    result, error_\n"
                   ~ "        := statement.Exec(\n";

            column_index = 0;

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    generis_code ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( column_index + 1 < column_count )
                    {
                        generis_code ~= ",";
                    }

                    generis_code ~= "\n";

                    ++column_index;
                }
            }

            generis_code
                ~= "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsKey
                     && column.IsIncremented )
                {
                    generis_code
                        ~= "    " ~ GoVariable ~ "." ~ column.GoName ~ ", error_ = result.LastInsertId();\n"
                           ~ "\n"
                           ~ "    if ( error_ != nil )\n"
                           ~ "    {\n"
                           ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
                           ~ "\n"
                           ~ "        return false;\n"
                           ~ "    }\n"
                           ~ "\n";
                }
            }

            generis_code
                ~= "    return true;\n"
                   ~ "}\n";
        }
        else
        {
            generis_code
                ~= "    error_\n"
                   ~ "        := DatabaseSession.Query(\n"
                   ~ "               \"insert into " ~ Name ~ "( ";

            column_count = 0;

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    if ( column_count > 0 )
                    {
                        generis_code ~= ", ";
                    }

                    generis_code ~= column.StoredName;

                    ++column_count;
                }
            }

            generis_code ~= " ) values( ";

            column_count = 0;

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    if ( column_count > 0 )
                    {
                        generis_code ~= ", ";
                    }

                    generis_code ~= "?";

                    ++column_count;
                }
            }

            generis_code ~= " )\",\n";

            column_index = 0;

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    generis_code ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( column_index + 1 < column_count )
                    {
                        generis_code ~= ",";
                    }

                    generis_code ~= "\n";

                    ++column_index;
                }
            }

            generis_code
                ~= "               ).Exec();\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    return true;\n"
                   ~ "}\n";
        }

        return generis_code;
    }

    // ~~

    string GetSetDatabaseGenerisCode(
        )
    {
        long
            column_count;
        string
            generis_code;

        generis_code
            = "func SetDatabase" ~ GoAttribute ~ "(\n"
              ~ "    " ~ GoVariable ~ " * " ~ GoType ~ ",\n"
              ~ "    error_code * ERROR_CODE\n"
              ~ "    ) bool\n"
              ~ "{\n";

        if ( SqlOptionIsEnabled )
        {
            generis_code
                ~= "    statement, error_\n"
                   ~ "        := DatabaseSession.Prepare(\n"
                   ~ "               \"update " ~ Name ~ " set ";

            column_count = 0;

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    if ( column_count > 0 )
                    {
                        generis_code ~= ", ";
                    }

                    generis_code ~= column.StoredName ~ " = ?";

                    ++column_count;
                }
            }

            generis_code ~= " where ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsKey )
                {
                    generis_code ~= column.StoredName ~ " = ?";

                    if ( !column.IsLastKey )
                    {
                        generis_code ~= ", ";
                    }
                }
            }

            generis_code
                ~= "\"\n"
                   ~ "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    result, error_\n"
                   ~ "        := statement.Exec(\n";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    generis_code ~= "               " ~ GoVariable ~ "." ~ column.GoName ~ ",\n";
                }
            }

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsKey )
                {
                    generis_code ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastKey )
                    {
                        generis_code ~= ",";
                    }

                    generis_code ~= "\n";
                }
            }

            generis_code
                ~= "               );\n";
        }
        else
        {
            generis_code
                ~= "    error_\n"
                   ~ "        := DatabaseSession.Query(\n"
                   ~ "               \"insert into " ~ Name ~ "( ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code ~= column.StoredName;

                    if ( !column.IsLastStored )
                    {
                        generis_code ~= ", ";
                    }
                }
            }

            generis_code ~= " ) values( ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code ~= "?";

                    if ( !column.IsLastStored )
                    {
                        generis_code ~= ", ";
                    }
                }
            }

            generis_code ~= " )\",\n";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastStored )
                    {
                        generis_code ~= ",";
                    }

                    generis_code ~= "\n";
                }
            }

            generis_code
                ~= "               ).Exec();\n";
        }

        generis_code
            ~= "\n"
               ~ "    if ( error_ != nil )\n"
               ~ "    {\n"
               ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
               ~ "\n"
               ~ "        return false;\n"
               ~ "    }\n"
               ~ "\n"
               ~ "    return true;\n"
               ~ "}\n";

        return generis_code;
    }

    // ~~

    string GetRemoveDatabaseGenerisCode(
        )
    {
        string
            generis_code;

        generis_code
            = "func RemoveDatabase" ~ GoAttribute ~ "(\n"
              ~ "    " ~ GoVariable ~ " * " ~ GoType ~ ",\n"
              ~ "    error_code * ERROR_CODE\n"
              ~ "    ) bool\n"
              ~ "{\n";

        if ( SqlOptionIsEnabled )
        {
            generis_code
                ~= "    statement, error_\n"
                   ~ "        := DatabaseSession.Prepare(\n"
                   ~ "               \"delete from " ~ Name ~ " where ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsKey )
                {
                    generis_code ~= column.StoredName ~ " = ?";

                    if ( !column.IsLastKey )
                    {
                        generis_code ~= " and ";
                    }
                }
            }

            generis_code
                ~= "\"\n"
                   ~ "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    result, error_\n"
                   ~ "        := statement.Exec(\n";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsKey )
                {
                    generis_code ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastKey )
                    {
                        generis_code ~= ", ";
                    }

                    generis_code ~= "\n";
                }
            }

            generis_code
                ~= "               );\n";
        }
        else
        {
            generis_code
                ~= "    error_\n"
                   ~ "        := DatabaseSession.Query(\n"
                   ~ "               \"delete from " ~ Name ~ " where ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsKey )
                {
                    generis_code ~= column.StoredName ~ " = ?";

                    if ( !column.IsLastKey )
                    {
                        generis_code ~= " and ";
                    }
                }
            }

            generis_code ~= "\",\n";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsKey )
                {
                    generis_code ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastKey )
                    {
                        generis_code ~= ", ";
                    }

                    generis_code ~= "\n";
                }
            }

            generis_code
                ~= "               ).Exec();\n";
        }

        generis_code
            ~= "\n"
               ~ "    if ( error_ != nil )\n"
               ~ "    {\n"
               ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
               ~ "\n"
               ~ "        return false;\n"
               ~ "    }\n"
               ~ "\n"
               ~ "    return true;\n"
               ~ "}\n";

        return generis_code;
    }

    // ~~

    string GetGetDatabaseGenerisCode(
        )
    {
        long
            column_count;
        string
            generis_code;

        generis_code
            = "func GetDatabase" ~ GoAttribute ~ "(\n"
              ~ "    " ~ GoVariable ~ " * " ~ GoType ~ ",\n"
              ~ "    error_code * ERROR_CODE\n"
              ~ "    ) bool\n"
              ~ "{\n";

        if ( SqlOptionIsEnabled )
        {
            generis_code
                ~= "    statement, error_\n"
                   ~ "        := DatabaseSession.Prepare(\n"
                   ~ "               \"select ";

            column_count = 0;

            foreach ( ref column; ColumnArray )
            {
                if ( !column.IsKey )
                {
                    if ( column_count > 0 )
                    {
                        generis_code ~= ", ";
                    }

                    generis_code ~= column.StoredName;

                    ++column_count;
                }
            }

            generis_code ~= " from " ~ Name ~ " where ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsKey )
                {
                    generis_code ~= column.StoredName ~ " = ?";

                    if ( !column.IsLastKey )
                    {
                        generis_code ~= " and ";
                    }
                }
            }

            generis_code
                ~= "\"\n"
                   ~ "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    rows, error_\n"
                   ~ "        := statement.Query(\n";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsKey )
                {
                    generis_code ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastKey )
                    {
                        generis_code ~= ",";
                    }

                    generis_code ~= "\n";
                }
            }

            generis_code
                ~= "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    for rows.Next()\n"
                   ~ "    {\n"
                   ~ "        error_\n"
                   ~ "            = rows.Scan(";

            column_count = 0;

            foreach ( ref column; ColumnArray )
            {
                if ( !column.IsKey )
                {
                    if ( column_count > 0 )
                    {
                        generis_code ~= ",\n";
                    }
                    else
                    {
                        generis_code ~= "\n";
                    }

                    generis_code ~= "                  &" ~ GoVariable ~ "." ~ column.GoName;

                    ++column_count;
                }
            }

            generis_code
                ~= "\n"
                   ~ "                  );\n"
                   ~ "\n"
                   ~ "        if ( error_ != nil )\n"
                   ~ "        {\n"
                   ~ "            error_code.Set( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "            return false;\n"
                   ~ "        }\n"
                   ~ "    }\n";
        }
        else
        {
            generis_code
                ~= "    error_\n"
                   ~ "        := DatabaseSession.Query(\n"
                   ~ "               \"select ";

            column_count = 0;

            foreach ( ref column; ColumnArray )
            {
                if ( !column.IsKey )
                {
                    if ( column_count > 0 )
                    {
                        generis_code ~= ", ";
                    }

                    generis_code ~= column.StoredName;

                    ++column_count;
                }
            }

            generis_code ~= " from " ~ Name ~ " where ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsKey )
                {
                    generis_code ~= column.StoredName ~ " = ?";

                    if ( !column.IsLastKey )
                    {
                        generis_code ~= " and ";
                    }
                }
            }

            generis_code ~= "\",\n";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsKey )
                {
                    generis_code ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastKey )
                    {
                        generis_code ~= ",";
                    }

                    generis_code ~= "\n";
                }
            }

            generis_code
                ~= "               )\n"
                   ~ "               .Consistency( gocql.One )\n"
                   ~ "               .Scan(";

            column_count = 0;

            foreach ( ref column; ColumnArray )
            {
                if ( !column.IsKey )
                {
                    if ( column_count > 0 )
                    {
                        generis_code ~= ",\n";
                    }
                    else
                    {
                        generis_code ~= "\n";
                    }

                    generis_code ~= "                    &" ~ GoVariable ~ "." ~ column.GoName;

                    ++column_count;
                }
            }

            generis_code
                ~= "\n"
                   ~ "                    );\n";
        }

        generis_code
            ~= "\n"
               ~ "    if ( error_ != nil )\n"
               ~ "    {\n"
               ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
               ~ "\n"
               ~ "        return false;\n"
               ~ "    }\n"
               ~ "\n"
               ~ "    return true;\n"
               ~ "}\n";

        return generis_code;
    }

    // ~~

    string GetGetDatabaseArrayGenerisCode(
        )
    {
        string
            generis_code;

        generis_code
            = "func GetDatabase" ~ GoAttribute ~ "Array(\n"
              ~ "    " ~ GoVariable ~ "_array * [] " ~ GoType ~ ",\n"
              ~ "    error_code * ERROR_CODE\n"
              ~ "    ) bool\n"
              ~ "{\n"
              ~ "    var\n"
              ~ "        " ~ GoVariable ~ " " ~ GoType ~ ";\n"
              ~ "\n";

        if ( SqlOptionIsEnabled )
        {
            generis_code
                ~= "    statement, error_\n"
                   ~ "        := DatabaseSession.Prepare(\n"
                   ~ "               \"select ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code ~= column.StoredName;

                    if ( !column.IsLastStored )
                    {
                        generis_code ~= ", ";
                    }
                }
            }

            generis_code
                ~= " from " ~ Name ~ "\"\n"
                   ~ "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    rows, error_ := statement.Query();\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    *" ~ GoVariable ~ "_array = make( [] " ~ GoType ~ ", 0 );\n"
                   ~ "\n"
                   ~ "    for rows.Next()\n"
                   ~ "    {\n"
                   ~ "        error_\n"
                   ~ "            = rows.Scan(\n";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code ~= "                  &" ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastStored )
                    {
                        generis_code ~= ",\n";
                    }
                    else
                    {
                        generis_code ~= "\n";
                    }
                }
            }

            generis_code
                ~= "                  );\n"
                   ~ "\n"
                   ~ "        if ( error_ != nil )\n"
                   ~ "        {\n"
                   ~ "            error_code.Set( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "            return false;\n"
                   ~ "        }\n"
                   ~ "\n"
                   ~ "        *" ~ GoVariable ~ "_array = append( *" ~ GoVariable ~ "_array, " ~ GoVariable ~ " );\n"
                   ~ "    }\n";
        }
        else
        {
            generis_code
                ~= "    iterator\n"
                   ~ "        := DatabaseSession.Query(\n"
                   ~ "               \"select ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code ~= column.StoredName;

                    if ( !column.IsLastStored )
                    {
                        generis_code ~= ", ";
                    }
                }
            }

            generis_code
                ~= " from " ~ Name ~ "\"\n"
                   ~ "               )\n"
                   ~ "               .Consistency( gocql.One )\n"
                   ~ "               .Iter();\n"
                   ~ "\n"
                   ~ "    *" ~ GoVariable ~ "_array = make( [] " ~ GoType ~ ", 0 );\n"
                   ~ "\n"
                   ~ "    for iterator.Scan(\n";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code ~= "            &" ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastStored )
                    {
                        generis_code ~= ",\n";
                    }
                    else
                    {
                        generis_code ~= "\n";
                    }
                }
            }

            generis_code
                ~= "            )\n"
                   ~ "    {\n"
                   ~ "        *" ~ GoVariable ~ "_array = append( *" ~ GoVariable ~ "_array, " ~ GoVariable ~ " );\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    error_ := iterator.Close();\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.Set( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n";
        }

        generis_code
            ~= "\n"
               ~ "    return true;\n"
               ~ "}\n";

        return generis_code;
    }

    // ~~

    string GetWriteResponseGenerisCode(
        )
    {
        string
            generis_code;

        generis_code
            = "func WriteResponse" ~ GoAttribute ~ "(\n"
              ~ "    response_writer http.ResponseWriter,\n"
              ~ "    " ~ GoVariable ~ " * " ~ GoType ~ "\n"
              ~ "    )\n"
              ~ "{\n"
              ~ "    WriteResponse( response_writer, \"{\" );\n";

        foreach ( ref column; ColumnArray )
        {
            if ( column.IsStored )
            {
                generis_code
                    ~= "    WriteResponse( response_writer, \"\\\"" ~ column.GoName ~ "\\\":\" );\n"
                       ~ "    WriteResponse" ~ column.GoAttribute ~ "( response_writer, " ~ GoVariable ~ "." ~ column.GoName ~ " );\n";

                if ( !column.IsLastStored )
                {
                    generis_code
                        ~= "    WriteResponse( response_writer, \",\" );\n";
                }
            }
        }

        generis_code
            ~= "    WriteResponse( response_writer, \"}\" );\n"
               ~ "}\n";

        return generis_code.replace( "\" );\n    WriteResponse( response_writer, \"", "" );
    }

    // ~~

    string GetHandleAddRequestGenerisCode(
        )
    {
        string
            generis_code;

        generis_code
            = "func HandleAdd" ~ GoAttribute ~ "Request(\n"
              ~ "    response_writer http.ResponseWriter,\n"
              ~ "    request * http.Request\n"
              ~ "    )\n"
              ~ "{\n"
              ~ "    var\n"
              ~ "        error_code ERROR_CODE;\n"
              ~ "    var\n"
              ~ "        " ~ GoVariable ~ " " ~ GoType ~ ";\n"
              ~ "\n";

        generis_code ~= "    if ( IsAdministratorSession( request, &error_code )\n";

        foreach ( ref column; ColumnArray )
        {
            if ( column.IsStored
                 && !( column.IsKey
                       && column.IsUnique
                       && ( column.StoredType == "uuid"
                            || column.IsIncremented) ) )
            {
                generis_code
                    ~= "         && GetRequest" ~ column.GoAttribute ~ "( &" ~ GoVariable ~ "." ~ column.GoName ~ ", request, \"" ~ column.StoredName ~ "\", &error_code )\n";
            }
        }

        generis_code
            ~= "         && AddDatabase" ~ GoAttribute ~ "( &" ~ GoVariable ~ ", &error_code ) )\n"
               ~ "    {\n"
               ~ "        WriteResponse( response_writer, \"{\" );\n";

        foreach ( ref column; ColumnArray )
        {
            if ( column.IsStored
                 && column.IsKey )
            {
                generis_code
                    ~= "        WriteResponse( response_writer, \"\\\"" ~ column.GoName ~ "\\\":\" );\n"
                       ~ "        WriteResponse" ~ column.GoAttribute ~ "( response_writer, " ~ GoVariable ~ "." ~ column.GoName ~ " );\n";
            }
        }

        generis_code
            ~= "        WriteResponse( response_writer, \"}\" );\n"
               ~ "    }\n"
               ~ "    else\n"
               ~ "    {\n"
               ~ "        WriteResponseError( response_writer, &error_code );\n"
               ~ "    }\n"
               ~ "}\n";

        return generis_code;
    }

    // ~~

    string GetHandleSetRequestGenerisCode(
        )
    {
        string
            generis_code;

        generis_code
            = "func HandleSet" ~ GoAttribute ~ "Request(\n"
              ~ "    response_writer http.ResponseWriter,\n"
              ~ "    request * http.Request\n"
              ~ "    )\n"
              ~ "{\n"
              ~ "    var\n"
              ~ "        error_code ERROR_CODE;\n"
              ~ "    var\n"
              ~ "        " ~ GoVariable ~ " " ~ GoType ~ ";\n"
              ~ "\n"
              ~ "    if ( IsAdministratorSession( request, &error_code )\n";

        foreach ( ref column; ColumnArray )
        {
            if ( column.IsStored )
            {
                generis_code
                    ~= "         && GetRequest" ~ column.GoAttribute ~ "( &" ~ GoVariable ~ "." ~ column.GoName ~ ", request, \"" ~ column.StoredName ~ "\", &error_code )\n";
            }
        }

        generis_code
            ~= "         && SetDatabase" ~ GoAttribute ~ "( &" ~ GoVariable ~ ", &error_code ) )\n"
               ~ "    {\n"
               ~ "        WriteResponseSuccess( response_writer );\n"
               ~ "    }\n"
               ~ "    else\n"
               ~ "    {\n"
               ~ "        WriteResponseError( response_writer, &error_code );\n"
               ~ "    }\n"
               ~ "}\n";

        return generis_code;
    }

    // ~~

    string GetHandleRemoveRequestGenerisCode(
        )
    {
        string
            generis_code;

        generis_code
            = "func HandleRemove" ~ GoAttribute ~ "Request(\n"
              ~ "    response_writer http.ResponseWriter,\n"
              ~ "    request * http.Request\n"
              ~ "    )\n"
              ~ "{\n"
              ~ "    var\n"
              ~ "        error_code ERROR_CODE;\n"
              ~ "    var\n"
              ~ "        " ~ GoVariable ~ " " ~ GoType ~ ";\n"
              ~ "\n"
              ~ "    if ( IsAdministratorSession( request, &error_code )\n";

        foreach ( ref column; ColumnArray )
        {
            if ( column.IsKey )
            {
                generis_code
                    ~= "         && GetRequest" ~ column.GoAttribute ~ "( &" ~ GoVariable ~ "." ~ column.GoName ~ ", request, \"" ~ column.StoredName ~ "\", &error_code )\n";
            }
        }

        generis_code
            ~= "         && RemoveDatabase" ~ GoAttribute ~ "( &" ~ GoVariable ~ ", &error_code ) )\n"
               ~ "    {\n"
               ~ "        WriteResponseSuccess( response_writer );\n"
               ~ "    }\n"
               ~ "    else\n"
               ~ "    {\n"
               ~ "        WriteResponseError( response_writer, &error_code );\n"
               ~ "    }\n"
               ~ "}\n";

        return generis_code;
    }

    // ~~

    string GetHandleGetRequestGenerisCode(
        )
    {
        string
            generis_code;

        generis_code
            = "func HandleGet" ~ GoAttribute ~ "Request(\n"
              ~ "    response_writer http.ResponseWriter,\n"
              ~ "    request * http.Request\n"
              ~ "    )\n"
              ~ "{\n"
              ~ "    var\n"
              ~ "        error_code ERROR_CODE;\n"
              ~ "    var\n"
              ~ "        " ~ GoVariable ~ " " ~ GoType ~ ";\n"
              ~ "\n"
              ~ "    if ( IsAdministratorSession( request, &error_code )\n";

        foreach ( ref column; ColumnArray )
        {
            if ( column.IsKey )
            {
                generis_code
                    ~= "         && GetRequest" ~ column.GoAttribute ~ "( &" ~ GoVariable ~ "." ~ column.GoName ~ ", request, \"" ~ column.StoredName ~ "\", &error_code )\n";
            }
        }

        generis_code
            ~= "         && GetDatabase" ~ GoAttribute ~ "( &" ~ GoVariable ~ ", &error_code ) )\n"
               ~ "    {\n"
               ~ "        WriteResponse( response_writer, \"{\\\"" ~ GoAttribute ~ "\\\":\" );\n"
               ~ "        WriteResponse" ~ GoAttribute ~ "( response_writer, &" ~ GoVariable ~ " );\n"
               ~ "        WriteResponse( response_writer, \"}\" );\n"
               ~ "    }\n"
               ~ "    else\n"
               ~ "    {\n"
               ~ "        WriteResponseError( response_writer, &error_code );\n"
               ~ "    }\n"
               ~ "}\n";

        return generis_code;
    }

    // ~~

    string GetHandleGetArrayRequestGenerisCode(
        )
    {
        return
            "func HandleGet" ~ GoAttribute ~ "ArrayRequest(\n"
            ~ "    response_writer http.ResponseWriter,\n"
            ~ "    request * http.Request\n"
            ~ "    )\n"
            ~ "{\n"
            ~ "    var\n"
            ~ "        error_code ERROR_CODE;\n"
            ~ "    var\n"
            ~ "        " ~ GoVariable ~ "_array [] " ~ GoType ~ ";\n"
            ~ "\n"
            ~ "    if ( IsAdministratorSession( request, &error_code )\n"
            ~ "         && GetDatabase" ~ GoAttribute ~ "Array( &" ~ GoVariable ~ "_array, &error_code ) )\n"
            ~ "    {\n"
            ~ "        WriteResponse( response_writer, \"{\\\"" ~ GoAttribute ~ "Array\\\":[\" );\n"
            ~ "\n"
            ~ "        for " ~ GoVariable ~ "_index, _ := range " ~ GoVariable ~ "_array\n"
            ~ "        {\n"
            ~ "            if ( " ~ GoVariable ~ "_index > 0 )\n"
            ~ "            {\n"
            ~ "                 WriteResponse( response_writer, \",\" );\n"
            ~ "            }\n"
            ~ "\n"
            ~ "            WriteResponse" ~ GoAttribute ~ "( response_writer, &" ~ GoVariable ~ "_array[ " ~ GoVariable ~ "_index ] );\n"
            ~ "        }\n"
            ~ "\n"
            ~ "        WriteResponse( response_writer, \"]}\" );\n"
            ~ "    }\n"
            ~ "    else\n"
            ~ "    {\n"
            ~ "        WriteResponseError( response_writer, &error_code );\n"
            ~ "    }\n"
            ~ "}\n";
    }

    // ~~

    string GetRouteRequestGenerisCode(
        )
    {
        return
            "    router.Post( \"/api/add_" ~ GoVariable ~ "\", HandleAdd" ~ GoAttribute ~ "Request );\n"
            ~ "    router.Post( \"/api/set_" ~ GoVariable ~ "\", HandleSet" ~ GoAttribute ~ "Request );\n"
            ~ "    router.Post( \"/api/remove_" ~ GoVariable ~ "\", HandleRemove" ~ GoAttribute ~ "Request );\n"
            ~ "    router.Post( \"/api/get_" ~ GoVariable ~ "\", HandleGet" ~ GoAttribute ~ "Request );\n"
            ~ "    router.Post( \"/api/get_" ~ GoVariable ~ "_array\", HandleGet" ~ GoAttribute ~ "ArrayRequest );\n";
    }

    // ~~

    string ReplaceTags(
        string template_text
        )
    {
        return
            template_text
                .replace( "{{table_name}}", Name )
                .replace( "{{table_go_type}}", GoType )
                .replace( "{{table_go_attribute}}", GoAttribute )
                .replace( "{{table_go_variable}}", GoVariable )
                .replace( "{{table_crystal_type}}", CrystalType )
                .replace( "{{table_csharp_type}}", CsharpType )
                .replace( "{{table_rust_type}}", RustType )
                .replace( "{{table_javascript_type}}", JavascriptType )
                .replace( "{{table_go_attribute_declaration}}", GoAttributeDeclaration )
                .replace( "{{table_go_type_declaration}}", GoTypeDeclaration )
                .replace( "{{table_generis_attribute_declaration}}", GenerisAttributeDeclaration )
                .replace( "{{table_generis_type_declaration}}", GenerisTypeDeclaration )
                .replace( "{{table_crystal_attribute_declaration}}", CrystalAttributeDeclaration )
                .replace( "{{table_crystal_type_declaration}}", CrystalTypeDeclaration )
                .replace( "{{table_cibyl_attribute_declaration}}", CybilAttributeDeclaration )
                .replace( "{{table_cibyl_type_declaration}}", CybilTypeDeclaration )
                .replace( "{{table_csharp_attribute_declaration}}", CsharpAttributeDeclaration )
                .replace( "{{table_csharp_type_declaration}}", CsharpTypeDeclaration )
                .replace( "{{table_javascript_attribute_declaration}}", JavascriptAttributeDeclaration )
                .replace( "{{table_javascript_type_declaration}}", JavascriptTypeDeclaration )
                .replace( "{{table_rust_attribute_declaration}}", RustAttributeDeclaration )
                .replace( "{{table_rust_type_declaration}}", RustTypeDeclaration );
    }

    // -- OPERATIONS

    void SetPropertyValue(
        string property_text
        )
    {
        string
            property_name;
        string[]
            value_text_array;

        value_text_array = property_text.split( ' ' );

        if ( value_text_array.length > 0 )
        {
            if ( value_text_array.length == 1 )
            {
                if ( value_text_array[ 0 ].startsWith( '!' ) )
                {
                    value_text_array[ 0 ] = value_text_array[ 0 ][ 1 .. $ ];
                    value_text_array ~= "0";
                }
                else
                {
                    value_text_array ~= "1";
                }
            }

            property_name = value_text_array[ 0 ];

            if ( value_text_array.length == 2 )
            {
                if ( property_name == "stored" )
                {
                    IsStored = ( value_text_array[ 1 ] != "0" );
                }
                else if ( value_text_array[ 0 ] == "count" )
                {
                    RowCount = value_text_array[ 1 ].to!long();
                }
            }
            else
            {
                Abort( "Invalid table property : " ~ property_text );
            }
        }
    }

    // ~~

    void MakeTypes(
        )
    {
        COLUMN
            last_key_column,
            last_stored_column;

        writeln( "Processing table : ", Name );

        foreach ( ref column; ColumnArray )
        {
            column.MakeType();
        }

        last_stored_column = null;
        last_key_column = null;

        foreach ( ref column; ColumnArray )
        {
            if ( column.IsStored )
            {
                last_stored_column = column;
            }

            if ( column.IsKey )
            {
                last_key_column = column;
            }
        }

        if ( last_stored_column !is null )
        {
            last_stored_column.IsLastStored = true;
        }

        if ( last_key_column !is null )
        {
            last_key_column.IsLastKey = true;
        }
    }

    // ~~

    void MakeValues(
        )
    {
        writeln( "Filling table : ", Name );

        foreach ( ref column; ColumnArray )
        {
            if ( column.IsStored )
            {
                column.MakeValues();
            }
        }
    }
}

// ~~

class SCHEMA
{
    // -- ATTRIBUTES

    string
        Name;
    TABLE[]
        TableArray;
    long
        RowCount;

    // -- CONSTRUCTORS

    this(
        )
    {
        RowCount = 10;
    }

    // -- INQUIRIES

    TABLE FindTable(
        string table_name
        )
    {
        foreach ( ref table; TableArray )
        {
            if ( table.Name == table_name )
            {
                return table;
            }
        }

        return null;
    }

    // ~~

    COLUMN FindForeignColumn(
        string foreign_column_name
        )
    {
        string[]
            foreign_column_name_part_array;
        TABLE
            foreign_table;

        foreign_column_name_part_array = foreign_column_name.split( '.' );

        if ( foreign_column_name_part_array.length == 2 )
        {
            foreign_table = FindTable( foreign_column_name_part_array[ 0 ] );

            if ( foreign_table !is null )
            {
                return foreign_table.FindColumn( foreign_column_name_part_array[ 1 ] );
            }
        }

        Abort( "Invalid foreign column name : " ~ foreign_column_name );

        return null;
    }

    // -- OPERATIONS

    void SetPropertyValue(
        string property_text
        )
    {
        string[]
            value_text_array;

        value_text_array = property_text.split( ' ' );

        if ( value_text_array.length == 2 )
        {
            if ( value_text_array[ 0 ] == "count" )
            {
                RowCount = value_text_array[ 1 ].to!long();
            }
        }
        else
        {
            Abort( "Invalid table property : " ~ property_text );
        }
    }

    // ~~

    void AddTables(
        string[] line_array
        )
    {
        string
            column_name,
            column_text,
            column_type,
            stripped_line,
            table_name;
        string[]
            column_part_array,
            line_part_array,
            property_part_array;
        COLUMN
            column;
        TABLE
            table;

        foreach ( line; line_array )
        {
            writeln( line );

            stripped_line = line.strip();

            if ( line.startsWith( "        " ) )
            {
                line_part_array = stripped_line.split( '|' );
                column_part_array = line_part_array[ 0 ].split( ':' );

                if ( column_part_array.length >= 2 )
                {
                    column_name = column_part_array[ 0 ].strip();
                    column_type = column_part_array[ 1 .. $ ].join( ':' ).strip();

                    column = new COLUMN( table, column_name, column_type );
                    table.ColumnArray ~= column;

                    if ( line_part_array.length == 2 )
                    {
                        property_part_array = line_part_array[ 1 ].split( ',' );

                        foreach ( ref property_text; property_part_array )
                        {
                            column.SetPropertyValue( property_text.strip() );
                        }

                        if ( column.IsKey )
                        {
                            table.KeyNameArray ~= column.Name;
                        }
                    }
                    else if ( line_part_array.length != 1 )
                    {
                        Abort( "Invalid column : " ~ stripped_line );
                    }
                }
                else
                {
                    Abort( "Invalid column : " ~ stripped_line );
                }
            }
            else if ( line.startsWith( "    " ) )
            {
                line_part_array = stripped_line.split( '|' );

                table_name = line_part_array[ 0 ].strip();

                table = new TABLE( this, table_name );
                TableArray ~= table;

                if ( line_part_array.length == 2 )
                {
                    property_part_array = line_part_array[ 1 ].split( ',' );

                    foreach ( ref property_text; property_part_array )
                    {
                        table.SetPropertyValue( property_text.strip() );
                    }
                }
                else if ( line_part_array.length != 1 )
                {
                    Abort( "Invalid table : " ~ stripped_line );
                }
            }
            else
            {
                line_part_array = stripped_line.split( '|' );

                Name = line_part_array[ 0 ].strip();

                if ( line_part_array.length == 2 )
                {
                    property_part_array = line_part_array[ 1 ].split( ',' );

                    foreach ( ref property_text; property_part_array )
                    {
                        SetPropertyValue( property_text.strip() );
                    }
                }
                else if ( line_part_array.length != 1 )
                {
                    Abort( "Invalid schema : " ~ stripped_line );
                }
            }
        }
    }

    // ~~

    void MakeTypes(
        )
    {
        foreach ( ref table; TableArray )
        {
            table.MakeTypes();
        }
    }

    // ~~

    void AddValues(
        string[] line_array
        )
    {
        char
            character;
        long
            character_index,
            value_index;
        string
            stripped_line,
            table_name,
            value_line,
            value;
        string[]
            column_name_array,
            value_array;
        COLUMN
            column;
        COLUMN[]
            column_array;
        TABLE
            table;

        table = null;
        column_array = null;

        foreach ( line; line_array )
        {
            writeln( line );

            stripped_line = line.strip();

            if ( line.startsWith( "            " ) )
            {
                if ( table is null
                     || column_array is null )
                {
                    Abort( "Invalid line : " ~ stripped_line );
                }

                value_array = null;
                value = "";

                value_line = stripped_line;

                for ( character_index = 0;
                      character_index < value_line.length;
                      ++character_index )
                {
                    character = value_line[ character_index ];

                    if ( character == '~' )
                    {
                        value_array ~= value.GetStrippedText().replace( '\t', ' ' );
                        value = "";
                    }
                    else if ( character == '^' )
                    {
                        value ~= '\t';
                    }
                    else if ( character == '\\'
                              && character_index + 1 < value_line.length )
                    {
                        value ~= value_line[ character_index + 1 ];

                        ++character_index;
                    }
                    else
                    {
                        value ~= character;
                    }
                }

                value_array ~= value.GetStrippedText().replace( '\t', ' ' );

                if ( value_array.length != column_array.length )
                {
                    Abort( "Invalid value count : " ~ stripped_line );
                }

                for ( value_index = 0;
                      value_index < value_array.length;
                      ++value_index )
                {
                    column_array[ value_index ].AddValue( value_array[ value_index ] );
                }

                ++table.RowCount;
            }
            else if ( line.startsWith( "        " ) )
            {
                if ( table is null )
                {
                    Abort( "Invalid line : " ~ stripped_line );
                }

                column_name_array = stripped_line.split( ' ' );
                column_array = null;

                foreach ( column_name; column_name_array )
                {
                    column = table.FindColumn( column_name );

                    if ( column is null )
                    {
                        Abort( "Invalid table name : " ~ column_name );
                    }

                    if ( column.IsFilled )
                    {
                        Abort( "Column is already filled : " ~ column_name );
                    }

                    column.IsFilled = true;
                    column_array ~= column;
                }
            }
            else if ( line.startsWith( "    %" ) )
            {
                table_name = stripped_line[ 1 .. $ ];
                table = FindTable( table_name );
                table.RowCount = 0;

                if ( table is null )
                {
                    Abort( "Invalid table name : " ~ table_name );
                }
            }
            else
            {
                Abort( "Invalid line : " ~ stripped_line );
            }
        }
    }

    // ~~

    void MakeValues(
        )
    {
        foreach ( ref table; TableArray )
        {
            foreach ( ref column; table.ColumnArray )
            {
                if ( column.IsStored )
                {
                    column.MakeValues();
                }
            }
        }
    }

    // ~~

    void ReadBasilFile(
        string basil_file_path
        )
    {
        bool
            line_contains_data;
        string
            basil_file_text,
            stripped_line;
        string[]
            data_line_array,
            line_array,
            schema_line_array;

        writeln( "Reading schema file : ", basil_file_path );

        basil_file_text = basil_file_path.readText();

        TableArray = null;

        line_array = basil_file_text.replace( "\r", "" ).replace( "\t", "    " ).split( '\n' );
        line_contains_data = false;
        schema_line_array = null;
        data_line_array = null;

        foreach ( line; line_array )
        {
            line = line.stripRight();
            stripped_line = line.strip();

            if ( stripped_line != ""
                 && !stripped_line.startsWith( "--" ) )
            {
                if ( line.startsWith( "    " )
                     && !line.startsWith( "        " ) )
                {
                    if ( line.startsWith( "    %" ) )
                    {
                        line_contains_data = true;
                    }
                    else
                    {
                        line_contains_data = false;
                    }
                }

                if ( line_contains_data )
                {
                    data_line_array ~= line;
                }
                else
                {
                    schema_line_array ~= line;
                }
            }
        }

        AddTables( schema_line_array );
        MakeTypes();
        AddValues( data_line_array );
        MakeValues();
    }

    // ~~

    void WriteUmlSchemaFile(
        string uml_schema_file_path
        )
    {

        string
            uml_schema_file_text;

        writeln( "Writing UML schema file : ", uml_schema_file_path );

        uml_schema_file_text
            = "@startuml\n"
              ~ "skinparam shadowing false\n"
              ~ "skinparam classAttributeIconSize 0\n"
              ~ "skinparam classAttributeFontColor tomato\n"
              ~ "skinparam classFontStyle bold\n"
              ~ "skinparam classFontColor blue\n"
              ~ "skinparam classBackgroundColor lightyellow\n"
              ~ "skinparam classBorderColor cornflowerblue\n"
              ~ "skinparam arrowColor cornflowerblue\n"
              ~ "hide circle\n"
              ~ "hide methods\n"
              ~ "left to right direction\n";

        foreach ( ref table; TableArray )
        {
            uml_schema_file_text ~= "\nclass " ~ table.Name ~ " {\n";

            foreach ( ref column; table.ColumnArray )
            {
                uml_schema_file_text ~= "    " ~ column.Name ~ " : " ~ column.Type.Name ~ "\n";
            }

            uml_schema_file_text ~= "}\n";
        }

        foreach ( ref table; TableArray )
        {
            foreach ( ref column; table.ColumnArray )
            {
                if ( column.IsForeign )
                {
                    uml_schema_file_text
                        ~= "\n" ~ column.ForeignColumn.Table.Name ~ " <-- " ~ table.Name ~ " : " ~ column.Name ~ "\n";
                }
            }
        }

        uml_schema_file_text ~= "\n@enduml\n";

        uml_schema_file_path.write( uml_schema_file_text );
    }

    // ~~

    void WriteSqlSchemaFile(
        string sql_schema_file_path
        )
    {
        string
            sql_schema_file_text;
        long
            foreign_key_index;

        writeln( "Writing SQL schema file : ", sql_schema_file_path );

        sql_schema_file_text
            = "set @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;\n"
              ~ "set @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;\n"
              ~ "set @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';\n\n"
              ~ "drop schema if exists `" ~ Name ~ "`;\n\n"
              ~ "create schema if not exists `" ~ Name ~ "` default character set utf8 collate utf8_general_ci;\n\n"
              ~ "use `" ~ Name ~ "`;\n\n";

        foreach ( ref table; TableArray )
        {
            if ( table.IsStored )
            {
                sql_schema_file_text
                    ~= "drop table if exists `" ~ Name ~ "`.`" ~ table.Name ~ "`;\n\n"
                       ~ "create table if not exists `" ~ Name ~ "`.`" ~ table.Name ~ "`(\n";

                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.IsStored )
                    {
                        sql_schema_file_text
                            ~= "    `"
                               ~ column.SqlName
                               ~ "` "
                               ~ column.SqlType
                               ~ " "
                               ~ column.SqlPropertyArray.join( ' ' )
                               ~ ",\n";
                    }
                }

                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.IsStored
                         && column.IsKey )
                    {
                        sql_schema_file_text ~= "    primary key( `" ~ column.SqlName ~ "` ),\n";
                    }
                }

                foreign_key_index = 0;

                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.IsStored
                         && column.IsForeign
                         && column.ForeignColumn.IsKey
                         && column.ForeignColumn.IsStored
                         && column.ForeignColumn.Table.IsStored )
                    {
                        ++foreign_key_index;

                        sql_schema_file_text
                            ~= "    index `fk_"
                               ~ table.Name.toLower()
                               ~ "_"
                               ~ column.ForeignColumn.Table.Name.toLower()
                               ~ "_"
                               ~ foreign_key_index.to!string()
                               ~ "_idx`( `"
                               ~ column.SqlName
                               ~ "` ASC ),\n";
                    }
                }

                foreign_key_index = 0;

                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.IsStored
                         && column.IsForeign
                         && column.ForeignColumn.IsKey
                         && column.ForeignColumn.IsStored
                         && column.ForeignColumn.Table.IsStored )
                    {
                        ++foreign_key_index;

                        sql_schema_file_text
                            ~= "    constraint `fk_"
                               ~ table.Name.toLower()
                               ~ "_"
                               ~ column.ForeignColumn.Table.Name.toLower()
                               ~ "_"
                               ~ foreign_key_index.to!string()
                               ~ "`\n"
                               ~ "    foreign key( `"
                               ~ column.SqlName
                               ~ "` )\n"
                               ~ "    references `"
                               ~ Name
                               ~ "`.`"
                               ~ column.ForeignColumn.Table.Name
                               ~ "`( `"
                               ~ column.ForeignColumn.SqlName
                               ~ "` )\n"
                               ~ "        on delete set null\n"
                               ~ "        on update no action,\n";
                    }
                }

                sql_schema_file_text
                    = sql_schema_file_text[ 0 .. $ - 2 ]
                      ~ "\n    ) engine = InnoDB;\n\n";
            }
        }

        sql_schema_file_text
            ~= "set SQL_MODE=@OLD_SQL_MODE;\n"
               ~ "set FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;\n"
               ~ "set UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;\n";

        sql_schema_file_path.write( sql_schema_file_text );
    }

    // ~~

    void WriteSqlDataFile(
        string sql_data_file_path
        )
    {
        long
            column_count;
        string
            sql_data_file_text;

        writeln( "Writing SQL data file : ", sql_data_file_path );

        foreach ( ref table; TableArray )
        {
            if ( table.IsStored )
            {
                column_count = table.ColumnArray.length;

                foreach ( row_index; 0 .. table.RowCount )
                {
                    sql_data_file_text ~= "replace into `" ~ table.SchemaName ~ "`.`" ~ table.Name ~ "`\n    (\n        " ;

                    foreach ( ref column; table.ColumnArray )
                    {
                        if ( column.IsStored )
                        {
                            sql_data_file_text ~= "`" ~ column.SqlName ~ "`";

                            if ( !column.IsLastStored )
                            {
                                sql_data_file_text ~= ", ";
                            }
                        }
                    }

                    sql_data_file_text ~= "\n    )\n    values\n    (\n";

                    foreach ( ref column; table.ColumnArray )
                    {
                        if ( column.IsStored )
                        {
                            sql_data_file_text ~= "        " ~ column.ValueArray[ row_index ].GetSqlText();

                            if ( !column.IsLastStored )
                            {
                                sql_data_file_text ~= ",";
                            }

                            sql_data_file_text ~= "\n";
                        }
                    }

                    sql_data_file_text ~= "    );\n\n";
                }
            }
        }

        sql_data_file_path.write( sql_data_file_text );
    }

    // ~~

    void WriteCqlSchemaFile(
        string cql_schema_file_path
        )
    {
        string
            cql_schema_file_text,
            cluster_key,
            partition_key;

        writeln( "Writing CQL schema file : ", cql_schema_file_path );

        cql_schema_file_text
            = "drop keyspace if exists " ~ Name ~ ";\n"
              ~ "create keyspace if not exists " ~ Name ~ " with replication = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };\n";

        foreach ( ref table; TableArray )
        {
            if ( table.IsStored )
            {
                cql_schema_file_text
                    ~= "drop table if exists " ~ Name ~ "." ~ table.Name ~ ";\n"
                       ~ "create table if not exists " ~ Name ~ "." ~ table.Name ~ "(";

                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.IsStored )
                    {
                        cql_schema_file_text ~= " " ~ column.CqlName ~ " " ~ column.CqlType;

                        if ( column.IsStatic )
                        {
                            cql_schema_file_text ~= " static";
                        }

                        cql_schema_file_text ~= ",";
                    }
                }

                partition_key = "";
                cluster_key = "";

                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.IsStored )
                    {
                        if ( column.IsKey
                             || column.IsPartitioned )
                        {
                            if ( partition_key == "" )
                            {
                                partition_key = column.CqlName;
                            }
                            else
                            {
                                partition_key ~= ", " ~ column.CqlName;
                            }
                        }
                        else if ( column.IsClustered )
                        {
                            if ( cluster_key == "" )
                            {
                                cluster_key = column.CqlName;
                            }
                            else
                            {
                                cluster_key ~= ", " ~ column.CqlName;
                            }
                        }
                    }
                }

                if ( partition_key.indexOf( ',' ) >= 0 )
                {
                    partition_key = "( " ~ partition_key ~ " )";
                }

                if ( cluster_key == "" )
                {
                    cql_schema_file_text ~= " primary key( " ~ partition_key ~ " )";
                }
                else
                {
                    cql_schema_file_text ~= " primary key( " ~ partition_key ~ ", " ~ cluster_key ~ " )";
                }

                cql_schema_file_text ~= " );\n";

                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.IsStored
                         && column.IsIndexed )
                    {
                        cql_schema_file_text ~= "create index on " ~ Name ~ "." ~ table.Name ~ " ( " ~ column.Name ~ " );\n";
                    }
                }
            }
        }

        cql_schema_file_path.write( cql_schema_file_text );
    }

    // ~~

    void WriteCqlDataFile(
        string cql_data_file_path
        )
    {
        long
            column_count;
        string
            cql_data_file_text;

        writeln( "Writing CQL data file : ", cql_data_file_path );

        foreach ( ref table; TableArray )
        {
            if ( table.IsStored )
            {
                column_count = table.ColumnArray.length;

                foreach ( row_index; 0 .. table.RowCount )
                {
                    cql_data_file_text ~= "insert into " ~ table.SchemaName ~ "." ~ table.Name ~ " ( " ;

                    foreach ( ref column; table.ColumnArray )
                    {
                        if ( column.IsStored )
                        {
                            cql_data_file_text ~= "" ~ column.CqlName ~ "";

                            if ( !column.IsLastStored )
                            {
                                cql_data_file_text ~= ", ";
                            }
                        }
                    }

                    cql_data_file_text ~= " ) values (";

                    foreach ( ref column; table.ColumnArray )
                    {
                        if ( column.IsStored )
                        {
                            cql_data_file_text ~= " " ~ column.ValueArray[ row_index ].GetCqlText();

                            if ( !column.IsLastStored )
                            {
                                cql_data_file_text ~= ",";
                            }
                        }
                    }

                    cql_data_file_text ~= " );\n";
                }
            }
        }

        cql_data_file_path.write( cql_data_file_text );
    }

    // ~~

    void WriteGoTypeFile(
        string go_type_file_path
        )
    {
        string
            go_attribute_declaration,
            go_type_declaration,
            go_type_file_text;
        string[]
            go_type_text_array;

        writeln( "Writing Go type file : ", go_type_file_path );

        go_type_file_text = "";

        foreach ( table_index, ref table; TableArray )
        {
            go_type_declaration = "type " ~ table.GoType ~ " struct";
            go_attribute_declaration = "";

            foreach ( ref column; table.ColumnArray )
            {
                go_attribute_declaration ~= "    " ~ column.GoName ~ " " ~ column.GoType;

                if ( column.IsStored )
                {
                    if ( SqlOptionIsEnabled )
                    {
                        go_attribute_declaration ~= "    `db:\"" ~ column.StoredName ~ "\"`";
                    }
                    else
                    {
                        go_attribute_declaration ~= "    `db:\"-\"`";
                    }
                }

                go_attribute_declaration ~= ";\n";
            }

            table.GoTypeDeclaration = go_type_declaration;
            table.GoAttributeDeclaration = go_attribute_declaration;

            go_type_file_text ~= go_type_declaration ~ " {\n" ~ go_attribute_declaration ~ "}\n";

            if ( table_index + 1 < TableArray.length )
            {
                go_type_file_text ~= "\n// ~~\n\n";
            }
        }

        go_type_file_path.write( go_type_file_text );
    }

    // ~~

    void WriteGenerisTypeFile(
        string generis_type_file_path
        )
    {
        string
            generis_attribute_declaration,
            generis_type_declaration,
            generis_type_file_text;
        string[]
            generis_type_text_array;

        writeln( "Writing Generis type file : ", generis_type_file_path );

        generis_type_file_text = "";

        foreach ( table_index, ref table; TableArray )
        {
            generis_type_declaration = "type " ~ table.GoType ~ " struct";
            generis_attribute_declaration = "";

            foreach ( ref column; table.ColumnArray )
            {
                generis_attribute_declaration ~= "    " ~ column.GoName ~ " " ~ column.GoType;

                if ( column.IsStored )
                {
                    if ( SqlOptionIsEnabled )
                    {
                        generis_attribute_declaration ~= "    `db:\"" ~ column.StoredName ~ "\"`";
                    }
                    else
                    {
                        generis_attribute_declaration ~= "    `db:\"-\"`";
                    }
                }

                generis_attribute_declaration ~= ";\n";
            }

            table.GenerisTypeDeclaration = generis_type_declaration;
            table.GenerisAttributeDeclaration = generis_attribute_declaration;

            generis_type_file_text ~= generis_type_declaration ~ "\n{\n" ~ generis_attribute_declaration ~ "}\n";

            if ( table_index + 1 < TableArray.length )
            {
                generis_type_file_text ~= "\n// ~~\n\n";
            }
        }

        generis_type_file_path.write( generis_type_file_text );
    }

    // ~~

    void WriteGenerisQueryFile(
        string generis_query_file_path
        )
    {
        string
            generis_query_file_text;

        writeln( "Writing Generis query file : ", generis_query_file_path );

        generis_query_file_text = "";

        foreach ( table_index, ref table; TableArray )
        {
            if ( table.IsStored )
            {
                generis_query_file_text
                    ~= table.GetAddDatabaseGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetSetDatabaseGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetRemoveDatabaseGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetGetDatabaseGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetGetDatabaseArrayGenerisCode();

                if ( table_index + 1 < TableArray.length )
                {
                    generis_query_file_text ~= "\n// ~~\n\n";
                }
            }
        }

        generis_query_file_path.write( generis_query_file_text );
    }

    // ~~

    void WriteGenerisResponseFile(
        string generis_response_file_path
        )
    {
        string
            generis_response_file_text;

        writeln( "Writing Generis response file : ", generis_response_file_path );

        generis_response_file_text = "";

        foreach ( table_index, ref table; TableArray )
        {
            if ( table.IsStored )
            {
                generis_response_file_text
                    ~= table.GetWriteResponseGenerisCode();

                if ( table_index + 1 < TableArray.length )
                {
                    generis_response_file_text ~= "\n// ~~\n\n";
                }
            }
        }

        generis_response_file_path.write( generis_response_file_text );
    }

    // ~~

    void WriteGenerisRequestFile(
        string generis_request_file_path
        )
    {
        string
            generis_request_file_text;

        writeln( "Writing Generis request file : ", generis_request_file_path );

        generis_request_file_text = "";

        foreach ( table_index, ref table; TableArray )
        {
            if ( table.IsStored )
            {
                generis_request_file_text
                    ~= table.GetHandleAddRequestGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetHandleSetRequestGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetHandleRemoveRequestGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetHandleGetRequestGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetHandleGetArrayRequestGenerisCode();

                if ( table_index + 1 < TableArray.length )
                {
                    generis_request_file_text ~= "\n// ~~\n\n";
                }
            }
        }

        generis_request_file_path.write( generis_request_file_text );
    }

    // ~~

    void WriteGenerisRouteFile(
        string generis_route_file_path
        )
    {
        string
            generis_route_file_text;

        writeln( "Writing Generis route file : ", generis_route_file_path );

        generis_route_file_text
            = "func RouteDatabaseRequests(\n"
              ~ "    router Router\n"
              ~ "    )\n"
              ~ "{\n";

        foreach ( table_index, ref table; TableArray )
        {
            if ( table.IsStored )
            {
                generis_route_file_text
                    ~= table.GetRouteRequestGenerisCode();

                if ( table_index + 1 < TableArray.length )
                {
                    generis_route_file_text ~= "\n";
                }
            }
        }

        generis_route_file_text ~= "}\n";

        generis_route_file_path.write( generis_route_file_text );
    }

    // ~~

    void WriteCrystalTypeFile(
        string crystal_type_file_path
        )
    {
        string
            crystal_attribute_declaration,
            crystal_type_declaration,
            crystal_type_file_text;
        string[]
            crystal_type_text_array;

        writeln( "Writing Crystal type file : ", crystal_type_file_path );

        crystal_type_file_text = "";

        foreach ( table_index, ref table; TableArray )
        {
            crystal_type_declaration = "class " ~ table.CrystalType;
            crystal_attribute_declaration = "";

            foreach ( ref column; table.ColumnArray )
            {
                crystal_attribute_declaration ~= "    @" ~ column.CrystalName ~ " : " ~ column.CrystalType ~ "\n";
            }

            table.CrystalTypeDeclaration = crystal_type_declaration;
            table.CrystalAttributeDeclaration = crystal_attribute_declaration;

            crystal_type_file_text ~= crystal_type_declaration ~ "\n" ~ crystal_attribute_declaration ~ "end\n";

            if ( table_index + 1 < TableArray.length )
            {
                crystal_type_file_text ~= "\n# ~~\n\n";
            }
        }

        crystal_type_file_path.write( crystal_type_file_text );
    }

    // ~~

    void WriteCsharpTypeFile(
        string csharp_type_file_path
        )
    {
        string
            csharp_attribute_declaration,
            csharp_type,
            csharp_type_declaration,
            csharp_type_file_text;
        string[]
            csharp_type_text_array;

        writeln( "Writing C# type file : ", csharp_type_file_path );

        csharp_type_file_text = "";

        foreach ( table_index, ref table; TableArray )
        {
            csharp_type_declaration = "public class " ~ table.CsharpType;
            csharp_attribute_declaration = "";
            csharp_type = "";

            foreach ( column_index, ref column; table.ColumnArray )
            {
                if ( column.CsharpType == csharp_type )
                {
                    csharp_attribute_declaration = csharp_attribute_declaration[ 0 .. $ - 2 ] ~ ",\n";
                }
                else
                {
                    csharp_type = column.CsharpType;
                    csharp_attribute_declaration ~= "    public " ~ column.CsharpType ~ "\n";
                }

                csharp_attribute_declaration ~= "        " ~ column.CsharpName ~ ";\n";
            }

            table.CsharpTypeDeclaration = csharp_type_declaration;
            table.CsharpAttributeDeclaration = csharp_attribute_declaration;

            csharp_type_file_text ~= csharp_type_declaration ~ "\n{\n" ~ csharp_attribute_declaration ~ "}\n";

            if ( table_index + 1 < TableArray.length )
            {
                csharp_type_file_text ~= "\n// ~~\n\n";
            }
        }

        csharp_type_file_path.write( csharp_type_file_text );
    }

    // ~~

    void WriteRustTypeFile(
        string rust_type_file_path
        )
    {
        string
            rust_attribute_declaration,
            rust_type_declaration,
            rust_type_file_text;
        string[]
            rust_type_text_array;

        writeln( "Writing Rust type file : ", rust_type_file_path );

        rust_type_file_text = "";

        foreach ( table_index, ref table; TableArray )
        {
            rust_type_declaration = "struct " ~ table.RustType;
            rust_attribute_declaration = "";

            foreach ( column_index, ref column; table.ColumnArray )
            {
                rust_attribute_declaration
                    ~= "    "
                       ~ column.RustName
                       ~ " : "
                       ~ column.RustType;

                if ( column_index + 1 < table.ColumnArray.length )
                {
                    rust_attribute_declaration ~= ",";
                }

                rust_attribute_declaration ~= "\n";
            }

            table.RustTypeDeclaration = rust_type_declaration;
            table.RustAttributeDeclaration = rust_attribute_declaration;

            rust_type_file_text ~= rust_type_declaration ~ "\n{\n" ~ rust_attribute_declaration ~ "}\n";

            if ( table_index + 1 < TableArray.length )
            {
                rust_type_file_text ~= "\n// ~~\n\n";
            }
        }

        rust_type_file_path.write( rust_type_file_text );
    }

    // ~~

    void WriteJavascriptTypeFile(
        string javascript_type_file_path
        )
    {
        string
            javascript_attribute_declaration,
            javascript_type_declaration,
            javascript_type_file_text;
        string[]
            javascript_type_text_array;

        writeln( "Writing Javascript type file : ", javascript_type_file_path );

        javascript_type_file_text = "";

        foreach ( table_index, ref table; TableArray )
        {
            javascript_type_declaration = "class " ~ table.JavascriptType;

            javascript_attribute_declaration
                = "    constructor(\n"
                  ~ "        )\n"
                  ~ "    {\n";

            foreach ( ref column; table.ColumnArray )
            {
                javascript_attribute_declaration
                    ~= "        this." ~ column.JavascriptName ~ " = null;\n";
            }

            javascript_attribute_declaration
                    ~= "    }\n";

            table.JavascriptTypeDeclaration = javascript_type_declaration;
            table.JavascriptAttributeDeclaration = javascript_attribute_declaration;

            javascript_type_file_text ~= javascript_type_declaration ~ "\n{\n" ~ javascript_attribute_declaration ~ "}\n";

            if ( table_index + 1 < TableArray.length )
            {
                javascript_type_file_text ~= "\n// ~~\n\n";
            }
        }

        javascript_type_file_path.write( javascript_type_file_text );
    }
}

// -- VARIABLES

bool
    CqlOptionIsEnabled,
    SqlOptionIsEnabled;
string
    DatabaseFormat;
string[]
    OutputFormatArray,
    TemplateFilePathArray;
RANDOM
    Random;
SCHEMA
    Schema;

// -- FUNCTIONS

void PrintError(
    string message
    )
{
    writeln( "*** ERROR : ", message );
}

// ~~

void Abort(
    string message
    )
{
    PrintError( message );

    exit( -1 );
}

// ~~

bool IsVowelCharacter(
    char character
    )
{
    return "aeiouy".indexOf( character ) >= 0;
}

// ~~

bool IsConsonantCharacter(
    char character
    )
{
    return "bcdfghjklmnpqrstvwx".indexOf( character ) >= 0;
}

// ~~

bool StartsByVowel(
    string text
    )
{
    return
        text != ""
        && IsVowelCharacter( text[ 0 ] );
}

// ~~

bool StartsByConsonant(
    string text
    )
{
    return
        text != ""
        && IsConsonantCharacter( text[ 0 ] );
}

// ~~

bool EndsByVowel(
    string text
    )
{
    return
        text != ""
        && IsVowelCharacter( text[ $ - 1 ] );
}

// ~~

bool EndsByConsonant(
    string text
    )
{
    return
        text != ""
        && IsConsonantCharacter( text[ $ - 1 ] );
}

// ~~

string GetStrippedText(
    string text
    )
{
    while ( text.length > 0
            && text[ 0 ] == ' ' )
    {
        text = text[ 1 .. $ ];
    }

    while ( text.length > 0
            && text[ $ - 1 ] == ' ' )
    {
        text = text[ 0 .. $ - 1 ];
    }

    return text;
}

// ~~

string GetCapitalizedText(
    string text
    )
{
    return text[ 0 .. 1 ].toUpper() ~ text[ 1 .. $ ].toLower();
}

// ~~

string GetPascalCaseText(
    string text
    )
{
    long
        word_index;
    string[]
        word_array;

    word_array = text.split( '_' );

    foreach ( ref word; word_array )
    {
        word = word.GetCapitalizedText();
    }

    return word_array.join( "" );
}

// ~~

string GetSnakeCaseText(
    string text
    )
{
    char
        prior_character;
    string
        snake_case_text;

    snake_case_text = "";
    prior_character = 0;

    foreach ( char character; text )
    {
        if ( ( prior_character.isLower()
               || prior_character.isDigit() )
             && character.isUpper() )
        {
            snake_case_text ~= '_';
        }

        snake_case_text ~= character;
        prior_character = character;
    }

    return snake_case_text.toLower();
}

// ~~

string GetExecutablePath(
    string file_name
    )
{
    return dirName( thisExePath() ) ~ "/" ~ file_name;
}

// ~~

string InsertCharacter(
    string text,
    char character
    )
{
    long
        character_index;

    character_index = Random.MakeInteger( 0, text.length );

    if ( character_index == 0 )
    {
        return character ~ text;
    }
    else if ( character_index == text.length )
    {
        return text ~ character;
    }
    else
    {
        return text[ 0 .. character_index ] ~ character ~ text[ character_index .. $ ];
    }
}

// ~~

string[] GetSplitText(
    string text,
    string opening_tag,
    string closing_tag
    )
{
    string[]
        opening_part_array,
        part_array,
        closing_part_array;

    opening_part_array = text.split( opening_tag );

    foreach ( opening_part_index, opening_part; opening_part_array )
    {
        if ( opening_part_index == 0 )
        {
            part_array ~= opening_part;
        }
        else
        {
            closing_part_array = opening_part.split( closing_tag );

            if ( closing_part_array.length != 2 )
            {
                Abort( "Invalid " ~ opening_tag ~ " " ~ closing_tag ~ " block : " ~ opening_part );
            }

            part_array ~= closing_part_array[ 0 ];
            part_array ~= closing_part_array[ 1 ];
        }
    }

    return part_array;
}

// ~~

string ReplaceColumnTags(
    string template_text,
    string opening_tag,
    string closing_tag,
    TABLE table
    )
{
    string
        instance_part;
    string[]
        template_part_array;
    COLUMN[]
        column_array;

    template_part_array = template_text.GetSplitText( opening_tag, closing_tag );

    foreach ( template_part_index, ref template_part; template_part_array )
    {
        if ( ( template_part_index & 1 ) == 1 )
        {
            instance_part = "";

            column_array = null;

            foreach ( column; table.ColumnArray )
            {
                if ( opening_tag.startsWith( "<*" )
                     || ( opening_tag.startsWith( "<#" )
                          && column.IsKey )
                     || ( opening_tag.startsWith( "<~" )
                          && !column.IsKey )
                     || ( opening_tag.startsWith( "<." )
                          && column.IsStored )
                     || ( opening_tag.startsWith( "<!" )
                          && !column.IsStored ) )
                {
                    column_array ~= column;
                }
            }

            if ( column_array.length > 0
                 && opening_tag.endsWith( '^' ) )
            {
                column_array = column_array[ 0 .. $ - 1 ];
            }

            if ( column_array.length > 0
                 && opening_tag.endsWith( '$' ) )
            {
                column_array = column_array[ $ - 1 .. $ ];
            }

            foreach ( column; column_array )
            {
                instance_part ~= column.ReplaceTags( template_part );
            }

            template_part = instance_part;
        }
    }

    return template_part_array.join( "" );
}

// ~~

string ReplaceTableTags(
    string template_text,
    string opening_tag,
    string closing_tag,
    TABLE[] table_array
    )
{
    string
        instance_part;
    string[]
        template_part_array;

    template_part_array = template_text.GetSplitText( opening_tag, closing_tag );

    foreach ( template_part_index, ref template_part; template_part_array )
    {
        if ( ( template_part_index & 1 ) == 1 )
        {
            instance_part = "";

            foreach ( table; table_array )
            {
                if ( opening_tag == "[*"
                     || ( opening_tag == "[."
                          && table.IsStored )
                     || ( opening_tag == "[!"
                          && !table.IsStored ) )
                {
                    instance_part
                        ~= table.ReplaceTags( template_part )
                               .ReplaceColumnTags( "<*^", "^*>", table )
                               .ReplaceColumnTags( "<*$", "$*>", table )
                               .ReplaceColumnTags( "<*", "*>", table )
                               .ReplaceColumnTags( "<#^", "^#>", table )
                               .ReplaceColumnTags( "<#$", "$#>", table )
                               .ReplaceColumnTags( "<#", "#>", table )
                               .ReplaceColumnTags( "<~^", "^~>", table )
                               .ReplaceColumnTags( "<~$", "$~>", table )
                               .ReplaceColumnTags( "<~", "~>", table )
                               .ReplaceColumnTags( "<.^", "^.>", table )
                               .ReplaceColumnTags( "<.$", "$.>", table )
                               .ReplaceColumnTags( "<.", ".>", table )
                               .ReplaceColumnTags( "<!^", "^!>", table )
                               .ReplaceColumnTags( "<!$", "$!>", table )
                               .ReplaceColumnTags( "<!", "!>", table );
                }
            }

            template_part = instance_part;
        }
    }

    return template_part_array.join( "" );
}

// ~~

void WriteInstanceFiles(
    string instance_text
    )
{
    string
        instance_file_path;
    string[]
        instance_file_line_array,
        instance_file_text_array;

    if ( !instance_text.startsWith( "##" ) )
    {
        Abort( "Missing instance file path : " ~ instance_text );
    }

    instance_file_text_array = instance_text[ 2 .. $ ].split( "\n##" );

    foreach ( instance_file_text_index, instance_file_text; instance_file_text_array )
    {
        if ( instance_file_text_index + 1 < instance_file_text_array.length )
        {
            instance_file_text ~= '\n';
        }

        instance_file_line_array = instance_file_text.split( '\n' );

        if ( instance_file_line_array.length == 0 )
        {
            Abort( "Missing instance file path : " ~ instance_file_text );
        }

        instance_file_path = instance_file_line_array[ 0 ];
        instance_file_text = instance_file_line_array[ 1 .. $ ].join( '\n' );

        writeln( "Writing instance file : " ~ instance_file_path );

        instance_file_path.write( instance_file_text );
    }
}

// ~~

void WriteInstanceFiles(
    SCHEMA schema
    )
{
    string
        instance_file_text,
        template_file_text;

    foreach ( template_file_path; TemplateFilePathArray )
    {
        writeln( "Reading template file : ", template_file_path );

        template_file_text = template_file_path.readText().replace( "\r", "" );

        instance_file_text
            = template_file_text
                  .ReplaceTableTags( "[*", "*]", schema.TableArray )
                  .ReplaceTableTags( "[.", ".]", schema.TableArray )
                  .ReplaceTableTags( "[!", "!]", schema.TableArray );

        WriteInstanceFiles( instance_file_text );
    }
}

// ~~

void ProcessFile(
    string basil_file_path
    )
{
    string
        base_file_path;

    base_file_path = basil_file_path[ 0 .. $ - 4 ];

    Random = new RANDOM();

    Schema = new SCHEMA();
    Schema.ReadBasilFile( basil_file_path );

    foreach ( output_format; OutputFormatArray )
    {
        if ( output_format == "uml" )
        {
            Schema.WriteUmlSchemaFile( base_file_path ~ ".uml" );
        }
        else if ( output_format == "sql" )
        {
            Schema.WriteSqlSchemaFile( base_file_path ~ ".sql" );
            Schema.WriteSqlDataFile( base_file_path ~ "_data.sql" );
        }
        else if ( output_format == "cql" )
        {
            Schema.WriteCqlSchemaFile( base_file_path ~ ".cql" );
            Schema.WriteCqlDataFile( base_file_path ~ "_data.cql" );
        }
        else if ( output_format == "go" )
        {
            Schema.WriteGoTypeFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_type.go" );
        }
        else if ( output_format == "generis" )
        {
            Schema.WriteGenerisTypeFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_type.gs" );
            Schema.WriteGenerisQueryFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_query.gs" );
            Schema.WriteGenerisResponseFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_response.gs" );
            Schema.WriteGenerisRequestFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_request.gs" );
            Schema.WriteGenerisRouteFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_route.gs" );
        }
        else if ( output_format == "crystal" )
        {
            Schema.WriteCrystalTypeFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_type.cr" );
        }
        else if ( output_format == "csharp" )
        {
            Schema.WriteCsharpTypeFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_type.cs" );
        }
        else if ( output_format == "rust" )
        {
            Schema.WriteRustTypeFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_type.rs" );
        }
        else if ( output_format == "javascript" )
        {
            Schema.WriteJavascriptTypeFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_type.js" );
        }
    }

    Schema.WriteInstanceFiles();
}

// ~~

void main(
    string[] argument_array
    )
{
    string
        option;

    argument_array = argument_array[ 1 .. $ ];

    SqlOptionIsEnabled = false;
    CqlOptionIsEnabled = false;
    OutputFormatArray = null;
    DatabaseFormat = "";
    TemplateFilePathArray = null;

    while ( argument_array.length >= 1
            && argument_array[ 0 ].startsWith( "--" ) )
    {
        option = argument_array[ 0 ];

        argument_array = argument_array[ 1 .. $ ];

        if ( option == "--uml" )
        {
            OutputFormatArray ~= "uml";
        }
        else if ( option == "--sql"
                  && DatabaseFormat == "" )
        {
            SqlOptionIsEnabled = true;

            OutputFormatArray ~= "sql";
            DatabaseFormat = "sql";
        }
        else if ( option == "--cql"
                  && DatabaseFormat == "" )
        {
            CqlOptionIsEnabled = true;

            OutputFormatArray ~= "cql";
            DatabaseFormat = "cql";
        }
        else if ( option == "--go"
                  && DatabaseFormat != "" )
        {
            OutputFormatArray ~= "go";
        }
        else if ( option == "--generis"
                  && DatabaseFormat != "" )
        {
            OutputFormatArray ~= "generis";
        }
        else if ( option == "--crystal"
                  && DatabaseFormat != "" )
        {
            OutputFormatArray ~= "crystal";
        }
        else if ( option == "--csharp"
                  && DatabaseFormat != "" )
        {
            OutputFormatArray ~= "csharp";
        }
        else if ( option == "--rust"
                  && DatabaseFormat != "" )
        {
            OutputFormatArray ~= "rust";
        }
        else if ( option == "--javascript"
                  && DatabaseFormat != "" )
        {
            OutputFormatArray ~= "javascript";
        }
        else if ( option == "--template"
                  && argument_array.length >= 1 )
        {
            TemplateFilePathArray ~= argument_array[ 0 ];

            argument_array = argument_array[ 1 .. $ ];
        }
        else
        {
            Abort( "Invalid option : " ~ option );
        }
    }

    if ( argument_array.length >= 1
         && argument_array[ 0 ].endsWith( ".bsl" ) )
    {
        ProcessFile( argument_array[ 0 ] );
    }
    else
    {
        writeln( "Usage :" );
        writeln( "    basil [options] script_file.bsl" );
        writeln( "Options :" );
        writeln( "    --uml" );
        writeln( "    --sql" );
        writeln( "    --cql" );
        writeln( "    --go" );
        writeln( "    --generis" );
        writeln( "    --crystal" );
        writeln( "    --csharp" );
        writeln( "    --rust" );
        writeln( "    --javascript" );
        writeln( "    --template {template_file_path}" );
        writeln( "Examples :" );
        writeln( "    basil --uml script_file.bsl" );
        writeln( "    basil --uml --sql --go script_file.bsl" );

        Abort( "Invalid arguments : " ~ argument_array.to!string() );
    }
}
