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
    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
*/

// == LOCAL

// -- IMPORTS

import core.stdc.stdlib : exit;
import std.algorithm : countUntil;
import std.conv : to;
import std.file : dirEntries, readText, thisExePath, write, SpanMode;
import std.random : uniform;
import std.path : dirName;
import std.regex : regex, replaceAll, Regex;
import std.stdio : writeln;
import std.string : endsWith, format, indexOf, join, lineSplitter, replace, startsWith, split, strip, toLower, toUpper;

// == GLOBAL

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
    return text.replaceAll( regex( `([a-z0-9])([A-Z])` ), "$1_$2" );
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

// -- TYPES

class LINK
{
    string
        Word;
    long
        VertexIndex;
    bool
        ItIsFinal;

    // ~~

    this(
        string word,
        long vertex_index,
        bool it_is_final
        )
    {
        Word = word;
        VertexIndex = vertex_index;
        ItIsFinal = it_is_final;
    }
}

// ~~

class VERTEX
{
    string
        Word;
    bool
        ItIsInitial;
    LINK[]
        LinkArray;

    // ~~

    this(
        string word
        )
    {
        Word = word;
        ItIsInitial = false;
        LinkArray = [];
    }
}

// ~~

class RANDOM
{
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

    // ~~

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

    // ~~

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
            foreach ( name; name_array )
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
                    link.ItIsFinal = true;
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

        VertexArray = [];
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
                    vertex.ItIsInitial = true;
                }

                if ( prior_vertex !is null )
                {
                    it_is_final = ( word_index == word_array.length - 1 );

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
        return MakeInteger( 0, array.length - 1 );
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
            while ( !vertex.ItIsInitial );

            word_array = [];
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
                vertex_is_final = link.ItIsFinal;
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

class VALUE
{
    string
        Text;
    VALUE[]
        ValueArray;

    // ~~

    this(
        )
    {
    }

    // ~~

    this(
        string text
        )
    {
        Text = text;
    }
}

// ~~

class COLUMN
{
    string
        Name,
        Type;
    bool
        ItIsStored,
        ItIsLastStored,
        ItIsKey,
        ItIsRequired,
        ItIsIncremented,
        ItIsForeign,
        ItIsList;
    long
        Capacity;
    bool
        ItIsRandomReal;
    double
        MinimumRandomReal,
        MaximumRandomReal;
    bool
        ItIsRandomInteger;
    long
        MinimumRandomInteger,
        MaximumRandomInteger;
    bool
        ItIsRandomNatural;
    ulong
        MinimumRandomNatural,
        MaximumRandomNatural;
    long
        MinimumRandomCount,
        MaximumRandomCount;
    bool
        ItIsRandomName,
        ItIsRandomFirstName,
        ItIsRandomLastName,
        ItIsRandomFullName,
        ItIsRandomEnglish,
        ItIsRandomLatin;
    bool
        ItIsLowercase,
        ItIsUppercase;
    VALUE[]
        ValueArray;
    TABLE
        ForeignTable;
    COLUMN
        ForeignColumn;
    string
        SqlName,
        SqlType;
    string[]
        SqlPropertyArray;
    string
        AqlName,
        AqlType,
        GoName,
        GoType;

    // ~~

    this(
        string name,
        string type
        )
    {
        Name = name;
        Type = type;
        ItIsStored = true;
        ItIsLastStored = false;
        ItIsKey = false;
        ItIsRequired = false;
        ItIsIncremented = false;
        ItIsForeign = false;
        ItIsList = false;
        Capacity = 0;
        ItIsRandomReal = false;
        MinimumRandomReal = 0.0;
        MaximumRandomReal = 0.0;
        ItIsRandomInteger = false;
        MinimumRandomInteger = 0;
        MaximumRandomInteger = 0;
        ItIsRandomNatural = false;
        MinimumRandomNatural = 0;
        MaximumRandomNatural = 0;
        MinimumRandomCount = 5;
        MaximumRandomCount = 10;
        ItIsRandomName = false;
        ItIsRandomFirstName = false;
        ItIsRandomLastName = false;
        ItIsRandomFullName = false;
        ItIsRandomEnglish = false;
        ItIsRandomLatin = false;
        ItIsLowercase = false;
        ItIsUppercase = false;
    }

    // ~~

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
                    ItIsStored = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "key" )
                {
                    ItIsKey = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "required" )
                {
                    ItIsRequired = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "incremented" )
                {
                    ItIsIncremented = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "capacity" )
                {
                    Capacity = value_text_array[ 1 ].to!long();
                }
                else if ( property_name == "aqlname" )
                {
                    AqlName = value_text_array[ 1 ];
                }
                else if ( property_name == "sqlname" )
                {
                    SqlName = value_text_array[ 1 ];
                }
                else if ( property_name == "goname" )
                {
                    GoName = value_text_array[ 1 ];
                }
                else if ( property_name == "firstname" )
                {
                    ItIsRandomFirstName = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "lastname" )
                {
                    ItIsRandomLastName = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "fullname" )
                {
                    ItIsRandomFullName = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "lowercase" )
                {
                    ItIsLowercase = ( value_text_array[ 1 ] != "0" );
                }
                else if ( property_name == "uppercase" )
                {
                    ItIsUppercase = ( value_text_array[ 1 ] != "0" );
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
                    ItIsRandomReal = true;
                    MinimumRandomReal = value_text_array[ 1 ].to!double();
                    MaximumRandomReal = value_text_array[ 2 ].to!double();
                }
                else if ( property_name == "integer" )
                {
                    ItIsRandomInteger = true;
                    MinimumRandomInteger = value_text_array[ 1 ].to!long();
                    MaximumRandomInteger = value_text_array[ 2 ].to!long();
                }
                else if ( property_name == "natural" )
                {
                    ItIsRandomNatural = true;
                    MinimumRandomNatural = value_text_array[ 1 ].to!ulong();
                    MaximumRandomNatural = value_text_array[ 2 ].to!ulong();
                    MinimumRandomCount = 0;
                }
                else if ( property_name == "name" )
                {
                    ItIsRandomName = true;
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
                    ItIsRandomNatural = true;
                    MinimumRandomNatural = value_text_array[ 1 ].to!ulong();
                    MaximumRandomNatural = value_text_array[ 2 ].to!ulong();
                    MinimumRandomCount = value_text_array[ 3 ].to!long();
                }
            }
            else if ( value_text_array.length == 5 )
            {
                if ( property_name == "english" )
                {
                    ItIsRandomEnglish = true;
                    MinimumRandomCount = value_text_array[ 1 ].to!long();
                    MaximumRandomCount = value_text_array[ 2 ].to!long();
                    MinimumRandomInteger = value_text_array[ 3 ].to!long();
                    MaximumRandomInteger = value_text_array[ 4 ].to!long();
                }
                else if ( property_name == "latin" )
                {
                    ItIsRandomLatin = true;
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

    void MakeType(
        )
    {
        if ( SqlName == "" )
        {
            SqlName = Name;
        }

        if ( AqlName == "" )
        {
            AqlName = Name;
        }

        if ( GoName == "" )
        {
            GoName = Name;
        }

        if ( SqlType == "" )
        {
            SqlType = "TEXT";
        }

        if ( AqlType == "" )
        {
            AqlType = "string";
        }

        if ( GoType == "" )
        {
            GoType = "string";
        }

        if ( Type == "STRING" )
        {
            if ( Capacity != 0 )
            {
                SqlType = "VARCHAR( " ~ Capacity.to!string() ~ " )";
            }
            else
            {
                SqlType = "TEXT";
            }

            AqlType = "string";
            GoType = "string";
        }
        else if ( Type == "BOOL" )
        {
            SqlType = "TINYINT UNSIGNED";
            AqlType = "int64";
            GoType = "bool";
        }
        else if ( Type == "INT8" )
        {
            SqlType = "TINYINT";
            AqlType = "int64";
            GoType = "int8";
        }
        else if ( Type == "UINT8" )
        {
            SqlType = "TINYINT UNSIGNED";
            AqlType = "int64";
            GoType = "uint8";
        }
        else if ( Type == "INT16" )
        {
            SqlType = "SMALLINT";
            AqlType = "int64";
            GoType = "int16";
        }
        else if ( Type == "UINT16" )
        {
            SqlType = "SMALLINT UNSIGNED";
            AqlType = "int64";
            GoType = "uint16";
        }
        else if ( Type == "INT32" )
        {
            SqlType = "INT";
            AqlType = "int64";
            GoType = "int32";
        }
        else if ( Type == "UINT32" )
        {
            SqlType = "INT UNSIGNED";
            AqlType = "int64";
            GoType = "uint32";
        }
        else if ( Type == "INT64" )
        {
            SqlType = "BIGINT";
            AqlType = "int64";
            GoType = "int64";
        }
        else if ( Type == "UINT64" )
        {
            SqlType = "BIGINT UNSIGNED";
            AqlType = "int64";
            GoType = "uint64";
        }
        else if ( Type == "FLOAT32" )
        {
            SqlType = "FLOAT";
            AqlType = "float64";
            GoType = "float32";
        }
        else if ( Type == "FLOAT64" )
        {
            SqlType = "DOUBLE";
            AqlType = "float64";
            GoType = "float64";
        }
        else if ( Type == "DATE" )
        {
            SqlType = "DATE";
            AqlType = "string";
            GoType = "string";
        }
        else if ( Type == "DATETIME" )
        {
            SqlType = "DATETIME";
            AqlType = "string";
            GoType = "string";
        }

        if ( ItIsKey || ItIsRequired )
        {
            SqlPropertyArray ~= "NOT NULL";
        }
        else
        {
            SqlPropertyArray ~= "NULL";
        }

        if ( ItIsIncremented )
        {
            SqlPropertyArray ~= "AUTO_INCREMENT";
        }
    }

    // ~~

    void MakeForeignType(
        )
    {
        if ( !ItIsList )
        {
            SqlType = ForeignColumn.SqlType;
            AqlType = ForeignColumn.AqlType;
            GoType = ForeignColumn.GoType;
        }
    }

    // ~~

    VALUE MakeValue(
        TABLE table,
        long row_index,
        long row_count
        )
    {
        long
            prior_row_index;
        ulong
            random_natural;
        VALUE
            value;

        value = new VALUE;

        if ( ItIsRandomReal )
        {
            value.Text = Random.MakeReal( MinimumRandomReal, MaximumRandomReal ).to!string();
        }
        if ( ItIsRandomInteger )
        {
            value.Text = Random.MakeInteger( MinimumRandomInteger, MaximumRandomInteger ).to!string();
        }
        if ( ItIsRandomNatural )
        {
            value.Text = Random.MakeNatural( MinimumRandomNatural, MaximumRandomNatural, MinimumRandomCount ).to!string();
        }
        else if ( ItIsRandomName )
        {
            value.Text = Random.MakeName( MinimumRandomCount, MaximumRandomCount );
        }
        else if ( ItIsRandomFirstName )
        {
            value.Text = Random.MakeFirstName();
        }
        else if ( ItIsRandomLastName )
        {
            value.Text = Random.MakeLastName();
        }
        else if ( ItIsRandomFullName )
        {
            value.Text
                = Random.MakeFirstName()
                  ~ " "
                  ~ Random.MakeLastName();
        }
        else if ( ItIsRandomEnglish )
        {
            value.Text = Random.MakeText( "english", MinimumRandomCount, MaximumRandomCount, MinimumRandomInteger, MaximumRandomInteger );
        }
        else if ( ItIsRandomLatin )
        {
            value.Text = Random.MakeText( "latin", MinimumRandomCount, MaximumRandomCount, MinimumRandomInteger, MaximumRandomInteger );
        }
        else if ( Type == "STRING" )
        {
            if ( Name.endsWith( "Title" ) )
            {
                value.Text = Random.MakeSentence( "english", 4, 8 ).GetCapitalizedText() ~ ".";

                table.PriorTitle = value.Text;
            }
            else if ( Name.endsWith( "Slug" ) )
            {
                if ( table.PriorTitle != "" )
                {
                    value.Text = table.PriorTitle;
                }
                else if ( table.PriorName != "" )
                {
                    value.Text = table.PriorName;
                }
                else
                {
                    value.Text = Random.MakeName( 6, 12 );
                }

                value.Text
                    = value.Text
                           .toLower()
                           .replace( " ", "-" )
                           .replace( "\"", "-" )
                           .replace( ".", "" );
            }
            else if ( Name.endsWith( "Text" ) )
            {
                value.Text = Random.MakeText( "english", 5, 10 );
            }
            else if ( Name.endsWith( "FirstName" ) )
            {
                value.Text = Random.MakeFirstName();

                table.PriorFirstName = value.Text;
            }
            else if ( Name.endsWith( "LastName" ) )
            {
                value.Text = Random.MakeLastName();

                table.PriorLastName = value.Text;
            }
            else if ( Name.endsWith( "Name" ) )
            {
                value.Text = Random.MakeLastName();

                table.PriorName = value.Text;
            }
            else if ( Name.endsWith( "Login" )
                      || Name.endsWith( "Pseudonym" ) )
            {
                value.Text
                    = ( ( table.PriorFirstName != "" ) ? table.PriorFirstName : Random.MakeFirstName() ).toLower()
                      ~ ( ( table.PriorLastName != "" ) ? table.PriorLastName : Random.MakeLastName() ).toLower();
            }
            else if ( Name.endsWith( "Password" ) )
            {
                value.Text
                    = Random.MakeName( 4, 8 )
                            .InsertCharacter( Random.MakeUppercaseLetter() )
                            .InsertCharacter( Random.MakeDigit() )
                            .InsertCharacter( Random.MakeSeparator() );
            }
            else if ( Name.endsWith( "Email" ) )
            {
                value.Text
                    = ( ( table.PriorFirstName != "" ) ? table.PriorFirstName : Random.MakeFirstName() ).toLower()
                      ~ "."
                      ~ ( ( table.PriorLastName != "" ) ? table.PriorLastName : Random.MakeLastName() ).toLower()
                      ~ [
                          "@gmail.com",
                          "@yahoo.com",
                          "@outlook.com",
                          "@live.com",
                          "@hotmail.com",
                          "@mail.com"
                        ][ Random.MakeIndex( 6 ) ];
            }
            else if ( Name.endsWith( "Phone" ) )
            {
                value.Text
                    = "+"
                      ~ Random.MakeInteger( 10, 99 ).to!string()
                      ~ " "
                      ~ Random.MakeInteger( 100, 999 ).to!string()
                      ~ " "
                      ~ Random.MakeInteger( 100, 999 ).to!string()
                      ~ " "
                      ~ Random.MakeInteger( 100, 999 ).to!string();
            }
            else if ( Name.endsWith( "Street" )
                      || Name.endsWith( "Address" ) )
            {
                value.Text
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
            else if ( Name.endsWith( "Code" ) )
            {
                value.Text = Random.MakeInteger( 1000, 9999 ).to!string();
            }
            else if ( Name.endsWith( "City" ) )
            {
                value.Text = Random.MakeCityName();
            }
            else if ( Name.endsWith( "Region" ) )
            {
                value.Text = Random.MakeRegionName();
            }
            else if ( Name.endsWith( "Country" ) )
            {
                value.Text = Random.MakeCountryName();
            }
            else if ( Name.endsWith( "Company" ) )
            {
                value.Text
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
            else if ( Name.endsWith( "Image" ) )
            {
                value.Text
                    = Random.MakeName( 8, 8 )
                      ~ [
                          ".jpg",
                          ".png",
                          ".gif"
                        ][ Random.MakeIndex( 3 ) ];
            }
            else if ( Name.endsWith( "File" ) )
            {
                value.Text
                    = Random.MakeName( 8, 8 )
                      ~ [
                          ".pdf",
                          ".doc",
                          ".odt"
                        ][ Random.MakeIndex( 3 ) ];
            }
            else if ( Name.endsWith( "Folder" ) )
            {
                value.Text = Random.MakeName( 8, 8 ) ~ "/";
            }
            else if ( Name.endsWith( "Author" ) )
            {
                value.Text
                    = Random.MakeFirstName()
                      ~ " "
                      ~ Random.MakeLastName();
            }
            else if ( Name.endsWith( "Isbn" ) )
            {
                value.Text
                    = Random.MakeInteger( 100, 999 ).to!string()
                      ~ "-"
                      ~ Random.MakeInteger( 1000000000, 9999999999 ).to!string();
            }
            else if ( Name.endsWith( "Tags" ) )
            {
                value.Text = Random.MakeEnglishSentence( 5, 10 ).replace( " ", ", " );
            }
            else
            {
                value.Text = GetCapitalizedText( Random.MakeName( 6, 12 ) );
            }
        }
        else if ( Type == "BOOL" )
        {
            value.Text = Random.MakeInteger( 0, 1 ).to!string();
        }
        else if ( Type == "INT8"
                  || Type == "UINT8"
                  || Type == "INT16"
                  || Type == "UINT16"
                  || Type == "INT32"
                  || Type == "UINT32"
                  || Type == "INT64"
                  || Type == "UINT64" )
        {
            if ( Name == "Id" )
            {
                if ( ItIsIncremented )
                {
                    value.Text = ( row_index + 1 ).to!string();
                }
                else
                {
                    do
                    {
                        random_natural = Random.MakeNatural();

                        if ( Type == "INT8" )
                        {
                            random_natural = random_natural & 7;
                        }
                        else if ( Type == "UINT8" )
                        {
                            random_natural = random_natural & 8;
                        }
                        else if ( Type == "INT16" )
                        {
                            random_natural = random_natural & 15;
                        }
                        else if ( Type == "UINT16" )
                        {
                            random_natural = random_natural & 16;
                        }
                        else if ( Type == "INT32" )
                        {
                            random_natural = random_natural & 31;
                        }
                        else if ( Type == "UINT32" )
                        {
                            random_natural = random_natural & 32;
                        }
                        else if ( Type == "INT64" )
                        {
                            random_natural = random_natural & 63;
                        }

                        value.Text = random_natural.to!string();

                        for ( prior_row_index = 0;
                              prior_row_index < row_index;
                              ++prior_row_index )
                        {
                            if ( ValueArray[ prior_row_index ].Text == value.Text )
                            {
                                break;
                            }
                        }
                    } while ( prior_row_index < row_index );
                }
            }
            else if ( Name.endsWith( "Year" ) )
            {
                value.Text = Random.MakeInteger( 2000, 2015 ).to!string();
            }
            else
            {
                if ( Type == "INT8"
                     || Type == "UINT8" )
                {
                    value.Text = Random.MakeInteger( 1, 100 ).to!string();
                }
                else
                {
                    value.Text = Random.MakeInteger( 1, 1000 ).to!string();
                }
            }
        }
        else if ( Type == "FLOAT32"
                  || Type == "FLOAT64" )
        {
            value.Text = ( Random.MakeInteger( 1000, 9999 ) / 100.0 ).to!string();
        }
        else if ( Type == "DATE" )
        {
            value.Text = Random.MakeDate();
        }
        else if ( Type == "DATETIME" )
        {
            value.Text = Random.MakeDate() ~ " " ~ Random.MakeTime();
        }

        if ( ItIsLowercase )
        {
            value.Text = value.Text.toLower();
        }

        if ( ItIsUppercase )
        {
            value.Text = value.Text.toUpper();
        }

        return value;
    }

    // ~~

    string GetAqlValueText(
        long row_index
        )
    {
        if ( AqlType == "string" )
        {
            return "\"" ~ ValueArray[ row_index ].Text ~ "\"";
        }
        else
        {
            return ValueArray[ row_index ].Text;
        }
    }

    // ~~

    string GetSqlValueText(
        long row_index
        )
    {
        return "\"" ~ ValueArray[ row_index ].Text ~ "\"";
    }

    // ~~

    string GetGoValueText(
        long row_index
        )
    {
        if ( GoType == "string" )
        {
            return "\"" ~ ValueArray[ row_index ].Text ~ "\"";
        }
        else if ( GoType == "bool" )
        {
            return ValueArray[ row_index ].Text == "0" ? "false" : "true";
        }
        else
        {
            return ValueArray[ row_index ].Text;
        }
    }
}

// ~~

class TABLE
{
    string
        SchemaName,
        Name,
        TypeName;
    string[]
        KeyNameArray;
    COLUMN[]
        ColumnArray;
    long
        RowCount;
    string
        PriorTitle,
        PriorFirstName,
        PriorLastName,
        PriorName;

    // ~~

    this(
        SCHEMA schema,
        string name
        )
    {
        SchemaName = schema.Name;
        Name = name;
        TypeName = "";
        KeyNameArray = [];
        ColumnArray = [];
        RowCount = schema.RowCount;
    }

    // ~~

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

    void MakeTypes(
        )
    {
        writeln( "Filling table : ", Name );

        foreach ( ref column; ColumnArray )
        {
            column.MakeType();
        }
    }

    // ~~

    void MakeValues(
        )
    {
        COLUMN
            last_stored_column;

        writeln( "Filling table : ", Name );

        last_stored_column = null;

        foreach ( ref column; ColumnArray )
        {
            if ( column.ItIsStored )
            {
                column.ValueArray = new VALUE[ RowCount ];

                last_stored_column = column;
            }
        }

        if ( last_stored_column !is null )
        {
            last_stored_column.ItIsLastStored = true;
        }

        foreach ( row_index; 0 .. RowCount )
        {
            PriorTitle = "";
            PriorFirstName = "";
            PriorLastName = "";
            PriorName = "";

            foreach ( ref column; ColumnArray )
            {
                if ( column.ItIsStored
                     && !column.ItIsForeign )
                {
                    column.ValueArray[ row_index ] = column.MakeValue( this, row_index, RowCount );
                }
            }
        }
    }
}

// ~~

class SCHEMA
{
    string
        Name;
    TABLE[]
        TableArray;
    long
        RowCount;

    // ~~

    this(
        )
    {
        RowCount = 10;
    }

    // -- FUNCTIONS

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

    void MakeTypes(
        )
    {
        string
            foreign_table_name;

        foreach ( ref table; TableArray )
        {
            table.MakeTypes();
        }

        foreach ( ref table; TableArray )
        {
            foreach ( ref column; table.ColumnArray )
            {
                if ( column.Type.endsWith( " REF" ) )
                {
                    column.ItIsForeign = true;

                    foreign_table_name = column.Type[ 0 .. $ - 4 ];
                }

                if ( column.Type.endsWith( " LIST" ) )
                {
                    column.ItIsForeign = true;
                    column.ItIsList = true;

                    foreign_table_name = column.Type[ 0 .. $ - 5 ];
                }

                if ( column.ItIsForeign )
                {
                    foreach ( ref foreign_table; TableArray )
                    {
                        if ( foreign_table.Name == foreign_table_name )
                        {
                            column.ForeignTable = foreign_table;
                            column.ForeignColumn = foreign_table.ColumnArray[ 0 ];
                            column.MakeForeignType();

                            break;
                        }
                    }
                }
            }
        }
    }

    // ~~

    void MakeValues(
        )
    {
        long
            foreign_value_count;
        VALUE
            foreign_value,
            value;

        foreach ( ref table; TableArray )
        {
            table.MakeValues();
        }

        foreach ( ref table; TableArray )
        {
            foreach ( ref column; table.ColumnArray )
            {
                if ( column.ItIsForeign )
                {
                    foreach ( row_index; 0 .. table.RowCount )
                    {
                        if ( column.ItIsList )
                        {
                            foreign_value_count = Random.MakeInteger( column.MinimumRandomCount, column.MaximumRandomCount );

                            value = new VALUE;

                            foreach ( foreign_value_index; 0 .. foreign_value_count )
                            {
                                do
                                {
                                    foreign_value = Random.PickElement( column.ForeignColumn.ValueArray );
                                }
                                while ( value.ValueArray.countUntil( foreign_value ) >= 0 );

                                value.Text ~= foreign_value.Text;
                                value.ValueArray ~= foreign_value;

                                if ( foreign_value_index < foreign_value_count - 1 )
                                {
                                    value.Text ~= ", ";
                                }
                            }

                            column.ValueArray[ row_index ] = value;
                        }
                        else
                        {
                            column.ValueArray[ row_index ] = Random.PickElement( column.ForeignColumn.ValueArray );
                        }
                    }
                }
            }
        }
    }

    // ~~

    void ReadBasilSchemaFile(
        string basil_schema_file_path
        )
    {
        string
            column_name,
            column_text,
            column_type,
            basil_schema_file_text,
            stripped_line,
            table_name;
        string[]
            column_text_array,
            line_text_array,
            property_text_array;
        COLUMN
            column;
        TABLE
            table;

        writeln( "Reading schema file : " ~ basil_schema_file_path );

        basil_schema_file_text = basil_schema_file_path.readText();
        TableArray = [];
        table = null;

        foreach ( ref line; basil_schema_file_text.lineSplitter() )
        {
            stripped_line = line.strip();

            if ( stripped_line.length > 0 )
            {
                writeln( line );

                if ( line.startsWith( "        " ) )
                {
                    line_text_array = stripped_line.split( '|' );
                    column_text_array = line_text_array[ 0 ].split( ':' );

                    if ( column_text_array.length == 2 )
                    {
                        column_name = column_text_array[ 0 ].strip();
                        column_type = column_text_array[ 1 ].strip();

                        column = new COLUMN( column_name, column_type );
                        table.ColumnArray ~= column;

                        if ( line_text_array.length == 2 )
                        {
                            property_text_array = line_text_array[ 1 ].split( ',' );

                            foreach ( ref property_text; property_text_array )
                            {
                                column.SetPropertyValue( property_text.strip() );
                            }

                            if ( column.ItIsKey )
                            {
                                table.KeyNameArray ~= column.Name;
                            }
                        }
                        else if ( line_text_array.length != 1 )
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
                    line_text_array = stripped_line.split( '|' );

                    table_name = line_text_array[ 0 ].strip();

                    table = new TABLE( this, table_name );
                    TableArray ~= table;

                    if ( line_text_array.length == 2 )
                    {
                        property_text_array = line_text_array[ 1 ].split( ',' );

                        foreach ( ref property_text; property_text_array )
                        {
                            table.SetPropertyValue( property_text.strip() );
                        }
                    }
                    else if ( line_text_array.length != 1 )
                    {
                        Abort( "Invalid table : " ~ stripped_line );
                    }
                }
                else
                {
                    line_text_array = stripped_line.split( '|' );

                    Name = line_text_array[ 0 ].strip();

                    if ( line_text_array.length == 2 )
                    {
                        property_text_array = line_text_array[ 1 ].split( ',' );

                        foreach ( ref property_text; property_text_array )
                        {
                            SetPropertyValue( property_text.strip() );
                        }
                    }
                    else if ( line_text_array.length != 1 )
                    {
                        Abort( "Invalid schema : " ~ stripped_line );
                    }
                }
            }
        }

        MakeTypes();
        MakeValues();
    }

    // ~~

    void WriteUmlSchemaFile(
        string uml_schema_file_path
        )
    {

        string
            uml_schema_file_text;

        writeln( "Writing UML schema file : " ~ uml_schema_file_path );

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
                uml_schema_file_text ~= "    " ~ column.Name ~ " : " ~ column.Type ~ "\n";
            }

            uml_schema_file_text ~= "}\n";
        }

        foreach ( ref table; TableArray )
        {
            foreach ( ref column; table.ColumnArray )
            {
                if ( column.ItIsForeign )
                {
                    uml_schema_file_text
                        ~= "\n" ~ column.ForeignTable.Name ~ " <-- " ~ table.Name ~ "\n";
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

        writeln( "Writing SQL schema file : " ~ sql_schema_file_path );

        sql_schema_file_text
            = "set @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;\n"
              ~ "set @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;\n"
              ~ "set @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';\n\n"
              ~ "drop schema if exists `" ~ Name ~ "`;\n\n"
              ~ "create schema if not exists `" ~ Name ~ "` default character set utf8 collate utf8_general_ci;\n\n"
              ~ "use `" ~ Name ~ "`;\n\n";

        foreach ( ref table; TableArray )
        {
            sql_schema_file_text
                ~= "drop table if exists `" ~ Name ~ "`.`" ~ table.Name ~ "`;\n\n"
                   ~ "create table if not exists `" ~ Name ~ "`.`" ~ table.Name ~ "`(\n";

            foreach ( ref column; table.ColumnArray )
            {
                if ( column.ItIsStored )
                {
                    sql_schema_file_text
                        ~= "  `"
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
                if ( column.ItIsStored
                     && column.ItIsKey )
                {
                    sql_schema_file_text ~= "  primary key( `" ~ column.SqlName ~ "` ),\n";
                }
            }

            foreign_key_index = 0;

            foreach ( ref column; table.ColumnArray )
            {
                if ( column.ItIsStored
                     && column.ItIsForeign
                     && !column.ItIsList )
                {
                    ++foreign_key_index;

                    sql_schema_file_text
                        ~= "  index `fk_"
                           ~ table.Name.toLower()
                           ~ "_"
                           ~ column.ForeignTable.Name.toLower()
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
                if ( column.ItIsStored
                     && column.ItIsForeign
                     && !column.ItIsList )
                {
                    ++foreign_key_index;

                    sql_schema_file_text
                        ~= "  constraint `fk_"
                           ~ table.Name.toLower()
                           ~ "_"
                           ~ column.ForeignTable.Name.toLower()
                           ~ "_"
                           ~ foreign_key_index.to!string()
                           ~ "`\n"
                           ~ "    foreign key( `"
                           ~ column.SqlName
                           ~ "` )\n"
                           ~ "    references `"
                           ~ Name
                           ~ "`.`"
                           ~ column.ForeignTable.Name
                           ~ "`( `"
                           ~ column.ForeignColumn.SqlName
                           ~ "` )\n"
                           ~ "    on delete set null\n"
                           ~ "    on update no action,\n";
                }
            }

            sql_schema_file_text
                = sql_schema_file_text[ 0 .. $ - 2 ]
                  ~ " )\n"
                  ~ "engine = InnoDB;\n\n";
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

        writeln( "Writing SQL data file : " ~ sql_data_file_path );

        foreach ( ref table; TableArray )
        {
            column_count = table.ColumnArray.length;

            foreach ( row_index; 0 .. table.RowCount )
            {
                sql_data_file_text
                    ~= "replace into `" ~ table.SchemaName ~ "`.`" ~ table.Name ~ "`\n    (\n        " ;

                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.ItIsStored )
                    {
                        sql_data_file_text ~= "`" ~ column.SqlName ~ "`";

                        if ( !column.ItIsLastStored )
                        {
                            sql_data_file_text ~= ", ";
                        }
                    }
                }

                sql_data_file_text ~= "\n    )\n    values\n    (\n";

                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.ItIsStored )
                    {
                        sql_data_file_text ~= "        " ~ column.GetSqlValueText( row_index );

                        if ( !column.ItIsLastStored )
                        {
                            sql_data_file_text ~= ",";
                        }

                        sql_data_file_text ~= "\n";
                    }
                }

                sql_data_file_text ~= "    );\n\n";
            }
        }

        sql_data_file_path.write( sql_data_file_text );
    }

    // ~~

    void WriteAqlDataFile(
        string aql_data_file_path
        )
    {
        long
            column_count;
        string
            aql_data_file_text;

        writeln( "Writing AQL data file : " ~ aql_data_file_path );

        aql_data_file_text = "";

        foreach ( ref table; TableArray )
        {
            column_count = table.ColumnArray.length;

            foreach ( row_index; 0 .. table.RowCount )
            {
                aql_data_file_text
                    ~= "insert into "
                       ~ table.SchemaName
                       ~ "."
                       ~ table.Name
                       ~ " ( PK, " ;

                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.ItIsStored )
                    {
                        aql_data_file_text ~= column.AqlName;

                        if ( !column.ItIsLastStored )
                        {
                            aql_data_file_text ~= ", ";
                        }
                    }
                }

                aql_data_file_text
                    ~= " ) values ( "
                       ~ table.ColumnArray[ 0 ].GetAqlValueText( row_index )
                       ~ ", ";

                foreach ( column_index, ref column; table.ColumnArray )
                {
                    if ( column.ItIsStored )
                    {
                        if ( column.ItIsList )
                        {
                            aql_data_file_text ~= "'JSON[ ";
                        }

                        aql_data_file_text ~= column.GetAqlValueText( row_index );

                        if ( column.ItIsList )
                        {
                            aql_data_file_text ~= " ]'";
                        }

                        if ( !column.ItIsLastStored )
                        {
                            aql_data_file_text ~= ", ";
                        }
                    }
                }

                aql_data_file_text ~= " );\n\n";
            }
        }

        aql_data_file_path.write( aql_data_file_text );
    }

    // ~~

    void WriteGoSchemaFile(
        string go_schema_file_path
        )
    {
        string
            go_schema_file_text;

        writeln( "Writing Go schema file : " ~ go_schema_file_path );

        go_schema_file_text = "";

        foreach ( ref table; TableArray )
        {
            table.TypeName = table.Name.toUpper();

            go_schema_file_text ~= "type " ~ table.TypeName ~ " struct {\n";

            foreach ( ref column; table.ColumnArray )
            {
                go_schema_file_text
                    ~= "    "
                       ~ column.GoName
                       ~ " "
                       ~ column.GoType;

                if ( column.ItIsStored )
                {
                    go_schema_file_text
                        ~= " `db:\""
                           ~ column.SqlName
                           ~ "\"`";
                }

                go_schema_file_text ~= ";\n";
            }

            go_schema_file_text ~= "}\n\n// ~~\n\n";
        }

        go_schema_file_path.write( go_schema_file_text );
    }

    // ~~

    void WriteGoDataFile(
        string go_data_file_path
        )
    {
        long
            column_count;
        string
            go_data_file_text;
        VALUE
            column_value;

        writeln( "Writing Go data file : " ~ go_data_file_path );

        go_data_file_text = "func FillDatabase() {\n";

        foreach ( ref table; TableArray )
        {
            foreach ( row_index; 0 .. table.RowCount )
            {
                go_data_file_text
                    ~= "    Add" ~ GetPascalCaseText( table.Name ) ~ "(\n        " ~ table.TypeName ~ " {\n";

                column_count = table.ColumnArray.length;

                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.ItIsStored )
                    {
                        go_data_file_text
                            ~= "            "
                               ~ column.GoName
                               ~ " : "
                               ~ column.GetGoValueText( row_index );

                        if ( !column.ItIsLastStored )
                        {
                            go_data_file_text ~= ",";
                        }

                        go_data_file_text ~= "\n";
                    }
                }

                go_data_file_text ~= "        }\n        );\n\n";
            }
        }

        go_data_file_text ~= "}\n";

        go_data_file_path.write( go_data_file_text );
    }
}

// -- VARIABLES

RANDOM
    Random;
SCHEMA
    Schema;

// .. FUNCTIONS

void ProcessFile(
    string basil_schema_file_path,
    ref string[] output_format_array
    )
{
    string
        base_file_path;

    base_file_path = basil_schema_file_path[ 0 .. $ - 6 ];

    Random = new RANDOM;

    Schema = new SCHEMA;
    Schema.ReadBasilSchemaFile( basil_schema_file_path );

    foreach ( ref output_format; output_format_array )
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
        else if ( output_format == "aql" )
        {
            Schema.WriteAqlDataFile( base_file_path ~ "_data.aql" );
        }
        else if ( output_format == "go" )
        {
            Schema.WriteGoSchemaFile( base_file_path ~ ".go" );
            Schema.WriteGoDataFile( base_file_path ~ "_data.go" );
        }
    }
}

// ~~

void main(
    string[] argument_array
    )
{
    string
        option;
    string[]
        output_format_array;

    argument_array = argument_array[ 1 .. $ ];

    while ( argument_array.length >= 1
            && argument_array[ 0 ].startsWith( "--" ) )
    {
        option = argument_array[ 0 ];

        argument_array = argument_array[ 1 .. $ ];

        if ( option == "--uml" )
        {
            output_format_array ~= "uml";
        }
        else if ( option == "--sql" )
        {
            output_format_array ~= "sql";
        }
        else if ( option == "--aql" )
        {
            output_format_array ~= "aql";
        }
        else if ( option == "--go" )
        {
            output_format_array ~= "go";
        }
        else
        {
            Abort( "Invalid option : " ~ option );
        }
    }

    if ( argument_array.length >= 1
         && argument_array[ 0 ].endsWith( ".basil" ) )
    {
        ProcessFile( argument_array[ 0 ], output_format_array );
    }
    else
    {
        writeln( "Usage :" );
        writeln( "    basil [options] file.basil" );
        writeln( "Options :" );
        writeln( "    --uml : generate the UML schema file" );
        writeln( "    --sql : generate the SQL schema and data files" );
        writeln( "    --aql : generate the AQL data file" );
        writeln( "    --go : generate the GO schema and data files" );
        writeln( "Examples :" );
        writeln( "    basil --uml file.basil" );
        writeln( "    basil --sql --go file.basil" );

        Abort( "Invalid arguments : " ~ argument_array.to!string() );
    }
}
