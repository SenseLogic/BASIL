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
import std.algorithm : countUntil, sort;
import std.ascii : isDigit, isLower, isUpper;
import std.conv : to;
import std.digest.md : md5Of;
import std.file : dirEntries, exists, mkdirRecurse, readText, thisExePath, write, SpanMode;
import std.math : ceil, floor, round;
import std.random : uniform;
import std.path : dirName;
import std.regex : regex, replaceAll, Regex;
import std.stdio : writeln;
import std.string : capitalize, endsWith, format, indexOf, join, lastIndexOf, lineSplitter, replace, startsWith, split, strip, stripRight, toLower, toUpper;
import std.uni : isAlpha;

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
        EnglishVertexArray,
        FrenchVertexArray,
        GermanVertexArray,
        SpanishVertexArray;
    long[ string ]
        EnglishVertexIndexMap,
        FrenchVertexIndexMap,
        GermanVertexIndexMap,
        SpanishVertexIndexMap;
    string[]
        LatinWordArray,
        SyllableArray;
    string[ string ]
        IdMap,
        UuidMap;
    string[]
        IdTextArray,
        UuidTextArray;

    // -- CONSTRUCTORS

    this(
        )
    {
        MakeFirstNameArray();
        MakeLastNameArray();
        MakeCityNameArray(),
        MakeRegionNameArray(),
        MakeCountryNameArray(),
        MakeEnglishVertexArray();
        MakeFrenchVertexArray();
        MakeGermanVertexArray();
        MakeSpanishVertexArray();
        MakeLatinWordArray();
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

        text = GetExecutablePath( file_path ).ReadText().replace( "\r", "" );

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
        ref VERTEX[] vertex_array,
        ref long[ string ] vertex_index_map,
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

        found_vertex_index = ( key in vertex_index_map );

        if ( found_vertex_index != null )
        {
            return *found_vertex_index;
        }
        else
        {
            vertex = new VERTEX( word );
            vertex_index = vertex_array.length;
            vertex_array ~= vertex;
            vertex_index_map[ key ] = vertex_index;

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
        ref VERTEX[] vertex_array,
        ref long[ string ] vertex_index_map,
        string text_file_path
        )
    {
        bool
            it_is_final;
        long
            vertex_index;
        string
            text;
        string[]
            line_array,
            word_array;
        VERTEX
            prior_vertex,
            vertex;

        text = GetExecutablePath( text_file_path ).ReadText().strip().replace( "\r", "" );
        line_array = text.split( '\n' );

        vertex_array = null;
        vertex_index_map = null;

        foreach ( ref line; line_array )
        {
            word_array = line.split( ' ' );
            prior_vertex = null;

            foreach ( word_index, ref word; word_array )
            {
                vertex_index = GetVertexIndex( vertex_array, vertex_index_map, word );
                vertex = vertex_array[ vertex_index ];

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

    void MakeEnglishVertexArray(
        )
    {
        MakeVertexArray( EnglishVertexArray, EnglishVertexIndexMap, "english_text.txt" );
    }

    // ~~

    void MakeFrenchVertexArray(
        )
    {
        MakeVertexArray( FrenchVertexArray, FrenchVertexIndexMap, "french_text.txt" );
    }

    // ~~

    void MakeGermanVertexArray(
        )
    {
        MakeVertexArray( GermanVertexArray, GermanVertexIndexMap, "german_text.txt" );
    }

    // ~~

    void MakeSpanishVertexArray(
        )
    {
        MakeVertexArray( SpanishVertexArray, SpanishVertexIndexMap, "spanish_text.txt" );
    }

    // ~~

    void MakeLatinWordArray(
        )
    {
        string
            text;

        text = GetExecutablePath( "latin_text.txt" ).ReadText();
        LatinWordArray = text.replace( "\r", "" ).replace( "\n", " " ).strip().split( ' ' );

        GetExecutablePath( "word_table.txt" ).WriteText( LatinWordArray.join( '\n' ) );
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

        GetExecutablePath( "syllable_table.txt" ).WriteText( SyllableArray.join( '\n' ) );
    }

    // ~~

    double MakeReal(
        double minimum_value,
        double maximum_value,
        double precision = 0.0
        )
    {
        double
            real_;

        real_ = uniform!"[]"( minimum_value, maximum_value );

        if ( precision > 0.0 )
        {
            real_ = ( real_ / precision ).floor() * precision;
        }

        return real_;
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
        return "0123456789abcdef"[ MakeIndex( 16 ) ];
    }

    // ~~

    char MakeSeparator()
    {
        return ".,;:!?+-=*/%^&#@"[ MakeIndex( 16 ) ];
    }

    // ~~

    string MakeDate(
        long minimum_year = 2000,
        long maximum_year = 2015
        )
    {
        return
            MakeInteger( minimum_year, maximum_year ).to!string()
            ~ "-"
            ~ MakeNatural( 1, 12, 2 ).to!string()
            ~ "-"
            ~ MakeNatural( 1, 28, 2 ).to!string();
    }

    // ~~

    string MakeTime(
        ulong minimum_hour = 0,
        ulong maximum_hour = 23
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

    string MakeDateTime(
        )
    {
        return MakeDate() ~ " " ~ MakeTime();
    }

    // ~~

    string MakeYear(
        )
    {
        return MakeInteger( 2000, 2020 ).to!string();
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

    string MakeBlob(
        ubyte[] byte_array,
        long byte_count
        )
    {
        long
            byte_index;
        string
            blob;

        for ( byte_index = 0;
              byte_index < byte_count;
              ++byte_index )
        {
            blob ~= "0123456789abcdef"[ byte_array[ byte_index ] >> 4 ];
            blob ~= "0123456789abcdef"[ byte_array[ byte_index ] & 15 ];
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
            ~ "-4"
            ~ MakeBlob( 4 )[ 1 .. $ ]
            ~ "-"
            ~ MakeBlob( 4 )
            ~ "-"
            ~ MakeBlob( 12 );
    }

    // ~~

    string MakeId(
        string text
        )
    {
        enum constant_array =
            [
                0x0000000000000000, 0x7ad870c830358979,
                0xf5b0e190606b12f2, 0x8f689158505e9b8b,
                0xc038e5739841b68f, 0xbae095bba8743ff6,
                0x358804e3f82aa47d, 0x4f50742bc81f2d04,
                0xab28ecb46814fe75, 0xd1f09c7c5821770c,
                0x5e980d24087fec87, 0x24407dec384a65fe,
                0x6b1009c7f05548fa, 0x11c8790fc060c183,
                0x9ea0e857903e5a08, 0xe478989fa00bd371,
                0x7d08ff3b88be6f81, 0x07d08ff3b88be6f8,
                0x88b81eabe8d57d73, 0xf2606e63d8e0f40a,
                0xbd301a4810ffd90e, 0xc7e86a8020ca5077,
                0x4880fbd87094cbfc, 0x32588b1040a14285,
                0xd620138fe0aa91f4, 0xacf86347d09f188d,
                0x2390f21f80c18306, 0x594882d7b0f40a7f,
                0x1618f6fc78eb277b, 0x6cc0863448deae02,
                0xe3a8176c18803589, 0x997067a428b5bcf0,
                0xfa11fe77117cdf02, 0x80c98ebf2149567b,
                0x0fa11fe77117cdf0, 0x75796f2f41224489,
                0x3a291b04893d698d, 0x40f16bccb908e0f4,
                0xcf99fa94e9567b7f, 0xb5418a5cd963f206,
                0x513912c379682177, 0x2be1620b495da80e,
                0xa489f35319033385, 0xde51839b2936bafc,
                0x9101f7b0e12997f8, 0xebd98778d11c1e81,
                0x64b116208142850a, 0x1e6966e8b1770c73,
                0x8719014c99c2b083, 0xfdc17184a9f739fa,
                0x72a9e0dcf9a9a271, 0x08719014c99c2b08,
                0x4721e43f0183060c, 0x3df994f731b68f75,
                0xb29105af61e814fe, 0xc849756751dd9d87,
                0x2c31edf8f1d64ef6, 0x56e99d30c1e3c78f,
                0xd9810c6891bd5c04, 0xa3597ca0a188d57d,
                0xec09088b6997f879, 0x96d1784359a27100,
                0x19b9e91b09fcea8b, 0x636199d339c963f2,
                0xdf7adabd7a6e2d6f, 0xa5a2aa754a5ba416,
                0x2aca3b2d1a053f9d, 0x50124be52a30b6e4,
                0x1f423fcee22f9be0, 0x659a4f06d21a1299,
                0xeaf2de5e82448912, 0x902aae96b271006b,
                0x74523609127ad31a, 0x0e8a46c1224f5a63,
                0x81e2d7997211c1e8, 0xfb3aa75142244891,
                0xb46ad37a8a3b6595, 0xceb2a3b2ba0eecec,
                0x41da32eaea507767, 0x3b024222da65fe1e,
                0xa2722586f2d042ee, 0xd8aa554ec2e5cb97,
                0x57c2c41692bb501c, 0x2d1ab4dea28ed965,
                0x624ac0f56a91f461, 0x1892b03d5aa47d18,
                0x97fa21650afae693, 0xed2251ad3acf6fea,
                0x095ac9329ac4bc9b, 0x7382b9faaaf135e2,
                0xfcea28a2faafae69, 0x8632586aca9a2710,
                0xc9622c4102850a14, 0xb3ba5c8932b0836d,
                0x3cd2cdd162ee18e6, 0x460abd1952db919f,
                0x256b24ca6b12f26d, 0x5fb354025b277b14,
                0xd0dbc55a0b79e09f, 0xaa03b5923b4c69e6,
                0xe553c1b9f35344e2, 0x9f8bb171c366cd9b,
                0x10e3202993385610, 0x6a3b50e1a30ddf69,
                0x8e43c87e03060c18, 0xf49bb8b633338561,
                0x7bf329ee636d1eea, 0x012b592653589793,
                0x4e7b2d0d9b47ba97, 0x34a35dc5ab7233ee,
                0xbbcbcc9dfb2ca865, 0xc113bc55cb19211c,
                0x5863dbf1e3ac9dec, 0x22bbab39d3991495,
                0xadd33a6183c78f1e, 0xd70b4aa9b3f20667,
                0x985b3e827bed2b63, 0xe2834e4a4bd8a21a,
                0x6debdf121b863991, 0x1733afda2bb3b0e8,
                0xf34b37458bb86399, 0x8993478dbb8deae0,
                0x06fbd6d5ebd3716b, 0x7c23a61ddbe6f812,
                0x3373d23613f9d516, 0x49aba2fe23cc5c6f,
                0xc6c333a67392c7e4, 0xbc1b436e43a74e9d,
                0x95ac9329ac4bc9b5, 0xef74e3e19c7e40cc,
                0x601c72b9cc20db47, 0x1ac40271fc15523e,
                0x5594765a340a7f3a, 0x2f4c0692043ff643,
                0xa02497ca54616dc8, 0xdafce7026454e4b1,
                0x3e847f9dc45f37c0, 0x445c0f55f46abeb9,
                0xcb349e0da4342532, 0xb1eceec59401ac4b,
                0xfebc9aee5c1e814f, 0x8464ea266c2b0836,
                0x0b0c7b7e3c7593bd, 0x71d40bb60c401ac4,
                0xe8a46c1224f5a634, 0x927c1cda14c02f4d,
                0x1d148d82449eb4c6, 0x67ccfd4a74ab3dbf,
                0x289c8961bcb410bb, 0x5244f9a98c8199c2,
                0xdd2c68f1dcdf0249, 0xa7f41839ecea8b30,
                0x438c80a64ce15841, 0x3954f06e7cd4d138,
                0xb63c61362c8a4ab3, 0xcce411fe1cbfc3ca,
                0x83b465d5d4a0eece, 0xf96c151de49567b7,
                0x76048445b4cbfc3c, 0x0cdcf48d84fe7545,
                0x6fbd6d5ebd3716b7, 0x15651d968d029fce,
                0x9a0d8ccedd5c0445, 0xe0d5fc06ed698d3c,
                0xaf85882d2576a038, 0xd55df8e515432941,
                0x5a3569bd451db2ca, 0x20ed197575283bb3,
                0xc49581ead523e8c2, 0xbe4df122e51661bb,
                0x3125607ab548fa30, 0x4bfd10b2857d7349,
                0x04ad64994d625e4d, 0x7e7514517d57d734,
                0xf11d85092d094cbf, 0x8bc5f5c11d3cc5c6,
                0x12b5926535897936, 0x686de2ad05bcf04f,
                0xe70573f555e26bc4, 0x9ddd033d65d7e2bd,
                0xd28d7716adc8cfb9, 0xa85507de9dfd46c0,
                0x273d9686cda3dd4b, 0x5de5e64efd965432,
                0xb99d7ed15d9d8743, 0xc3450e196da80e3a,
                0x4c2d9f413df695b1, 0x36f5ef890dc31cc8,
                0x79a59ba2c5dc31cc, 0x037deb6af5e9b8b5,
                0x8c157a32a5b7233e, 0xf6cd0afa9582aa47,
                0x4ad64994d625e4da, 0x300e395ce6106da3,
                0xbf66a804b64ef628, 0xc5bed8cc867b7f51,
                0x8aeeace74e645255, 0xf036dc2f7e51db2c,
                0x7f5e4d772e0f40a7, 0x05863dbf1e3ac9de,
                0xe1fea520be311aaf, 0x9b26d5e88e0493d6,
                0x144e44b0de5a085d, 0x6e963478ee6f8124,
                0x21c640532670ac20, 0x5b1e309b16452559,
                0xd476a1c3461bbed2, 0xaeaed10b762e37ab,
                0x37deb6af5e9b8b5b, 0x4d06c6676eae0222,
                0xc26e573f3ef099a9, 0xb8b627f70ec510d0,
                0xf7e653dcc6da3dd4, 0x8d3e2314f6efb4ad,
                0x0256b24ca6b12f26, 0x788ec2849684a65f,
                0x9cf65a1b368f752e, 0xe62e2ad306bafc57,
                0x6946bb8b56e467dc, 0x139ecb4366d1eea5,
                0x5ccebf68aecec3a1, 0x2616cfa09efb4ad8,
                0xa97e5ef8cea5d153, 0xd3a62e30fe90582a,
                0xb0c7b7e3c7593bd8, 0xca1fc72bf76cb2a1,
                0x45775673a732292a, 0x3faf26bb9707a053,
                0x70ff52905f188d57, 0x0a2722586f2d042e,
                0x854fb3003f739fa5, 0xff97c3c80f4616dc,
                0x1bef5b57af4dc5ad, 0x61372b9f9f784cd4,
                0xee5fbac7cf26d75f, 0x9487ca0fff135e26,
                0xdbd7be24370c7322, 0xa10fceec0739fa5b,
                0x2e675fb4576761d0, 0x54bf2f7c6752e8a9,
                0xcdcf48d84fe75459, 0xb71738107fd2dd20,
                0x387fa9482f8c46ab, 0x42a7d9801fb9cfd2,
                0x0df7adabd7a6e2d6, 0x772fdd63e7936baf,
                0xf8474c3bb7cdf024, 0x829f3cf387f8795d,
                0x66e7a46c27f3aa2c, 0x1c3fd4a417c62355,
                0x935745fc4798b8de, 0xe98f353477ad31a7,
                0xa6df411fbfb21ca3, 0xdc0731d78f8795da,
                0x536fa08fdfd90e51, 0x29b7d047efec8728,
            ];
        string
            id;
        ulong
            character,
            character_index,
            hash;

        for ( character_index = 0;
              character_index < text.length;
              ++character_index )
        {
            character = text[ character_index ];

            hash = constant_array[ ( hash ^ character ) & 255 ] ^ ( hash >> 8 );
        }

        id = ( cast( long )hash ).to!string();

        if ( ( text in IdMap ) is null )
        {
            IdMap[ text ] = id;
            IdTextArray ~= text;
        }

        return id;
    }

    // ~~

    string MakeUuid(
        string text
        )
    {
        string
            hash,
            uuid;

        if ( text == "" )
        {
            uuid = "00000000-0000-0000-0000-000000000000";
        }
        else
        {
            hash = MakeBlob( md5Of( text ), 16 );

            uuid
                = hash[ 0 .. 8 ]
                  ~ "-"
                  ~ hash[ 8 .. 12 ]
                  ~ "-"
                  ~ hash[ 12 .. 16 ]
                  ~ "-"
                  ~ hash[ 16 .. 20 ]
                  ~ "-"
                  ~ hash[ 20 .. 32 ];

            if ( ( text in UuidMap ) is null )
            {
                UuidMap[ text ] = uuid;
                UuidTextArray ~= text;
            }
        }

        return uuid;
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

        return name.toLower();
    }

    // ~~

    string MakeSlug(
        string text
        )
    {
        return
            text
                .toLower()
                .replace( " ", "-" )
                .replace( "\"", "-" )
                .replace( ".", "" );
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

    string MakeFullName(
        )
    {
        return PickElement( FirstNameArray ) ~ " " ~ PickElement( LastNameArray );
    }

    // ~~

    string MakeEmail(
        string first_name,
        string last_name
        )
    {
        return
            ( ( first_name != "" ) ? first_name : MakeFirstName() ).toLower()
            ~ "."
            ~ ( ( last_name != "" ) ? last_name : MakeLastName() ).toLower()
            ~ [
                  "@gmail.com",
                  "@yahoo.com",
                  "@outlook.com",
                  "@live.com",
                  "@hotmail.com",
                  "@mail.com"
              ][ MakeIndex( 6 ) ];
    }

    // ~~

    string MakePseudonym(
        string email
        )
    {
        return email.split( '@' )[ 0 ].replace( ".", "" );
    }

    // ~~

    string MakePseudonym(
        string first_name,
        string last_name
        )
    {
        return
            ( ( ( first_name != "" ) ? first_name : MakeFirstName() )
              ~ ( ( last_name != "" ) ? last_name : MakeLastName() ) ).toLower();
    }

    // ~~

    string MakePassword(
        )
    {
        return
            MakeName( 4, 8 )
            .InsertCharacter( MakeUppercaseLetter() )
            .InsertCharacter( MakeDigit() )
            .InsertCharacter( MakeSeparator() );
    }

    // ~~

    string MakePhoneNumber(
        )
    {
        return
            "+"
            ~ MakeInteger( 10, 99 ).to!string()
            ~ " "
            ~ MakeInteger( 100, 999 ).to!string()
            ~ " "
            ~ MakeInteger( 100, 999 ).to!string()
            ~ " "
            ~ MakeInteger( 100, 999 ).to!string();
    }

    // ~~

    string MakeStreetName(
        )
    {
        return
            MakeLastName()
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

    // ~~

    string MakeStreetAddress(
        )
    {
        return
            MakeInteger( 1, 100 ).to!string()
            ~ " "
            ~ MakeStreetName();
    }

    // ~~

    string MakeCityCode(
        )
    {
        return MakeInteger( 1000, 9999 ).to!string();
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

    string MakeCountryCode(
        )
    {
        return
            PickElement(
                [
                    "AD", "AE", "AF", "AG", "AI", "AL", "AM",
                    "AN", "AO", "AQ", "AR", "AS", "AT", "AU",
                    "AW", "AX", "AZ", "BA", "BB", "BD", "BE",
                    "BF", "BG", "BH", "BI", "BJ", "BL", "BM",
                    "BN", "BO", "BQ", "BR", "BS", "BT", "BV",
                    "BW", "BY", "BZ", "CA", "CC", "CD", "CF",
                    "CG", "CH", "CI", "CK", "CL", "CM", "CN",
                    "CO", "CR", "CS", "CU", "CV", "CW", "CX",
                    "CY", "CZ", "DE", "DJ", "DK", "DM", "DO",
                    "DZ", "EC", "EE", "EG", "EH", "ER", "ES",
                    "ET", "FI", "FJ", "FK", "FM", "FO", "FR",
                    "GA", "GB", "GD", "GE", "GF", "GG", "GH",
                    "GI", "GL", "GM", "GN", "GP", "GQ", "GR",
                    "GS", "GT", "GU", "GW", "GY", "HK", "HM",
                    "HN", "HR", "HT", "HU", "ID", "IE", "IL",
                    "IM", "IN", "IO", "IQ", "IR", "IS", "IT",
                    "JE", "JM", "JO", "JP", "KE", "KG", "KH",
                    "KI", "KM", "KN", "KP", "KR", "KW", "KY",
                    "KZ", "LA", "LB", "LC", "LI", "LK", "LR",
                    "LS", "LT", "LU", "LV", "LY", "MA", "MC",
                    "MD", "ME", "MF", "MG", "MH", "MK", "ML",
                    "MM", "MN", "MO", "MP", "MQ", "MR", "MS",
                    "MT", "MU", "MV", "MW", "MX", "MY", "MZ",
                    "NA", "NC", "NE", "NF", "NG", "NI", "NL",
                    "NO", "NP", "NR", "NU", "NZ", "OM", "PA",
                    "PE", "PF", "PG", "PH", "PK", "PL", "PM",
                    "PN", "PR", "PS", "PT", "PW", "PY", "QA",
                    "RE", "RO", "RS", "RU", "RW", "SA", "SB",
                    "SC", "SD", "SE", "SG", "SH", "SI", "SJ",
                    "SK", "SL", "SM", "SN", "SO", "SR", "SS",
                    "ST", "SV", "SX", "SY", "SZ", "TC", "TD",
                    "TF", "TG", "TH", "TJ", "TK", "TL", "TM",
                    "TN", "TO", "TR", "TT", "TV", "TW", "TZ",
                    "UA", "UG", "UM", "US", "UY", "UZ", "VA",
                    "VC", "VE", "VG", "VI", "VN", "VU", "WF",
                    "WS", "XK", "YE", "YT", "ZA", "ZM", "ZW"
                ]
                );
    }

    // ~~

    string MakeCompanyName(
        )
    {
        return
            MakeLastName()
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
              ][ MakeIndex( 52 ) ];
    }

    // ~~

    string MakeImageFileName(
        )
    {
        return
            MakeName( 8, 8 )
            ~ [
                  ".jpg",
                  ".png",
                  ".gif"
              ][ MakeIndex( 3 ) ];
    }

    // ~~

    string MakeAudioFileName(
        )
    {
        return
            MakeName( 8, 8 )
            ~ [
                  ".mp3",
                  ".wav",
                  ".flac"
              ][ MakeIndex( 3 ) ];
    }

    // ~~

    string MakeVideoFileName(
        )
    {
        return
            MakeName( 8, 8 )
            ~ [
                  ".mp4",
                  ".webm",
                  ".ogv"
              ][ MakeIndex( 3 ) ];
    }

    // ~~

    string MakeFileName(
        )
    {
        return
            MakeName( 8, 8 )
            ~ [
                  ".pdf",
                  ".doc",
                  ".odt"
              ][ MakeIndex( 3 ) ];
    }

    // ~~

    string MakeFolderPath(
        )
    {
        return MakeName( 8, 8 ) ~ "/";
    }

    // ~~

    string MakeIsbn(
        )
    {
        return
            MakeInteger( 100, 999 ).to!string()
            ~ "-"
            ~ MakeInteger( 1000000000, 9999999999 ).to!string();
    }

    // ~~

    string MakeTagList(
        long minimum_word_count = 5,
        long maximum_word_count = 10
        )
    {
        return MakeEnglishSentence( minimum_word_count, maximum_word_count ).toLower().replace( " ", ", " );
    }

    // ~~

    string MakeSentence(
        VERTEX[] vertex_array,
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
                vertex = PickElement( vertex_array );
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
                vertex = vertex_array[ link.VertexIndex ];

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

    string MakeEnglishSentence(
        long minimum_word_count,
        long maximum_word_count
        )
    {
        return MakeSentence( EnglishVertexArray, minimum_word_count, maximum_word_count );
    }

    // ~~

    string MakeGermanSentence(
        long minimum_word_count,
        long maximum_word_count
        )
    {
        return MakeSentence( GermanVertexArray, minimum_word_count, maximum_word_count );
    }

    // ~~

    string MakeFrenchSentence(
        long minimum_word_count,
        long maximum_word_count
        )
    {
        return MakeSentence( FrenchVertexArray, minimum_word_count, maximum_word_count );
    }

    // ~~

    string MakeSpanishSentence(
        long minimum_word_count,
        long maximum_word_count
        )
    {
        return MakeSentence( SpanishVertexArray, minimum_word_count, maximum_word_count );
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
            sentence ~= PickElement( LatinWordArray );

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
        else if ( language == "german" )
        {
            return MakeGermanSentence( minimum_word_count, maximum_word_count );
        }
        else if ( language == "french" )
        {
            return MakeFrenchSentence( minimum_word_count, maximum_word_count );
        }
        else if ( language == "spanish" )
        {
            return MakeSpanishSentence( minimum_word_count, maximum_word_count );
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

    // ~~

    string MakeTitle(
        string text
        )
    {
        return text.GetCapitalizedText() ~ ".";
    }

    // ~~

    string MakeTitle(
        string language,
        long minimum_word_count,
        long maximum_word_count
        )
    {
        return MakeTitle( MakeSentence( language, minimum_word_count, maximum_word_count ) );
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
    long
        Capacity;
    TYPE
        ActualType;
    TYPE[]
        SubTypeArray;
    bool
        HasTemplateText;
    string
        TemplateText;

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
        bool
            character_is_in_string;
        char
            character;
        long
            bracket_level,
            character_index;
        string
            sub_type;
        string[]
            name_part_array;

        Table = table;
        Column = column;
        ColumnName = column.Name;
        Name = type_name.GetPartArray( " " ).join( "" );
        BaseName = Name;

        bracket_level = 0;
        character_is_in_string = false;

        for ( character_index = 0;
              character_index < Name.length;
              ++character_index )
        {
            character = Name[ character_index ];

            if ( character_is_in_string )
            {
                sub_type ~= character;

                if ( character == '\\'
                     && character_index + 1 < Name.length )
                {
                    ++character_index;

                    sub_type ~= Name[ character_index ];
                }
                else if ( character == '"' )
                {
                    character_is_in_string = false;
                }
            }
            else if ( character == ':' )
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

                if ( character == '"' )
                {
                    character_is_in_string = true;
                }
            }
        }

        name_part_array = Name.GetPartArray( "=" );

        if ( name_part_array.length >= 2 )
        {
            if ( name_part_array.length == 2
                 && name_part_array[ 1 ].length >= 2
                 && name_part_array[ 1 ].startsWith( '"' )
                 && name_part_array[ 1 ].endsWith( '"' ) )
            {
                Name = name_part_array[ 0 ];
                BaseName = Name;
                TemplateText = name_part_array[ 1 ][ 1 .. $ - 1 ];
                HasTemplateText = true;
            }
            else
            {
                Abort( "Invalid type : " ~ type_name );
            }
        }
    }

    // -- INQUIRIES

    bool IsBoolean(
        )
    {
        return BaseName == "BOOL";
    }

    // ~~

    bool IsNatural(
        )
    {
        return
            BaseName == "UINT8"
            || BaseName == "UINT16"
            || BaseName == "UINT32"
            || BaseName == "UINT64";
    }

    // ~~

    bool IsInteger(
        )
    {
        return
            BaseName == "INT8"
            || BaseName == "INT16"
            || BaseName == "INT32"
            || BaseName == "INT64";
    }

    // ~~

    bool IsReal(
        )
    {
        return
            BaseName == "FLOAT32"
            || BaseName == "FLOAT64";
    }

    // ~~

    bool IsNumber(
        )
    {
        return
            BaseName == "INT8"
            || BaseName == "UINT8"
            || BaseName == "INT16"
            || BaseName == "UINT16"
            || BaseName == "INT32"
            || BaseName == "UINT32"
            || BaseName == "INT64"
            || BaseName == "UINT64"
            || BaseName == "FLOAT32"
            || BaseName == "FLOAT64";
    }

    // ~~

    bool IsString(
        )
    {
        return
            BaseName == "STRING"
            || BaseName == "STRING8"
            || BaseName == "STRING16"
            || BaseName == "STRING24"
            || BaseName == "STRING32";
    }

    // ~~

    bool IsDateTime(
        )
    {
        return BaseName == "DATE_TIME";
    }

    // ~~

    bool IsDate(
        )
    {
        return BaseName == "DATE";
    }

    // ~~

    bool IsTime(
        )
    {
        return BaseName == "TIME";
    }

    // ~~

    bool IsUuid(
        )
    {
        return BaseName == "UUID";
    }

    // ~~

    bool IsScalar(
        )
    {
        return
            BaseName == "BOOL"
            || BaseName == "INT8"
            || BaseName == "UINT8"
            || BaseName == "INT16"
            || BaseName == "UINT16"
            || BaseName == "INT32"
            || BaseName == "UINT32"
            || BaseName == "INT64"
            || BaseName == "UINT64"
            || BaseName == "FLOAT32"
            || BaseName == "FLOAT64"
            || BaseName == "STRING"
            || BaseName == "STRING8"
            || BaseName == "STRING16"
            || BaseName == "STRING24"
            || BaseName == "STRING32"
            || BaseName == "DATETIME"
            || BaseName == "DATE"
            || BaseName == "TIME"
            || BaseName == "UUID";
    }

    // ~~

    bool IsBlob(
        )
    {
        return BaseName == "BLOB";
    }

    // ~~

    bool IsTuple(
        )
    {
        return BaseName == "TUPLE";
    }

    // ~~

    bool IsList(
        )
    {
        return BaseName == "LIST";
    }

    // ~~

    bool IsSet(
        )
    {
        return BaseName == "SET";
    }

    // ~~

    bool IsMap(
        )
    {
        return BaseName == "MAP";
    }

    // ~~

    bool IsCollection(
        )
    {
        return
            BaseName == "TUPLE"
            || BaseName == "LIST"
            || BaseName == "SET"
            || BaseName == "MAP";
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
            if ( ActualType.Capacity != 0 )
            {
                return "VARCHAR( " ~ ActualType.Capacity.to!string() ~ " )";
            }
            else
            {
                return "TEXT";
            }
        }
        else if ( type_name == "STRING8" )
        {
            return "TINYTEXT";
        }
        else if ( type_name == "STRING16" )
        {
            return "TEXT";
        }
        else if ( type_name == "STRING24" )
        {
            return "MEDIUMTEXT";
        }
        else if ( type_name == "STRING32" )
        {
            return "LONGTEXT";
        }
        else if ( type_name == "DATETIME" )
        {
            return "DATETIME";
        }
        else if ( type_name == "DATE" )
        {
            return "DATE";
        }
        else if ( type_name == "TIME" )
        {
            return "TIME";
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

        foreach ( sub_type; ActualType.SubTypeArray )
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
        else if ( type_name == "STRING"
                  || type_name == "STRING8"
                  || type_name == "STRING16"
                  || type_name == "STRING24"
                  || type_name == "STRING32" )
        {
            return "text";
        }
        else if ( type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME" )
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

        foreach ( sub_type; ActualType.SubTypeArray )
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
        else if ( type_name == "STRING"
                  || type_name == "STRING8"
                  || type_name == "STRING16"
                  || type_name == "STRING24"
                  || type_name == "STRING32" )
        {
            return "string";
        }
        else if ( type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME" )
        {
            return "time.Time";
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

        foreach ( sub_type; ActualType.SubTypeArray )
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
        else if ( type_name == "STRING"
                  || type_name == "STRING8"
                  || type_name == "STRING16"
                  || type_name == "STRING24"
                  || type_name == "STRING32" )
        {
            return "String";
        }
        else if ( type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME" )
        {
            return "DateTime";
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
            return Name.GetAttributeCaseText();
        }
    }

    // ~~

    string GetPhpText(
        )
    {
        string
            type_name;

        type_name = ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            return "bool";
        }
        else if ( type_name == "INT8"
                  || type_name == "UINT8"
                  || type_name == "INT16"
                  || type_name == "UINT16"
                  || type_name == "INT32"
                  || type_name == "UINT32"
                  || type_name == "INT64"
                  || type_name == "UINT64" )
        {
            return "int";
        }
        else if ( type_name == "FLOAT32"
                  || type_name == "FLOAT64" )
        {
            return "float";
        }
        else if ( type_name == "STRING"
                  || type_name == "STRING8"
                  || type_name == "STRING16"
                  || type_name == "STRING24"
                  || type_name == "STRING32"
                  || type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME"
                  || type_name == "UUID"
                  || type_name == "BLOB"
                  || type_name == "POINTER" )
        {
            return "string";
        }
        else if ( type_name == "ARRAY"
                  || type_name == "TUPLE"
                  || type_name == "LIST"
                  || type_name == "SET"
                  || type_name == "MAP" )
        {
            return "array";
        }
        else
        {
            return Name;
        }
    }

    // ~~

    string GetPhpParameterTypeText(
        )
    {
        string
            type_name;

        type_name = ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            return "PDO::PARAM_BOOL";
        }
        else if ( type_name == "INT8"
                  || type_name == "UINT8"
                  || type_name == "INT16"
                  || type_name == "UINT16"
                  || type_name == "INT32"
                  || type_name == "UINT32"
                  || type_name == "INT64"
                  || type_name == "UINT64" )
        {
            return "PDO::PARAM_INT";
        }
        else
        {
            return "PDO::PARAM_STR";
        }
    }

    // ~~

    string GetSubTypePhpAttributeText(
        )
    {
        string
            sub_types_php_text;

        foreach ( sub_type; ActualType.SubTypeArray )
        {
            sub_types_php_text ~= sub_type.GetPhpAttributeText();
        }

        return sub_types_php_text;
    }

    // ~~

    string GetPhpAttributeText(
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
        else if ( type_name == "STRING"
                  || type_name == "STRING8"
                  || type_name == "STRING16"
                  || type_name == "STRING24"
                  || type_name == "STRING32" )
        {
            return "String";
        }
        else if ( type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME" )
        {
            return "DateTime";
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
            return GetSubTypePhpAttributeText() ~ "Pointer";
        }
        else if ( type_name == "ARRAY" )
        {
            return GetSubTypePhpAttributeText() ~ "Array";
        }
        else if ( type_name == "TUPLE" )
        {
            return GetSubTypePhpAttributeText() ~ "Tuple";
        }
        else if ( type_name == "LIST" )
        {
            return GetSubTypePhpAttributeText() ~ "List";
        }
        else if ( type_name == "SET" )
        {
            return GetSubTypePhpAttributeText() ~ "Set";
        }
        else if ( type_name == "MAP" )
        {
            return GetSubTypePhpAttributeText() ~ "Map";
        }
        else
        {
            return Name.GetAttributeCaseText();
        }
    }

    // ~~

    string GetSubTypeCrystalText(
        )
    {
        string
            sub_types_crystal_text;

        foreach ( sub_type; ActualType.SubTypeArray )
        {
            if ( sub_types_crystal_text != "" )
            {
                sub_types_crystal_text ~= ", ";
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
        else if ( type_name == "STRING"
                  || type_name == "STRING8"
                  || type_name == "STRING16"
                  || type_name == "STRING24"
                  || type_name == "STRING32"
                  || type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME"
                  || type_name == "UUID"
                  || type_name == "BLOB" )
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

        foreach ( sub_type; ActualType.SubTypeArray )
        {
            if ( sub_types_csharp_text != "" )
            {
                sub_types_csharp_text ~= ", ";
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
        else if ( type_name == "STRING"
                  || type_name == "STRING8"
                  || type_name == "STRING16"
                  || type_name == "STRING24"
                  || type_name == "STRING32" )
        {
            return "string";
        }
        else if ( type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME" )
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
            return "List<" ~ GetSubTypeCsharpText() ~ ">";
        }
        else if ( type_name == "SET" )
        {
            return "HashSet<" ~ GetSubTypeCsharpText() ~ ">";
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

    string GetSubTypeCsharpAttributeText(
        )
    {
        string
            sub_types_go_text;

        foreach ( sub_type; ActualType.SubTypeArray )
        {
            sub_types_go_text ~= sub_type.GetCsharpAttributeText();
        }

        return sub_types_go_text;
    }

    // ~~

    string GetCsharpAttributeText(
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
        else if ( type_name == "STRING"
                  || type_name == "STRING8"
                  || type_name == "STRING16"
                  || type_name == "STRING24"
                  || type_name == "STRING32" )
        {
            return "String";
        }
        else if ( type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME" )
        {
            return "DateTime";
        }
        else if ( type_name == "UUID" )
        {
            return "Uuid";
        }
        else if ( type_name == "BLOB" )
        {
            return "String";
        }
        else if ( type_name == "POINTER" )
        {
            return GetSubTypeCsharpAttributeText() ~ "Pointer";
        }
        else if ( type_name == "ARRAY" )
        {
            return GetSubTypeCsharpAttributeText() ~ "Array";
        }
        else if ( type_name == "TUPLE" )
        {
            return GetSubTypeCsharpAttributeText() ~ "Tuple";
        }
        else if ( type_name == "LIST" )
        {
            return GetSubTypeCsharpAttributeText() ~ "List";
        }
        else if ( type_name == "SET" )
        {
            return GetSubTypeCsharpAttributeText() ~ "Set";
        }
        else if ( type_name == "MAP" )
        {
            return GetSubTypeCsharpAttributeText() ~ "Map";
        }
        else
        {
            return Name.GetAttributeCaseText();
        }
    }

    // ~~

    string GetSubTypeRustText(
        )
    {
        string
            sub_types_rust_text;

        foreach ( sub_type; ActualType.SubTypeArray )
        {
            if ( sub_types_rust_text != "" )
            {
                sub_types_rust_text ~= ", ";
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
        else if ( type_name == "STRING"
                  || type_name == "STRING8"
                  || type_name == "STRING16"
                  || type_name == "STRING24"
                  || type_name == "STRING32"
                  || type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME"
                  || type_name == "UUID"
                  || type_name == "BLOB" )
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

    string GetTemplateValue(
        long row_index
        )
    {
        double
            precision,
            real_value;
        long
            filter_argument_count,
            filter_argument_index,
            filter_index,
            integer_value;
        string
            filter,
            filter_argument,
            filter_name,
            other_filter_argument;
        string[]
            filter_argument_array,
            filter_array,
            template_part_array;

        if ( TemplateText == "" )
        {
            return "";
        }
        else
        {
            template_part_array = Random.PickElement( TemplateText.GetPartArray( "|" ) ).GetPartArray( "{{", "}}" );

            foreach ( template_part_index, ref template_part; template_part_array )
            {
                if ( ( template_part_index & 1 ) == 0 )
                {
                    template_part = template_part.GetProcessedText();
                }
                else
                {
                    filter_array = template_part.Split( ':' );
                    template_part = "";

                    for ( filter_index = 0;
                          filter_index < filter_array.length;
                          ++filter_index )
                    {
                        filter = filter_array[ filter_index ];
                        filter_argument_array = filter.Split( ' ' );

                        foreach ( ref filter_argument_; filter_argument_array )
                        {
                            filter_argument_ = filter_argument_.GetProcessedText();
                        }

                        if ( filter_argument_array.length >= 1 )
                        {
                            filter_name = filter_argument_array[ 0 ];
                            filter_argument_array = filter_argument_array[ 1 .. $ ];
                            filter_argument_count = filter_argument_array.length;

                            if ( filter_name == "set"
                                 && filter_argument_count == 1 )
                            {
                                template_part = filter_argument_array[ 0 ];
                            }
                            else if ( filter_name == "natural" )
                            {
                                template_part
                                    = Random.MakeNatural(
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetNatural() : 1,
                                          ( filter_argument_count > 1 ) ? filter_argument_array[ 1 ].GetNatural() : 100,
                                          ( filter_argument_count > 2 ) ? filter_argument_array[ 2 ].GetInteger() : 0
                                          ).to!string();
                            }
                            else if ( filter_name == "integer" )
                            {
                                template_part
                                    = Random.MakeInteger(
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetInteger() : 2000,
                                          ( filter_argument_count > 1 ) ? filter_argument_array[ 1 ].GetInteger() : 2015
                                          ).to!string();
                            }
                            else if ( filter_name == "real" )
                            {
                                template_part
                                    = Random.MakeReal(
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetReal() : 0.0,
                                          ( filter_argument_count > 1 ) ? filter_argument_array[ 1 ].GetReal() : 1.0,
                                          ( filter_argument_count > 2 ) ? filter_argument_array[ 2 ].GetReal() : 0.0
                                          ).to!string();
                            }
                            else if ( filter_name == "date" )
                            {
                                template_part
                                    = Random.MakeDate(
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetInteger() : 1,
                                          ( filter_argument_count > 1 ) ? filter_argument_array[ 1 ].GetInteger() : 100
                                          ).to!string();
                            }
                            else if ( filter_name == "time" )
                            {
                                template_part
                                    = Random.MakeTime(
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetNatural() : 0,
                                          ( filter_argument_count > 1 ) ? filter_argument_array[ 1 ].GetNatural() : 23
                                          ).to!string();
                            }
                            else if ( filter_name == "blob" )
                            {
                                template_part
                                    = Random.MakeBlob(
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetInteger() : 0
                                          ).to!string();
                            }
                            else if ( filter_name == "uuid" )
                            {
                                template_part = Random.MakeUuid();
                            }
                            else if ( filter_name == "isbn" )
                            {
                                template_part = Random.MakeIsbn();
                            }
                            else if ( filter_name == "tag_list" )
                            {
                                template_part
                                    = Random.MakeTagList(
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetInteger() : 5,
                                          ( filter_argument_count > 1 ) ? filter_argument_array[ 1 ].GetInteger() : 10
                                          );
                            }
                            else if ( filter_name == "english" )
                            {
                                template_part
                                    = Random.MakeText(
                                          "english",
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetInteger() : 3,
                                          ( filter_argument_count > 1 ) ? filter_argument_array[ 1 ].GetInteger() : 5,
                                          ( filter_argument_count > 2 ) ? filter_argument_array[ 2 ].GetInteger() : 7,
                                          ( filter_argument_count > 3 ) ? filter_argument_array[ 3 ].GetInteger() : 9
                                          );
                            }
                            else if ( filter_name == "french" )
                            {
                                template_part
                                    = Random.MakeText(
                                          "french",
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetInteger() : 3,
                                          ( filter_argument_count > 1 ) ? filter_argument_array[ 1 ].GetInteger() : 5,
                                          ( filter_argument_count > 2 ) ? filter_argument_array[ 2 ].GetInteger() : 7,
                                          ( filter_argument_count > 3 ) ? filter_argument_array[ 3 ].GetInteger() : 9
                                          );
                            }
                            else if ( filter_name == "german" )
                            {
                                template_part
                                    = Random.MakeText(
                                          "german",
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetInteger() : 3,
                                          ( filter_argument_count > 1 ) ? filter_argument_array[ 1 ].GetInteger() : 5,
                                          ( filter_argument_count > 2 ) ? filter_argument_array[ 2 ].GetInteger() : 7,
                                          ( filter_argument_count > 3 ) ? filter_argument_array[ 3 ].GetInteger() : 9
                                          );
                            }
                            else if ( filter_name == "latin" )
                            {
                                template_part
                                    = Random.MakeText(
                                          "latin",
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetInteger() : 3,
                                          ( filter_argument_count > 1 ) ? filter_argument_array[ 1 ].GetInteger() : 5,
                                          ( filter_argument_count > 2 ) ? filter_argument_array[ 2 ].GetInteger() : 7,
                                          ( filter_argument_count > 3 ) ? filter_argument_array[ 3 ].GetInteger() : 9
                                          );
                            }
                            else if ( filter_name == "spanish" )
                            {
                                template_part
                                    = Random.MakeText(
                                          "spanish",
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetInteger() : 3,
                                          ( filter_argument_count > 1 ) ? filter_argument_array[ 1 ].GetInteger() : 5,
                                          ( filter_argument_count > 2 ) ? filter_argument_array[ 2 ].GetInteger() : 7,
                                          ( filter_argument_count > 3 ) ? filter_argument_array[ 3 ].GetInteger() : 9
                                          );
                            }
                            else if ( filter_name == "name" )
                            {
                                template_part
                                    = Random.MakeName(
                                          ( filter_argument_count > 0 ) ? filter_argument_array[ 0 ].GetInteger() : 4,
                                          ( filter_argument_count > 1 ) ? filter_argument_array[ 1 ].GetInteger() : 8
                                          ).to!string();
                            }
                            else if ( filter_name == "first_name"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeFirstName();
                            }
                            else if ( filter_name == "last_name"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeLastName();
                            }
                            else if ( filter_name == "full_name"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeFullName();
                            }
                            else if ( filter_name == "password"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakePassword();
                            }
                            else if ( filter_name == "phone_number"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakePhoneNumber();
                            }
                            else if ( filter_name == "street_name"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeStreetName();
                            }
                            else if ( filter_name == "street_address"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeStreetAddress();
                            }
                            else if ( filter_name == "city_code"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeCityCode();
                            }
                            else if ( filter_name == "city_name"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeCityName();
                            }
                            else if ( filter_name == "region_name"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeRegionName();
                            }
                            else if ( filter_name == "country_name"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeCountryName();
                            }
                            else if ( filter_name == "country_code"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeCountryCode();
                            }
                            else if ( filter_name == "company_name"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeCompanyName();
                            }
                            else if ( filter_name == "image_file_name"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeImageFileName();
                            }
                            else if ( filter_name == "audio_file_name"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeAudioFileName();
                            }
                            else if ( filter_name == "video_file_name"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeVideoFileName();
                            }
                            else if ( filter_name == "file_name"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeFileName();
                            }
                            else if ( filter_name == "folder_path"
                                      && filter_argument_count == 0 )
                            {
                                template_part = Random.MakeFolderPath();
                            }
                            else if ( filter_name == "floor"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetReal().floor().to!string();
                            }
                            else if ( filter_name == "floor"
                                      && filter_argument_count == 1 )
                            {
                                precision = filter_argument_array[ 0 ].GetReal();
                                template_part = ( ( template_part.GetReal() / precision ).floor() * precision ).to!string();
                            }
                            else if ( filter_name == "ceil"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetReal().ceil().to!string();
                            }
                            else if ( filter_name == "ceil"
                                      && filter_argument_count == 1 )
                            {
                                precision = filter_argument_array[ 0 ].GetReal();
                                template_part = ( ( template_part.GetReal() / precision ).ceil() * precision ).to!string();
                            }
                            else if ( filter_name == "round"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetReal().round().to!string();
                            }
                            else if ( filter_name == "round"
                                      && filter_argument_count == 1 )
                            {
                                precision = filter_argument_array[ 0 ].GetReal();
                                template_part = ( ( template_part.GetReal() / precision ).round() * precision ).to!string();
                            }
                            else if ( filter_name == "add"
                                      && filter_argument_count == 1 )
                            {
                                filter_argument = filter_argument_array[ 0 ];

                                if ( Column.HasColumnValue( filter_argument ) )
                                {
                                    filter_argument = Column.GetColumnValue( filter_argument, row_index );
                                }

                                if ( template_part.IsInteger()
                                     && filter_argument.IsInteger() )
                                {
                                    template_part = ( template_part.GetInteger() + filter_argument.GetInteger() ).to!string();
                                }
                                else
                                {
                                    template_part = ( template_part.GetReal() + filter_argument.GetReal() ).to!string();
                                }
                            }
                            else if ( filter_name == "add"
                                      && filter_argument_count == 2 )
                            {
                                if ( template_part.IsInteger()
                                     && filter_argument_array[ 0 ].IsInteger()
                                     && filter_argument_array[ 1 ].IsInteger() )
                                {
                                    integer_value
                                        = Random.MakeInteger(
                                              filter_argument_array[ 0 ].GetInteger(),
                                              filter_argument_array[ 1 ].GetInteger()
                                              );

                                    template_part = ( template_part.GetInteger() + integer_value ).to!string();
                                }
                                else
                                {
                                    real_value
                                        = Random.MakeReal(
                                              filter_argument_array[ 0 ].GetReal(),
                                              filter_argument_array[ 1 ].GetReal()
                                              );

                                    template_part = ( template_part.GetReal() + real_value ).to!string();
                                }
                            }
                            else if ( filter_name == "add_product"
                                      && filter_argument_count >= 2 )
                            {
                                real_value = 1.0;

                                foreach ( factor_argument; filter_argument_array )
                                {
                                    if ( Column.HasColumnValue( factor_argument ) )
                                    {
                                        real_value *= Column.GetColumnValue( factor_argument, row_index ).GetReal();
                                    }
                                    else
                                    {
                                        real_value *= factor_argument.GetReal();
                                    }
                                }

                                template_part = ( template_part.GetReal() + real_value ).to!string();
                            }
                            else if ( filter_name == "substract"
                                      && filter_argument_count == 1 )
                            {
                                filter_argument = filter_argument_array[ 0 ];

                                if ( Column.HasColumnValue( filter_argument ) )
                                {
                                    filter_argument = Column.GetColumnValue( filter_argument, row_index );
                                }

                                if ( template_part.IsInteger()
                                     && filter_argument.IsInteger() )
                                {
                                    template_part = ( template_part.GetInteger() - filter_argument.GetInteger() ).to!string();
                                }
                                else
                                {
                                    template_part = ( template_part.GetReal() - filter_argument.GetReal() ).to!string();
                                }
                            }
                            else if ( filter_name == "substract"
                                      && filter_argument_count == 2 )
                            {
                                if ( template_part.IsInteger()
                                     && filter_argument_array[ 0 ].IsInteger()
                                     && filter_argument_array[ 1 ].IsInteger() )
                                {
                                    integer_value
                                        = Random.MakeInteger(
                                              filter_argument_array[ 0 ].GetInteger(),
                                              filter_argument_array[ 1 ].GetInteger()
                                              );

                                    template_part = ( template_part.GetInteger() - integer_value ).to!string();
                                }
                                else
                                {
                                    real_value
                                        = Random.MakeReal(
                                              filter_argument_array[ 0 ].GetReal(),
                                              filter_argument_array[ 1 ].GetReal()
                                              );

                                    template_part = ( template_part.GetReal() - real_value ).to!string();
                                }
                            }
                            else if ( filter_name == "substract_product"
                                      && filter_argument_count >= 2 )
                            {
                                real_value = 1.0;

                                foreach ( factor_argument; filter_argument_array )
                                {
                                    if ( Column.HasColumnValue( factor_argument ) )
                                    {
                                        real_value *= Column.GetColumnValue( factor_argument, row_index ).GetReal();
                                    }
                                    else
                                    {
                                        real_value *= factor_argument.GetReal();
                                    }
                                }

                                template_part = ( template_part.GetReal() - real_value ).to!string();
                            }
                            else if ( filter_name == "multiply"
                                      && filter_argument_count == 1 )
                            {
                                filter_argument = filter_argument_array[ 0 ];

                                if ( Column.HasColumnValue( filter_argument ) )
                                {
                                    filter_argument = Column.GetColumnValue( filter_argument, row_index );
                                }

                                if ( template_part.IsInteger()
                                     && filter_argument.IsInteger() )
                                {
                                    template_part = ( template_part.GetInteger() * filter_argument.GetInteger() ).to!string();
                                }
                                else
                                {
                                    template_part = ( template_part.GetReal() * filter_argument.GetReal() ).to!string();
                                }
                            }
                            else if ( filter_name == "multiply"
                                      && filter_argument_count == 2 )
                            {
                                if ( template_part.IsInteger()
                                     && filter_argument_array[ 0 ].IsInteger()
                                     && filter_argument_array[ 1 ].IsInteger() )
                                {
                                    integer_value
                                        = Random.MakeInteger(
                                              filter_argument_array[ 0 ].GetInteger(),
                                              filter_argument_array[ 1 ].GetInteger()
                                              );

                                    template_part = ( template_part.GetInteger() * integer_value ).to!string();
                                }
                                else
                                {
                                    real_value
                                        = Random.MakeReal(
                                              filter_argument_array[ 0 ].GetReal(),
                                              filter_argument_array[ 1 ].GetReal()
                                              );

                                    template_part = ( template_part.GetReal() * real_value ).to!string();
                                }
                            }
                            else if ( filter_name == "divide"
                                      && filter_argument_count == 1 )
                            {
                                filter_argument = filter_argument_array[ 0 ];

                                if ( Column.HasColumnValue( filter_argument ) )
                                {
                                    filter_argument = Column.GetColumnValue( filter_argument, row_index );
                                }

                                if ( template_part.IsInteger()
                                     && filter_argument.IsInteger() )
                                {
                                    template_part = ( template_part.GetInteger() / filter_argument.GetInteger() ).to!string();
                                }
                                else
                                {
                                    template_part = ( template_part.GetReal() / filter_argument.GetReal() ).to!string();
                                }
                            }
                            else if ( filter_name == "divide"
                                      && filter_argument_count == 2 )
                            {
                                if ( template_part.IsInteger()
                                     && filter_argument_array[ 0 ].IsInteger()
                                     && filter_argument_array[ 1 ].IsInteger() )
                                {
                                    integer_value
                                        = Random.MakeInteger(
                                              filter_argument_array[ 0 ].GetInteger(),
                                              filter_argument_array[ 1 ].GetInteger()
                                              );

                                    template_part = ( template_part.GetInteger() / integer_value ).to!string();
                                }
                                else
                                {
                                    real_value
                                        = Random.MakeReal(
                                              filter_argument_array[ 0 ].GetReal(),
                                              filter_argument_array[ 1 ].GetReal()
                                              );

                                    template_part = ( template_part.GetReal() / real_value ).to!string();
                                }
                            }
                            else if ( filter_name == "add_prefix"
                                      && filter_argument_count == 1 )
                            {
                                template_part = template_part.AddPrefix( filter_argument_array[ 0 ] );
                            }
                            else if ( filter_name == "remove_prefix"
                                      && filter_argument_count == 1 )
                            {
                                template_part = template_part.RemovePrefix( filter_argument_array[ 0 ] );
                            }
                            else if ( filter_name == "replace_prefix"
                                      && filter_argument_count == 2)
                            {
                                template_part = template_part.ReplacePrefix( filter_argument_array[ 0 ], filter_argument_array[ 1 ] );
                            }
                            else if ( filter_name == "add_suffix"
                                      && filter_argument_count == 1 )
                            {
                                template_part = template_part.AddSuffix( filter_argument_array[ 0 ] );
                            }
                            else if ( filter_name == "remove_suffix"
                                      && filter_argument_count == 1 )
                            {
                                template_part = template_part.RemoveSuffix( filter_argument_array[ 0 ] );
                            }
                            else if ( filter_name == "replace_suffix"
                                      && filter_argument_count == 2)
                            {
                                template_part = template_part.ReplaceSuffix( filter_argument_array[ 0 ], filter_argument_array[ 1 ] );
                            }
                            else if ( filter_name == "remove"
                                      && filter_argument_count == 1 )
                            {
                                template_part = template_part.replace( filter_argument_array[ 0 ], "" );
                            }
                            else if ( filter_name == "replace"
                                      && filter_argument_count == 2 )
                            {
                                template_part = template_part.replace( filter_argument_array[ 0 ], filter_argument_array[ 1 ] );
                            }
                            else if ( filter_name == "upper_case"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.toUpper();
                            }
                            else if ( filter_name == "lower_case"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.toLower();
                            }
                            else if ( filter_name == "pascal_case"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetPascalCaseText();
                            }
                            else if ( filter_name == "snake_case"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetSnakeCaseText();
                            }
                            else if ( filter_name == "kebab_case"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetKebabCaseText();
                            }
                            else if ( filter_name == "type_case"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetTypeCaseText();
                            }
                            else if ( filter_name == "attribute_case"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetAttributeCaseText();
                            }
                            else if ( filter_name == "variable_case"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetVariableCaseText();
                            }
                            else if ( filter_name == "style_case"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetStyleCaseText();
                            }
                            else if ( filter_name == "sentence_case"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetSentenceCaseText();
                            }
                            else if ( filter_name == "locution_case"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetLocutionCaseText();
                            }
                            else if ( filter_name == "slug_case"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetSlugCaseText();
                            }
                            else if ( filter_name == "plural"
                                      && filter_argument_count == 0 )
                            {
                                template_part = template_part.GetPluralText();
                            }
                            else if ( filter_name == "fetch"
                                      && filter_argument_count == 3 )
                            {
                                template_part
                                    = Schema.FindColumnValue(
                                          filter_argument_array[ 0 ],
                                          filter_argument_array[ 1 ],
                                          template_part,
                                          filter_argument_array[ 2 ]
                                          );
                            }
                            else if ( filter_name == "switch"
                                      && filter_argument_count >= 3 )
                            {
                                filter_argument = filter_argument_array[ 0 ];

                                if ( filter_argument == "this" )
                                {
                                    filter_argument = template_part;
                                }
                                else if ( Column.HasColumnValue( filter_argument ) )
                                {
                                    filter_argument = Column.GetColumnValue( filter_argument, row_index );
                                }

                                for ( filter_argument_index = 1;
                                      filter_argument_index + 1 < filter_argument_array.length;
                                      ++filter_argument_index )
                                {
                                    if ( filter_argument == filter_argument_array[ filter_argument_index ] )
                                    {
                                        template_part = filter_argument_array[ filter_argument_index + 1 ];

                                        break;
                                    }
                                }
                            }
                            else if ( filter_name == "if"
                                      && filter_argument_count == 1 )
                            {
                                filter_argument = filter_argument_array[ 0 ];

                                if ( filter_argument == "this" )
                                {
                                    filter_argument = template_part;
                                }
                                else if ( Column.HasColumnValue( filter_argument ) )
                                {
                                    filter_argument = Column.GetColumnValue( filter_argument, row_index );
                                }

                                if ( filter_argument != "false"
                                     && filter_argument != "0" )
                                {
                                    ++filter_index;
                                }
                            }
                            else if ( filter_name == "if"
                                      && filter_argument_count >= 3 )
                            {
                                filter_argument = filter_argument_array[ 0 ];

                                if ( filter_argument == "this" )
                                {
                                    filter_argument = template_part;
                                }
                                else if ( Column.HasColumnValue( filter_argument ) )
                                {
                                    filter_argument = Column.GetColumnValue( filter_argument, row_index );
                                }

                                other_filter_argument = filter_argument_array[ 2 ];

                                if ( other_filter_argument == "this" )
                                {
                                    other_filter_argument = template_part;
                                }
                                else if ( Column.HasColumnValue( other_filter_argument ) )
                                {
                                    other_filter_argument = Column.GetColumnValue( other_filter_argument, row_index );
                                }

                                if ( !( ( filter_argument_array[ 1 ] == "="
                                           && filter_argument == other_filter_argument )
                                        || ( filter_argument_array[ 1 ] == "!="
                                             && filter_argument != other_filter_argument )
                                        || ( filter_argument_array[ 1 ] == "contains"
                                             && filter_argument.indexOf( other_filter_argument ) >= 0 )
                                        || ( filter_argument_array[ 1 ] == "!contains"
                                             && filter_argument.indexOf( other_filter_argument ) < 0 )
                                        || ( filter_argument_array[ 1 ] == "has_prefix"
                                             && filter_argument.startsWith( other_filter_argument ) )
                                        || ( filter_argument_array[ 1 ] == "!has_prefix"
                                             && !filter_argument.startsWith( other_filter_argument ) )
                                        || ( filter_argument_array[ 1 ] == "has_suffix"
                                             && filter_argument.endsWith( other_filter_argument ) )
                                        || ( filter_argument_array[ 1 ] == "!has_suffix"
                                             && !filter_argument.endsWith( other_filter_argument ) ) ) )
                                {
                                    ++filter_index;
                                }
                            }
                            else if ( Column.HasColumnValue( filter_name ) )
                            {
                                template_part = Column.GetColumnValue( filter_name, row_index );
                            }
                            else
                            {
                                Abort( "Invalid filter : " ~ filter );
                            }
                        }
                    }
                }
            }

            return template_part_array.join( "" );
        }
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

class DATA_TOKEN
{
    // -- ATTRIBUTES

    string
        Text;
    bool
        IsSeparator;
    long
        Level;

    // -- CONSTRUCTORS

    this(
        )
    {
    }

    // ~~

    this(
        char character
        )
    {
        Text ~= character;
        IsSeparator = true;
    }
}

// ~~

string GetText(
    DATA_TOKEN[] data_token_array
    )
{
    string
        text;

    foreach ( data_token; data_token_array )
    {
        if ( data_token.IsSeparator )
        {
            if ( data_token.Text == "{" )
            {
                text ~= "{ ";
            }
            else if ( data_token.Text == "~" )
            {
                text ~= " ~ ";
            }
            else if ( data_token.Text == "}" )
            {
                text ~= " }";
            }
            else
            {
                text ~= data_token.Text;
            }
        }
        else
        {
            text ~= data_token.Text;
        }
    }

    return text;
}

// ~~

void Dump(
    DATA_TOKEN[] data_token_array
    )
{
    foreach ( data_token_index, data_token; data_token_array )
    {
        writeln(
            "[",
            data_token_index,
            "] ",
            data_token.Level,
            " ",
            data_token.IsSeparator,
            " : \"",
            data_token.Text,
            "\""
            );
    }
}

// ~~

class DATA_VALUE
{
    // -- ATTRIBUTES

    string
        Text;
    DATA_VALUE[]
        SubValueArray;
    bool
        IsList;

    // -- CONSTRUCTORS

    this(
        DATA_TOKEN[] data_token_array
        )
    {
        SetFromTokenArray( data_token_array );
    }

    // ~~

    this(
        string text
        )
    {
        SetFromText( text );
    }

    // -- INQUIRIES

    string GetText(
        )
    {
        string
            text;

        if ( IsList )
        {
            text = "{ ";

            foreach ( sub_data_value_index, sub_data_value; SubValueArray )
            {
                if ( sub_data_value_index > 0 )
                {
                    text ~= " ~ ";
                }

                text ~= sub_data_value.GetText();
            }

            text ~= " }";

            return text;
        }
        else
        {
            return Text;
        }
    }

    // -- OPERATIONS

    void ProcessTokenArray(
        DATA_TOKEN[] data_token_array
        )
    {
        char
            character;
        long
            character_index,
            level;
        string
            text;

        foreach ( data_token; data_token_array )
        {
            if ( data_token.IsSeparator
                 && data_token.Text == "}" )
            {
                --level;
            }

            data_token.Level = level;

            if ( data_token.IsSeparator
                 && data_token.Text == "{" )
            {
                ++level;
            }

            if ( !data_token.IsSeparator )
            {
                text = data_token.Text.strip();

                data_token.Text = "";

                for ( character_index = 0;
                      character_index < text.length;
                      ++character_index )
                {
                    character = text[ character_index ];

                    if ( character == '^' )
                    {
                        data_token.Text ~= ' ';
                    }
                    else if ( character == '\\'
                              && character_index + 1 < text.length )
                    {
                        ++character_index;

                        data_token.Text ~= text[ character_index ];
                    }
                    else
                    {
                        data_token.Text ~= character;
                    }
                }
            }
        }
    }

    // ~~

    DATA_TOKEN[] GetTokenArray(
        string text
        )
    {
        char
            character;
        long
            character_index;
        DATA_TOKEN
            data_token;
        DATA_TOKEN[]
            data_token_array;

        for ( character_index = 0;
              character_index < text.length;
              ++character_index )
        {
            character = text[ character_index ];

            if ( character == '~'
                 || character == '{'
                 || character == '}' )
            {
                data_token_array ~= new DATA_TOKEN( character );

                while ( character_index + 1 < text.length
                        && text[ character_index + 1 ] == ' ' )
                {
                    ++character_index;
                }
            }
            else
            {
                if ( data_token_array.length == 0
                     || data_token_array[ $ - 1 ].IsSeparator )
                {
                    data_token_array ~= new DATA_TOKEN();
                }

                data_token = data_token_array[ $ - 1 ];
                data_token.Text ~= character;

                if ( character == '\\'
                     && character_index + 1 < text.length )
                {
                    ++character_index;

                    data_token.Text ~= text[ character_index ];
                }
            }
        }

        ProcessTokenArray( data_token_array );

        return data_token_array;
    }

    // ~~

    void SetFromTokenArray(
        DATA_TOKEN[] data_token_array
        )
    {
        bool
            it_is_last_data_token;
        long
            data_token_index,
            level,
            next_data_token_index;
        DATA_TOKEN
            next_data_token;

        if ( data_token_array.length > 0
             && data_token_array[ 0 ].IsSeparator
             && data_token_array[ 0 ].Text == "{" )
        {
            level = data_token_array[ 0 ].Level;

            if ( data_token_array[ $ - 1 ].IsSeparator
                 && data_token_array[ $ - 1 ].Text == "}"
                 && data_token_array[ $ - 1 ].Level == level )
            {
                IsList = true;
                SubValueArray = null;

                data_token_array = data_token_array[ 1 .. $ - 1 ];

                for ( data_token_index = 0;
                      data_token_index < data_token_array.length;
                      ++data_token_index )
                {
                    it_is_last_data_token = false;

                    for ( next_data_token_index = data_token_index;
                          next_data_token_index < data_token_array.length;
                          ++next_data_token_index )
                    {
                        next_data_token = data_token_array[ next_data_token_index ];

                        if ( next_data_token.IsSeparator
                             && next_data_token.Text == "~"
                             && next_data_token.Level == level + 1 )
                        {
                            it_is_last_data_token = ( next_data_token_index + 1 == data_token_array.length );

                            break;
                        }
                    }

                    SubValueArray ~= new DATA_VALUE( data_token_array[ data_token_index .. next_data_token_index ] );

                    data_token_index = next_data_token_index;

                    if ( it_is_last_data_token )
                    {
                        SubValueArray ~= new DATA_VALUE( data_token_array[ $ .. $ ] );
                    }
                }

            }
            else
            {
                Abort( "Invalid list data : " ~ data_token_array.GetText() );
            }
        }
        else if ( data_token_array.length == 1
                  && !data_token_array[ 0 ].IsSeparator )
        {
            IsList = false;

            Text = data_token_array[ 0 ].Text;
        }
        else if ( data_token_array.length == 0 )
        {
            IsList = false;

            Text = "";
        }
        else
        {
            Abort( "Invalid data : " ~ data_token_array.GetText() );
        }
    }

    // ~~

    void SetFromText(
        string text
        )
    {
        DATA_TOKEN[]
            data_token_array;

        data_token_array = GetTokenArray( text );

        SetFromTokenArray( data_token_array );
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

        foreach ( sub_type; type.SubTypeArray )
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

    // ~~

    string GetSqlText(
        bool it_is_sub_value = false,
        bool it_is_dump_value = false
        )
    {
        string
            sql_text,
            type_name;

        type_name = Type.ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            if ( Text == "1"
                 || Text == "true" )
            {
                return "1";
            }
            else
            {
                return "0";
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
            return Text;
        }
        else if ( type_name == "TUPLE" )
        {
            foreach ( sub_value_index, ref sub_value; SubValueArray )
            {
                if ( sub_value_index > 0 )
                {
                    sql_text ~= ",";
                }

                sql_text ~= sub_value.GetSqlText( true, it_is_dump_value );
            }

            sql_text = "[" ~ sql_text ~ "]";
        }
        else if ( type_name == "LIST" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    sql_text ~= ",";
                }

                sql_text ~= element_value.GetSqlText( true, it_is_dump_value );
            }

            sql_text = "[" ~ sql_text ~ "]";
        }
        else if ( type_name == "SET" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    sql_text ~= ",";
                }

                sql_text ~= element_value.GetSqlText( true, it_is_dump_value );
            }

            sql_text = "[" ~ sql_text ~ "]";
        }
        else if ( type_name == "MAP" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    sql_text ~= ",";
                }

                sql_text ~= KeyValueArray[ element_value_index ].GetSqlText( true, it_is_dump_value ) ~ ":" ~ element_value.GetSqlText( true, it_is_dump_value );
            }

            sql_text = "{" ~ sql_text ~ "}";
        }
        else
        {
            sql_text = Text;
        }

        if ( it_is_dump_value )
        {
            if ( !it_is_sub_value )
            {
                sql_text = sql_text.replace( "'", "\\'" ).replace( "\"", "\\\"" );
            }

            return "'" ~ sql_text ~ "'";
        }
        else
        {
            if ( !it_is_sub_value )
            {
                sql_text = sql_text.replace( "\"", "\\\"" );
            }

            return "\"" ~ sql_text ~ "\"";
        }
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
            if ( Text == "1"
                 || Text == "true" )
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
        else if ( type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME" )
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

    // ~~

    string GetJsonText(
        )
    {
        string
            json_text,
            type_name;

        type_name = Type.ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            if ( Text == "1"
                 || Text == "true" )
            {
                json_text = "true";
            }
            else
            {
                json_text = "false";
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
            json_text = Text;
        }
        else if ( type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME"
                  || type_name == "UUID"
                  || type_name == "BLOB" )
        {
            json_text = "\"" ~ Text ~ "\"";
        }
        else if ( type_name == "TUPLE" )
        {
            foreach ( sub_value_index, ref sub_value; SubValueArray )
            {
                if ( sub_value_index > 0 )
                {
                    json_text ~= ",";
                }

                json_text ~= sub_value.GetJsonText();
            }

            json_text = "[" ~ json_text ~ "]";
        }
        else if ( type_name == "LIST"
                  || type_name == "SET" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    json_text ~= ",";
                }

                json_text ~= element_value.GetJsonText();
            }

            json_text = "[" ~ json_text ~ "]";
        }
        else if ( type_name == "MAP" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    json_text ~= ",";
                }

                json_text ~= KeyValueArray[ element_value_index ].GetJsonText() ~ ":" ~ element_value.GetJsonText();
            }

            json_text = "{" ~ json_text ~ "}";
        }
        else
        {
            json_text = "\"" ~ Text.replace( "\"", "\\\"" ) ~ "\"";
        }

        return json_text;
    }

    // ~~

    string GetPhpText(
        )
    {
        string
            php_text,
            type_name;

        type_name = Type.ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            if ( Text == "1"
                 || Text == "true" )
            {
                php_text = "true";
            }
            else
            {
                php_text = "false";
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
            php_text = Text;
        }
        else if ( type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME"
                  || type_name == "UUID"
                  || type_name == "BLOB" )
        {
            php_text = "\"" ~ Text ~ "\"";
        }
        else if ( type_name == "TUPLE" )
        {
            foreach ( sub_value_index, ref sub_value; SubValueArray )
            {
                if ( sub_value_index > 0 )
                {
                    php_text ~= ", ";
                }

                php_text ~= sub_value.GetPhpText();
            }

            php_text = "array( " ~ php_text ~ " )";
        }
        else if ( type_name == "LIST"
                  || type_name == "SET" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    php_text ~= ", ";
                }

                php_text ~= element_value.GetPhpText();
            }

            php_text = "array( " ~ php_text ~ " )";
        }
        else if ( type_name == "MAP" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    php_text ~= ", ";
                }

                php_text ~= KeyValueArray[ element_value_index ].GetPhpText() ~ " => " ~ element_value.GetPhpText();
            }

            php_text = "array( " ~ php_text ~ " )";
        }
        else
        {
            php_text = "\"" ~ Text.replace( "\"", "\\\"" ) ~ "\"";
        }

        if ( php_text == "array(  )" )
        {
            php_text = "array()";
        }

        return php_text;
    }

    // ~~

    string GetJavascriptText(
        )
    {
        string
            javascript_text,
            type_name;

        type_name = Type.ActualType.BaseName;

        if ( type_name == "BOOL" )
        {
            if ( Text == "1"
                 || Text == "true" )
            {
                javascript_text = "true";
            }
            else
            {
                javascript_text = "false";
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
            javascript_text = Text;
        }
        else if ( type_name == "DATETIME"
                  || type_name == "DATE"
                  || type_name == "TIME"
                  || type_name == "UUID"
                  || type_name == "BLOB" )
        {
            javascript_text = "\"" ~ Text ~ "\"";
        }
        else if ( type_name == "TUPLE" )
        {
            foreach ( sub_value_index, ref sub_value; SubValueArray )
            {
                if ( sub_value_index > 0 )
                {
                    javascript_text ~= ", ";
                }

                javascript_text ~= sub_value.GetJavascriptText();
            }

            javascript_text = "[ " ~ javascript_text ~ " ]";
        }
        else if ( type_name == "LIST"
                  || type_name == "SET" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    javascript_text ~= ", ";
                }

                javascript_text ~= element_value.GetJavascriptText();
            }

            javascript_text = "[ " ~ javascript_text ~ " ]";
        }
        else if ( type_name == "MAP" )
        {
            foreach ( element_value_index, ref element_value; ElementValueArray )
            {
                if ( element_value_index > 0 )
                {
                    javascript_text ~= ", ";
                }

                javascript_text ~= KeyValueArray[ element_value_index ].GetJavascriptText() ~ " : " ~ element_value.GetJavascriptText();
            }

            javascript_text = "{ " ~ javascript_text ~ " }";
        }
        else
        {
            javascript_text = "\"" ~ Text.replace( "\"", "\\\"" ) ~ "\"";
        }

        if ( javascript_text == "[  ]" )
        {
            javascript_text = "[]";
        }
        else if ( javascript_text == "{  }" )
        {
            javascript_text = "{}";
        }

        return javascript_text;
    }

    // ~~

    string GetText(
        )
    {
        string
            text,
            type_name;

        text = GetCqlText();
        type_name = Type.ActualType.BaseName;

        if ( type_name == "INT64" )
        {
            foreach ( id_text, id; Random.IdMap )
            {
                if ( id == Text )
                {
                    text = "%" ~ id_text;

                    break;
                }
            }
        }
        else if ( type_name == "UUID" )
        {
            if ( Text == "00000000-0000-0000-0000-000000000000" )
            {
                text = "#";
            }
            else
            {
                foreach ( uuid_text, uuid; Random.UuidMap )
                {
                    if ( uuid == Text )
                    {
                        text = "#" ~ uuid_text;

                        break;
                    }
                }
            }
        }

        return text;
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

    void Set(
        string text
        )
    {
        Text = text;
    }

    // ~~

    void Set(
        DATA_VALUE data_value
        )
    {
        string
            type_name;
        VALUE
            element_value,
            key_value,
            sub_value;

        type_name = Type.ActualType.BaseName;

        Text = "";
        SubValueArray = null;
        KeyValueArray = null;
        ElementValueArray = null;

        if ( type_name == "LIST"
             || type_name == "SET"
             || type_name == "TUPLE"
             || type_name == "MAP" )
        {
            if ( data_value.IsList )
            {
                if ( type_name == "TUPLE" )
                {
                    foreach ( sub_data_value; data_value.SubValueArray )
                    {
                        sub_value = new VALUE( Type.SubTypeArray[ 0 ] );
                        sub_value.Set( sub_data_value );
                        SubValueArray ~= sub_value;
                    }
                }
                else if ( type_name == "MAP" )
                {
                    foreach ( sub_data_value; data_value.SubValueArray )
                    {
                        key_value = new VALUE( Type.SubTypeArray[ 0 ] );
                        element_value = new VALUE( Type.SubTypeArray[ 1 ] );

                        if ( sub_data_value.IsList
                             && sub_data_value.SubValueArray.length == 2 )
                        {
                            key_value.Set( sub_data_value.SubValueArray[ 0 ] );
                            KeyValueArray ~= key_value;

                            element_value.Set( sub_data_value.SubValueArray[ 1 ] );
                            ElementValueArray ~= element_value;
                        }
                        else
                        {
                            Abort( "Invalid map data : " ~ data_value.GetText() );
                        }
                    }
                }
                else
                {
                    foreach ( sub_data_value; data_value.SubValueArray )
                    {
                        element_value = new VALUE( Type.SubTypeArray[ 0 ] );
                        element_value.Set( sub_data_value );

                        ElementValueArray ~= element_value;
                    }
                }
            }
            else
            {
                Abort( "Invalid list data : " ~ data_value.GetText() );
            }
        }
        else if ( type_name == "INT64"
                  && data_value.Text.startsWith( '%' ) )
        {
            Text = Random.MakeId( data_value.Text[ 1 .. $ ] );
        }
        else if ( type_name == "UUID"
                  && data_value.Text.startsWith( '#' ) )
        {
            Text = Random.MakeUuid( data_value.Text[ 1 .. $ ] );
        }
        else if ( type_name == "STRING"
                  && data_value.Text == "×" )
        {
            Text = "";
        }
        else
        {
            Text = data_value.Text;
        }
    }

    // ~~

    void SetDefault(
        )
    {
        string
            type_name;

        type_name = Type.ActualType.BaseName;

        Text = "";
        SubValueArray = null;
        KeyValueArray = null;
        ElementValueArray = null;

        if ( type_name == "BOOL" )
        {
            Text = "false";
        }
        else if ( type_name == "INT8"
                  || type_name == "UINT8"
                  || type_name == "INT16"
                  || type_name == "UINT16"
                  || type_name == "INT32"
                  || type_name == "UINT32"
                  || type_name == "INT64"
                  || type_name == "UINT64" )
        {
            Text = "0";
        }
        else if ( type_name == "FLOAT32"
                  || type_name == "FLOAT64" )
        {
            Text = "0.0";
        }
        else if ( type_name == "DATETIME" )
        {
            Text = "1970-01-01 00:00:00";
        }
        else if ( type_name == "DATE" )
        {
            Text = "1970-01-01";
        }
        else if ( type_name == "UUID" )
        {
            Text = "00000000-0000-0000-0000-000000000000";
        }
        else if ( type_name == "POINTER" )
        {
            Text = "null";
        }
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

                if ( Type.ForeignColumn.ValueArray.length == 0 )
                {
                    Abort( "Missing column value : " ~ Type.Name );
                }

                Set( Random.PickElement( Type.ForeignColumn.ValueArray ) );
            }
            else if ( Type.HasTemplateText )
            {
                Text = Type.GetTemplateValue( row_index );
            }
            else if ( Type.BaseName == "STRING"
                      || Type.BaseName == "STRING8"
                      || Type.BaseName == "STRING16"
                      || Type.BaseName == "STRING24"
                      || Type.BaseName == "STRING32" )
            {
                if ( Type.ColumnName.endsWith( "Title" ) )
                {
                    Text = Random.MakeTitle( "english", 4, 8 );
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

                    Text = Random.MakeSlug( Text );
                }
                else if ( Type.ColumnName.endsWith( "Text" ) )
                {
                    Text = Random.MakeText( "english", 3, 5, 7, 9 );
                }
                else if ( Type.ColumnName.endsWith( "Login" )
                          || Type.ColumnName.endsWith( "Pseudonym" )
                          || Type.ColumnName.endsWith( "Account" ) )
                {
                    prior_email = Type.Column.FindPriorColumnValue( "Email", row_index );

                    if ( prior_email != "" )
                    {
                        Text = Random.MakePseudonym( prior_email );
                    }
                    else
                    {
                        prior_first_name = Type.Column.FindPriorColumnValue( "FirstName", row_index );
                        prior_last_name = Type.Column.FindPriorColumnValue( "LastName", row_index );

                        Text = Random.MakePseudonym( prior_first_name, prior_last_name );
                    }
                }
                else if ( Type.ColumnName.endsWith( "Password" ) )
                {
                    Text = Random.MakePassword();
                }
                else if ( Type.ColumnName.endsWith( "Email" ) )
                {
                    prior_first_name = Type.Column.FindPriorColumnValue( "FirstName", row_index );
                    prior_last_name = Type.Column.FindPriorColumnValue( "LastName", row_index );

                    Text = Random.MakeEmail( prior_first_name, prior_last_name );
                }
                else if ( Type.ColumnName.endsWith( "Phone" )
                          || Type.ColumnName.endsWith( "PhoneNumber" ) )
                {
                    Text = Random.MakePhoneNumber();
                }
                else if ( Type.ColumnName.endsWith( "Street" )
                          || Type.ColumnName.endsWith( "StreetName" ) )
                {
                    Text = Random.MakeStreetName();
                }
                else if ( Type.ColumnName.endsWith( "Address" ) )
                {
                    Text = Random.MakeStreetAddress();
                }
                else if ( Type.ColumnName.endsWith( "CountryCode" ) )
                {
                    Text = Random.MakeCountryCode();
                }
                else if ( Type.ColumnName.endsWith( "Code" ) )
                {
                    Text = Random.MakeCityCode();
                }
                else if ( Type.ColumnName.endsWith( "City" )
                          || Type.ColumnName.endsWith( "CityName" ) )
                {
                    Text = Random.MakeCityName();
                }
                else if ( Type.ColumnName.endsWith( "Region" )
                          || Type.ColumnName.endsWith( "RegionName" ) )
                {
                    Text = Random.MakeRegionName();
                }
                else if ( Type.ColumnName.endsWith( "Country" )
                          || Type.ColumnName.endsWith( "CountryName" ) )
                {
                    Text = Random.MakeCountryName();
                }
                else if ( Type.ColumnName.endsWith( "Company" )
                          || Type.ColumnName.endsWith( "CompanyName" ) )
                {
                    Text = Random.MakeCompanyName();
                }
                else if ( Type.ColumnName.endsWith( "Image" )
                          || Type.ColumnName.endsWith( "Picture" )
                          || Type.ColumnName.endsWith( "Background" )
                          || Type.ColumnName.endsWith( "ImageName" )
                          || Type.ColumnName.endsWith( "PictureName" )
                          || Type.ColumnName.endsWith( "BackgroundName" ) )
                {
                    Text = Random.MakeImageFileName();
                }
                else if ( Type.ColumnName.endsWith( "Audio" )
                          || Type.ColumnName.endsWith( "Sound" )
                          || Type.ColumnName.endsWith( "Music" )
                          || Type.ColumnName.endsWith( "Clip" )
                          || Type.ColumnName.endsWith( "AudioName" )
                          || Type.ColumnName.endsWith( "SoundName" )
                          || Type.ColumnName.endsWith( "MusicName" )
                          || Type.ColumnName.endsWith( "ClipName" ) )
                {
                    Text = Random.MakeAudioFileName();
                }
                else if ( Type.ColumnName.endsWith( "Video" )
                          || Type.ColumnName.endsWith( "Movie" )
                          || Type.ColumnName.endsWith( "VideoName" )
                          || Type.ColumnName.endsWith( "MovieName" ) )
                {
                    Text = Random.MakeVideoFileName();
                }
                else if ( Type.ColumnName.endsWith( "File" )
                          || Type.ColumnName.endsWith( "FilePath" ) )
                {
                    Text = Random.MakeFileName();
                }
                else if ( Type.ColumnName.endsWith( "Folder" )
                          || Type.ColumnName.endsWith( "FolderPath" ) )
                {
                    Text = Random.MakeFolderPath();
                }
                else if ( Type.ColumnName.endsWith( "Author" )
                          || Type.ColumnName.endsWith( "AuthorName" ) )
                {
                    Text = Random.MakeFullName();
                }
                else if ( Type.ColumnName.endsWith( "Isbn" ) )
                {
                    Text = Random.MakeIsbn();
                }
                else if ( Type.ColumnName.endsWith( "Tags" )
                          || Type.ColumnName.endsWith( "TagList" ) )
                {
                    Text = Random.MakeTagList();
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
                            random_natural = random_natural & 127;
                        }
                        else if ( Type.BaseName == "UINT8" )
                        {
                            random_natural = random_natural & 255;
                        }
                        else if ( Type.BaseName == "INT16" )
                        {
                            random_natural = random_natural & 32767;
                        }
                        else if ( Type.BaseName == "UINT16" )
                        {
                            random_natural = random_natural & 65535;
                        }
                        else if ( Type.BaseName == "INT32" )
                        {
                            random_natural = random_natural & 2147483647;
                        }
                        else if ( Type.BaseName == "UINT32" )
                        {
                            random_natural = random_natural & 4294967295;
                        }
                        else if ( Type.BaseName == "INT64" )
                        {
                            random_natural = random_natural & 9223372036854775807;
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
            else if ( Type.BaseName == "DATETIME" )
            {
                Text = Random.MakeDate() ~ " " ~ Random.MakeTime();
            }
            else if ( Type.BaseName == "DATE" )
            {
                Text = Random.MakeDate();
            }
            else if ( Type.BaseName == "TIME" )
            {
                Text = Random.MakeTime();
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
                foreach ( sub_value; SubValueArray )
                {
                    sub_value.Make( row_index, row_count, true );
                }
            }
            else if ( Type.BaseName == "LIST" )
            {
                element_value_count = Type.GetElementValueCount();

                for ( element_value_index = ElementValueArray.length;
                      element_value_index < element_value_count;
                      ++element_value_index )
                {
                    ElementValueArray ~= new VALUE( Type.SubTypeArray[ 0 ] );
                    ElementValueArray[ element_value_index ].Make( row_index, row_count, true );
                }
            }
            else if ( Type.BaseName == "SET" )
            {
                element_value_count = Type.GetElementValueCount();

                for ( element_value_index = ElementValueArray.length;
                      element_value_index < element_value_count;
                      ++element_value_index )
                {
                    ElementValueArray ~= new VALUE( Type.SubTypeArray[ 0 ] );
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

                for ( element_value_index = ElementValueArray.length;
                      element_value_index < element_value_count;
                      ++element_value_index )
                {
                    KeyValueArray ~= new VALUE( Type.SubTypeArray[ 0 ] );
                    KeyValueArray[ element_value_index ].Make( row_index, row_count, true );

                    if ( IsPriorValue( KeyValueArray, element_value_index ) )
                    {
                        --element_value_index;
                    }
                    else
                    {
                        ElementValueArray ~= new VALUE( Type.SubTypeArray[ 1 ] );
                        ElementValueArray[ element_value_index ].Make( row_index, row_count, true );
                    }
                }
            }
            else
            {
                Abort( "Unknown type : " ~ Type.BaseName );
            }

            if ( Type.Capacity > 0
                 && Text.length > Type.Capacity )
            {
                Text.length = Type.Capacity;
            }
        }
        while ( !it_is_sub_value
                && Type.Column.IsUnique
                && Type.Column.HasPriorValue( this, row_index ) );
    }
}

// ~~

class PROPERTY
{
    // -- ATTRIBUTES

    string
        Name,
        Value;

    // -- CONSTRUCTORS

    this(
        string name,
        string value
        )
    {
        Name = name;
        Value = value;
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
    VALUE
        DefaultValue;
    long
        Index,
        OrderIndex;
    bool
        IsStored,
        IsAdded,
        IsEdited,
        IsUnique,
        IsKey,
        IsPartitioned,
        IsClustered,
        IsIndexed,
        IsFiltered,
        IsGrouped,
        IsMapped,
        IsAccessed,
        IsStatic,
        IsRequired,
        IsIncremented,
        IsConstrained,
        IsAscending,
        IsDescending,
        IsNow,
        IsForeign,
        IsProcessed,
        IsFirst,
        IsFirstKey,
        IsFirstNonKey,
        IsFirstStored,
        IsFirstNonStored,
        IsFirstStoredKey,
        IsFirstNonStoredKey,
        IsFirstStoredNonKey,
        IsFirstNonStoredNonKey,
        IsFirstAdded,
        IsFirstNonAdded,
        IsFirstAddedKey,
        IsFirstNonAddedKey,
        IsFirstAddedNonKey,
        IsFirstNonAddedNonKey,
        IsFirstEdited,
        IsFirstNonEdited,
        IsFirstEditedKey,
        IsFirstNonEditedKey,
        IsFirstEditedNonKey,
        IsFirstNonEditedNonKey,
        IsFirstIncremented,
        IsFirstNonIncremented,
        IsLast,
        IsLastKey,
        IsLastNonKey,
        IsLastStored,
        IsLastNonStored,
        IsLastStoredKey,
        IsLastNonStoredKey,
        IsLastStoredNonKey,
        IsLastNonStoredNonKey,
        IsLastAdded,
        IsLastNonAdded,
        IsLastAddedKey,
        IsLastNonAddedKey,
        IsLastAddedNonKey,
        IsLastNonAddedNonKey,
        IsLastEdited,
        IsLastNonEdited,
        IsLastEditedKey,
        IsLastNonEditedKey,
        IsLastEditedNonKey,
        IsLastNonEditedNonKey,
        IsLastIncremented,
        IsLastNonIncremented;
    string
        DefaultValueText;
    long
        MinimumRandomCount,
        MaximumRandomCount;
    VALUE[]
        ValueArray;
    long
        ValueCount;
    COLUMN
        ForeignColumn;
    string[ string ]
        PropertyValueMap;
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
        GenericAttribute,
        GenericVariable,
        GenericStyle,
        GenericTitle,
        GenericSentence,
        GenericLocution,
        GoName,
        GoType,
        GoAttribute,
        GoVariable,
        PhpName,
        PhpType,
        PhpParameterType,
        PhpAttribute,
        PhpVariable,
        PhpDefault,
        CrystalName,
        CrystalType,
        CsharpName,
        CsharpType,
        CsharpAttribute,
        CsharpVariable,
        RustName,
        RustType,
        JavascriptName,
        JavascriptAttribute,
        JavascriptVariable,
        JavascriptDefault;

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
        IsStored = table.IsStored;
        IsAdded = table.IsStored;
        IsEdited = table.IsEdited;
        MinimumRandomCount = table.RowCount;
        MaximumRandomCount = table.RowCount;
    }

    // -- INQUIRIES

    bool IsNatural(
        )
    {
        return Type.ActualType.IsNatural();
    }

    // ~~

    bool IsInteger(
        )
    {
        return Type.ActualType.IsInteger();
    }

    // ~~

    bool IsReal(
        )
    {
        return Type.ActualType.IsReal();
    }

    // ~~

    bool IsDateTime(
        )
    {
        return Type.ActualType.IsDateTime();
    }

    // ~~

    bool IsDate(
        )
    {
        return Type.ActualType.IsDate();
    }

    // ~~

    bool IsTime(
        )
    {
        return Type.ActualType.IsTime();
    }

    // ~~

    bool IsScalar(
        )
    {
        return Type.ActualType.IsScalar();
    }

    // ~~

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

    bool HasColumnValue(
        string column_name
        )
    {
        foreach ( column; Table.ColumnArray )
        {
            if ( column.IsStored
                 && column.Name == column_name )
            {
                return true;
            }
        }

        return false;
    }

    // ~~

    string GetColumnValue(
        string column_name,
        long row_index
        )
    {
        foreach ( column; Table.ColumnArray )
        {
            if ( column.IsStored
                 && column.Name == column_name )
            {
                column.MakeValues();

                return column.ValueArray[ row_index ].Text;
            }
        }

        return "";
    }

    // ~~

    long FindRowIndex(
        string value_text
        )
    {
        MakeValues();

        foreach ( row_index; 0 .. ValueArray.length )
        {
            if ( ValueArray[ row_index ].Text == value_text )
            {
                return row_index;
            }
        }

        return -1;
    }

    // ~~

    string FindValueText(
        long row_index
        )
    {
        MakeValues();

        if ( row_index < ValueArray.length )
        {
            return ValueArray[ row_index].Text;
        }
        else
        {
            return "";
        }
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

    void SetProperties(
        )
    {
        PropertyValueMap[ "name" ] = Name;
        PropertyValueMap[ "attribute" ] = GenericAttribute;
        PropertyValueMap[ "variable" ] = GenericVariable;
        PropertyValueMap[ "style" ] = GenericStyle;
        PropertyValueMap[ "title" ] = GenericTitle;
        PropertyValueMap[ "sentence" ] = GenericSentence;
        PropertyValueMap[ "locution" ] = GenericLocution;
        PropertyValueMap[ "stored_name" ] = StoredName;
        PropertyValueMap[ "stored_type" ] = StoredType;
        PropertyValueMap[ "cql_name" ] = CqlName;
        PropertyValueMap[ "cql_type" ] = CqlType;
        PropertyValueMap[ "sql_name" ] = SqlName;
        PropertyValueMap[ "sql_type" ] = SqlType;
        PropertyValueMap[ "go_name" ] = GoName;
        PropertyValueMap[ "go_type" ] = GoType;
        PropertyValueMap[ "go_attribute" ] = GoAttribute;
        PropertyValueMap[ "go_variable" ] = GoVariable;
        PropertyValueMap[ "php_name" ] = PhpName;
        PropertyValueMap[ "php_type" ] = PhpType;
        PropertyValueMap[ "php_attribute" ] = PhpAttribute;
        PropertyValueMap[ "php_variable" ] = PhpVariable;
        PropertyValueMap[ "php_default" ] = PhpDefault;
        PropertyValueMap[ "crystal_name" ] = CrystalName;
        PropertyValueMap[ "crystal_type" ] = CrystalType;
        PropertyValueMap[ "csharp_name" ] = CsharpName;
        PropertyValueMap[ "csharp_type" ] = CsharpType;
        PropertyValueMap[ "csharp_attribute" ] = CsharpAttribute;
        PropertyValueMap[ "csharp_variable" ] = CsharpVariable;
        PropertyValueMap[ "rust_name" ] = RustName;
        PropertyValueMap[ "rust_type" ] = RustType;
        PropertyValueMap[ "javascript_name" ] = JavascriptName;
        PropertyValueMap[ "javascript_attribute" ] = JavascriptAttribute;
        PropertyValueMap[ "javascript_variable" ] = JavascriptVariable;
        PropertyValueMap[ "javascript_default" ] = JavascriptDefault;
        PropertyValueMap[ "is_boolean" ] = GetBooleanText( Type.ActualType.IsBoolean() );
        PropertyValueMap[ "is_natural" ] = GetBooleanText( Type.ActualType.IsNatural() );
        PropertyValueMap[ "is_integer" ] = GetBooleanText( Type.ActualType.IsInteger() );
        PropertyValueMap[ "is_real" ] = GetBooleanText( Type.ActualType.IsReal() );
        PropertyValueMap[ "is_number" ] = GetBooleanText( Type.ActualType.IsNumber() );
        PropertyValueMap[ "is_string" ] = GetBooleanText( Type.ActualType.IsString() );
        PropertyValueMap[ "is_datetime" ] = GetBooleanText( Type.ActualType.IsDateTime() );
        PropertyValueMap[ "is_date" ] = GetBooleanText( Type.ActualType.IsDate() );
        PropertyValueMap[ "is_time" ] = GetBooleanText( Type.ActualType.IsTime() );
        PropertyValueMap[ "is_uuid" ] = GetBooleanText( Type.ActualType.IsUuid() );
        PropertyValueMap[ "is_scalar" ] = GetBooleanText( Type.ActualType.IsScalar() );
        PropertyValueMap[ "is_blob" ] = GetBooleanText( Type.ActualType.IsBlob() );
        PropertyValueMap[ "is_tuple" ] = GetBooleanText( Type.ActualType.IsTuple() );
        PropertyValueMap[ "is_list" ] = GetBooleanText( Type.ActualType.IsList() );
        PropertyValueMap[ "is_set" ] = GetBooleanText( Type.ActualType.IsSet() );
        PropertyValueMap[ "is_map" ] = GetBooleanText( Type.ActualType.IsMap() );
        PropertyValueMap[ "is_collection" ] = GetBooleanText( Type.ActualType.IsCollection() );
        PropertyValueMap[ "is_key" ] = GetBooleanText( IsKey );
        PropertyValueMap[ "is_stored" ] = GetBooleanText( IsStored );
        PropertyValueMap[ "is_non_stored" ] = GetBooleanText( !IsStored );
        PropertyValueMap[ "is_stored_key" ] = GetBooleanText( IsStored && IsKey );
        PropertyValueMap[ "is_non_stored_key" ] = GetBooleanText( !IsStored && IsKey );
        PropertyValueMap[ "is_stored_non_key" ] = GetBooleanText( IsStored && !IsKey );
        PropertyValueMap[ "is_non_stored_non_key" ] = GetBooleanText( !IsStored && !IsKey );
        PropertyValueMap[ "is_added" ] = GetBooleanText( IsAdded );
        PropertyValueMap[ "is_non_added" ] = GetBooleanText( !IsAdded );
        PropertyValueMap[ "is_added_key" ] = GetBooleanText( IsAdded && IsKey );
        PropertyValueMap[ "is_non_added_key" ] = GetBooleanText( !IsAdded && IsKey );
        PropertyValueMap[ "is_added_non_key" ] = GetBooleanText( IsAdded && !IsKey );
        PropertyValueMap[ "is_non_added_non_key" ] = GetBooleanText( !IsAdded && !IsKey );
        PropertyValueMap[ "is_edited" ] = GetBooleanText( IsEdited );
        PropertyValueMap[ "is_non_edited" ] = GetBooleanText( !IsEdited );
        PropertyValueMap[ "is_edited_key" ] = GetBooleanText( IsEdited && IsKey );
        PropertyValueMap[ "is_non_edited_key" ] = GetBooleanText( !IsEdited && IsKey );
        PropertyValueMap[ "is_edited_non_key" ] = GetBooleanText( IsEdited && !IsKey );
        PropertyValueMap[ "is_non_edited_non_key" ] = GetBooleanText( !IsEdited && !IsKey );
        PropertyValueMap[ "is_incremented" ] = GetBooleanText( IsIncremented );
        PropertyValueMap[ "is_constrained" ] = GetBooleanText( IsConstrained );
        PropertyValueMap[ "is_first" ] = GetBooleanText( IsFirst );
        PropertyValueMap[ "is_first_key" ] = GetBooleanText( IsFirstKey );
        PropertyValueMap[ "is_first_non_key" ] = GetBooleanText( IsFirstNonKey );
        PropertyValueMap[ "is_first_stored" ] = GetBooleanText( IsFirstStored );
        PropertyValueMap[ "is_first_non_stored" ] = GetBooleanText( IsFirstNonStored );
        PropertyValueMap[ "is_first_stored_key" ] = GetBooleanText( IsFirstStoredKey );
        PropertyValueMap[ "is_first_non_stored_key" ] = GetBooleanText( IsFirstNonStoredKey );
        PropertyValueMap[ "is_first_stored_non_key" ] = GetBooleanText( IsFirstStoredNonKey );
        PropertyValueMap[ "is_first_non_stored_non_key" ] = GetBooleanText( IsFirstNonStoredNonKey );
        PropertyValueMap[ "is_first_added" ] = GetBooleanText( IsFirstAdded );
        PropertyValueMap[ "is_first_non_added" ] = GetBooleanText( IsFirstNonAdded );
        PropertyValueMap[ "is_first_added_key" ] = GetBooleanText( IsFirstAddedKey );
        PropertyValueMap[ "is_first_non_added_key" ] = GetBooleanText( IsFirstNonAddedKey );
        PropertyValueMap[ "is_first_added_non_key" ] = GetBooleanText( IsFirstAddedNonKey );
        PropertyValueMap[ "is_first_non_added_non_key" ] = GetBooleanText( IsFirstNonAddedNonKey );
        PropertyValueMap[ "is_first_edited" ] = GetBooleanText( IsFirstEdited );
        PropertyValueMap[ "is_first_non_edited" ] = GetBooleanText( IsFirstNonEdited );
        PropertyValueMap[ "is_first_edited_key" ] = GetBooleanText( IsFirstEditedKey );
        PropertyValueMap[ "is_first_non_edited_key" ] = GetBooleanText( IsFirstNonEditedKey );
        PropertyValueMap[ "is_first_edited_non_key" ] = GetBooleanText( IsFirstEditedNonKey );
        PropertyValueMap[ "is_first_non_edited_non_key" ] = GetBooleanText( IsFirstNonEditedNonKey );
        PropertyValueMap[ "is_first_incremented" ] = GetBooleanText( IsFirstIncremented );
        PropertyValueMap[ "is_first_non_incremented" ] = GetBooleanText( IsFirstNonIncremented );
        PropertyValueMap[ "is_last" ] = GetBooleanText( IsLast );
        PropertyValueMap[ "is_last_key" ] = GetBooleanText( IsLastKey );
        PropertyValueMap[ "is_last_non_key" ] = GetBooleanText( IsLastNonKey );
        PropertyValueMap[ "is_last_stored" ] = GetBooleanText( IsLastStored );
        PropertyValueMap[ "is_last_non_stored" ] = GetBooleanText( IsLastNonStored );
        PropertyValueMap[ "is_last_stored_key" ] = GetBooleanText( IsLastStoredKey );
        PropertyValueMap[ "is_last_non_stored_key" ] = GetBooleanText( IsLastNonStoredKey );
        PropertyValueMap[ "is_last_stored_non_key" ] = GetBooleanText( IsLastStoredNonKey );
        PropertyValueMap[ "is_last_non_stored_non_key" ] = GetBooleanText( IsLastNonStoredNonKey );
        PropertyValueMap[ "is_last_added" ] = GetBooleanText( IsLastAdded );
        PropertyValueMap[ "is_last_non_added" ] = GetBooleanText( IsLastNonAdded );
        PropertyValueMap[ "is_last_added_key" ] = GetBooleanText( IsLastAddedKey );
        PropertyValueMap[ "is_last_non_added_key" ] = GetBooleanText( IsLastNonAddedKey );
        PropertyValueMap[ "is_last_added_non_key" ] = GetBooleanText( IsLastAddedNonKey );
        PropertyValueMap[ "is_last_non_added_non_key" ] = GetBooleanText( IsLastNonAddedNonKey );
        PropertyValueMap[ "is_last_edited" ] = GetBooleanText( IsLastEdited );
        PropertyValueMap[ "is_last_non_edited" ] = GetBooleanText( IsLastNonEdited );
        PropertyValueMap[ "is_last_edited_key" ] = GetBooleanText( IsLastEditedKey );
        PropertyValueMap[ "is_last_non_edited_key" ] = GetBooleanText( IsLastNonEditedKey );
        PropertyValueMap[ "is_last_edited_non_key" ] = GetBooleanText( IsLastEditedNonKey );
        PropertyValueMap[ "is_last_non_edited_non_key" ] = GetBooleanText( IsLastNonEditedNonKey );
        PropertyValueMap[ "is_last_incremented" ] = GetBooleanText( IsLastIncremented );
        PropertyValueMap[ "is_last_non_incremented" ] = GetBooleanText( IsLastNonIncremented );
    }

    // ~~

    string ReplaceProperties(
        string template_text
        )
    {
        return template_text.ReplaceProperties( "{%", "%}", PropertyValueMap );
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
                    value_text_array ~= "false";
                }
                else
                {
                    value_text_array ~= "true";
                }
            }

            property_name = value_text_array[ 0 ];

            if ( property_name == "capacity"
                 && value_text_array.length == 2 )
            {
                Type.Capacity = value_text_array[ 1 ].GetInteger();
            }
            else if ( property_name == "stored"
                      && value_text_array.length == 2 )
            {
                IsStored = ( value_text_array[ 1 ] != "false" );

                if ( !IsStored )
                {
                    IsAdded = false;
                }
            }
            else if ( property_name == "added"
                      && value_text_array.length == 2 )
            {
                IsAdded = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "edited"
                      && value_text_array.length == 2 )
            {
                IsEdited = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "unique"
                      && value_text_array.length == 2 )
            {
                IsUnique = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "key"
                      && value_text_array.length == 2 )
            {
                IsKey = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "partitioned"
                      && value_text_array.length == 2 )
            {
                IsPartitioned = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "clustered"
                      && value_text_array.length == 2 )
            {
                IsClustered = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "indexed"
                      && value_text_array.length == 2 )
            {
                IsIndexed = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "filtered"
                      && value_text_array.length == 2 )
            {
                IsFiltered = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "grouped"
                      && value_text_array.length == 2 )
            {
                IsGrouped = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "mapped"
                      && value_text_array.length == 2 )
            {
                IsMapped = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "accessed"
                      && value_text_array.length == 2 )
            {
                IsAccessed = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "static"
                      && value_text_array.length == 2 )
            {
                IsStatic = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "required"
                      && value_text_array.length == 2 )
            {
                IsRequired = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "incremented"
                      && value_text_array.length == 2 )
            {
                IsIncremented = ( value_text_array[ 1 ] != "false" );
                IsAdded = false;
            }
            else if ( property_name == "constrained"
                      && value_text_array.length == 2 )
            {
                IsConstrained = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "ascending"
                      && value_text_array.length == 2 )
            {
                IsAscending = ( value_text_array[ 1 ] != "false" );

                if ( property_text == "ascending" )
                {
                    OrderIndex = Index + 1;
                }
                else
                {
                    OrderIndex = value_text_array[ 1 ].GetInteger();
                }
            }
            else if ( property_name == "descending"
                      && value_text_array.length == 2 )
            {
                IsDescending = ( value_text_array[ 1 ] != "false" );

                if ( property_text == "descending" )
                {
                    OrderIndex = Index + 1;
                }
                else
                {
                    OrderIndex = value_text_array[ 1 ].GetInteger();
                }
            }
            else if ( property_name == "now"
                      && value_text_array.length == 2 )
            {
                IsNow = ( value_text_array[ 1 ] != "false" );
                IsAdded = false;
            }
            else if ( property_name == "sqlname"
                      && value_text_array.length == 2 )
            {
                SqlName = value_text_array[ 1 ];
            }
            else if ( property_name == "cqlname"
                      && value_text_array.length == 2 )
            {
                CqlName = value_text_array[ 1 ];
            }
            else if ( property_name == "goname"
                      && value_text_array.length == 2 )
            {
                GoName = value_text_array[ 1 ];
            }
            else if ( property_name == "phpname"
                      && value_text_array.length == 2 )
            {
                PhpName = value_text_array[ 1 ];
            }
            else if ( property_name == "crystalname"
                      && value_text_array.length == 2 )
            {
                CrystalName = value_text_array[ 1 ];
            }
            else if ( property_name == "csharpname"
                      && value_text_array.length == 2 )
            {
                CsharpName = value_text_array[ 1 ];
            }
            else if ( property_name == "rustname"
                      && value_text_array.length == 2 )
            {
                RustName = value_text_array[ 1 ];
            }
            else if ( property_name == "javascriptname"
                      && value_text_array.length == 2 )
            {
                JavascriptName = value_text_array[ 1 ];
            }
            else if ( property_name == "count"
                      && value_text_array.length == 2 )
            {
                MinimumRandomCount = value_text_array[ 1 ].GetInteger();
                MaximumRandomCount = MinimumRandomCount;
            }
            else if ( property_name == "count"
                      && value_text_array.length == 3 )
            {
                MinimumRandomCount = value_text_array[ 1 ].GetInteger();
                MaximumRandomCount = value_text_array[ 2 ].GetInteger();
            }
            else if ( property_name == "default" )
            {
                DefaultValueText = value_text_array[ 1 .. $ ].join( ' ' );
            }
            else
            {
                PropertyValueMap[ property_name ] = value_text_array[ 1 .. $ ].join( ' ' );
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

    void SetDefaultValue(
        )
    {
        DefaultValue = new VALUE( Type );

        if ( DefaultValueText == "" )
        {
            DefaultValue.SetDefault();
        }
        else
        {
            DefaultValue.Set( DefaultValueText );
        }
    }

    // ~~

    void MakeType(
        )
    {
        writeln( "Processing column : ", Table.Name, ".", Name );

        SetForeignColumn();
        SetDefaultValue();

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

        if ( PhpName == "" )
        {
            PhpName = Name;
        }

        if ( CrystalName == "" )
        {
            CrystalName = Name.GetVariableCaseText();
        }

        if ( CsharpName == "" )
        {
            CsharpName = Name;
        }

        if ( RustName == "" )
        {
            RustName = Name.GetVariableCaseText();
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

        GenericAttribute = Name.GetAttributeCaseText();
        GenericVariable = Name.GetVariableCaseText();
        GenericStyle = Name.GetStyleCaseText();
        GenericTitle = Name.GetTitleCaseText();
        GenericSentence = Name.GetSentenceCaseText();
        GenericLocution = Name.GetLocutionCaseText();
        GoType = Type.GetGoText().replace( "GOCQL.UUID", "UUID" );
        GoAttribute = Type.GetGoAttributeText();
        GoVariable = GoName.GetVariableCaseText();
        PhpType = Type.GetPhpText();
        PhpParameterType = Type.GetPhpParameterTypeText();
        PhpAttribute = Type.GetPhpAttributeText();
        PhpVariable = PhpName.GetVariableCaseText();
        PhpDefault = DefaultValue.GetPhpText();
        CrystalType = Type.GetCrystalText();
        CsharpType = Type.GetCsharpText();
        CsharpAttribute = Type.GetCsharpAttributeText();
        CsharpVariable = CsharpName.GetVariableCaseText();
        RustType = Type.GetRustText();
        JavascriptAttribute = JavascriptName.GetAttributeCaseText();
        JavascriptVariable = JavascriptName.GetVariableCaseText();
        JavascriptDefault = DefaultValue.GetJavascriptText();

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
        DATA_VALUE data_value
        )
    {
        VALUE
            value;

        value = new VALUE( Type );
        value.Set( data_value );
        ValueArray ~= value;

        ++ValueCount;
    }

    // ~~

    void MakeValues(
        )
    {
        if ( IsProcessed )
        {
            Abort( "Mutual column dependency : " ~ Table.Name ~ "." ~ Name );
        }

        if ( ValueCount < Table.RowCount )
        {
            writeln( "Filling column : " ~ Table.Name ~ "." ~ Name );

            IsProcessed = true;

            while ( ValueCount < Table.RowCount )
            {
                if ( ValueCount >= ValueArray.length )
                {
                    ValueArray ~= new VALUE( Type );
                }
                else
                {
                    ValueArray[ ValueCount ] = new VALUE( Type );
                }

                if ( IsStored )
                {
                    ValueArray[ ValueCount ].Make( ValueCount, Table.RowCount );
                }

                ++ValueCount;
            }

            IsProcessed = false;
        }
    }

    // ~~

    void CheckValues(
        )
    {
        bool
            value_is_found;
        long
            foreign_value_index,
            value_index;
        VALUE
            foreign_value,
            value;

        if ( IsForeign )
        {
            writeln( "Checking column : " ~ Table.Name ~ "." ~ Name );

            for ( value_index = 0;
                  value_index < ValueArray.length;
                  ++value_index )
            {
                value = ValueArray[ value_index ];
                value_is_found = false;

                for ( foreign_value_index = 0;
                      foreign_value_index < ForeignColumn.ValueArray.length;
                      ++foreign_value_index )
                {
                    foreign_value = ForeignColumn.ValueArray[ foreign_value_index ];

                    if ( foreign_value.IsEqual( value ) )
                    {
                        value_is_found = true;

                        break;
                    }
                }

                if ( !value_is_found )
                {
                    PrintWarning( "Invalid foreign value : " ~ value.GetText() );
                }
            }
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
        GenericType,
        GenericAttribute,
        GenericVariable,
        GenericStyle,
        GenericTitle,
        GenericSentence,
        GenericLocution,
        GoType,
        GoAttribute,
        GoVariable,
        PhpType,
        PhpAttribute,
        PhpVariable,
        CrystalType,
        CsharpType,
        CsharpAttribute,
        CsharpVariable,
        RustType,
        JavascriptType,
        JavascriptAttribute,
        KeyAttribute,
        KeyVariable;
    string[]
        KeyNameArray;
    COLUMN[]
        ColumnArray;
    bool
        IsStored,
        IsEdited,
        IsSorted,
        IsDropped,
        IsFirst,
        IsFirstStored,
        IsFirstNonStored,
        IsFirstEdited,
        IsFirstNonEdited,
        IsLast,
        IsLastStored,
        IsLastNonStored,
        IsLastEdited,
        IsLastNonEdited;
    long
        RowCount;
    string[ string ]
        PropertyValueMap;
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
        GenericType = Name.GetTypeCaseText();
        GenericAttribute = Name.GetAttributeCaseText();
        GenericVariable = Name.GetVariableCaseText();
        GenericStyle = Name.GetStyleCaseText();
        GenericTitle = Name.GetTitleCaseText();
        GenericSentence = Name.GetSentenceCaseText();
        GenericLocution = Name.GetLocutionCaseText();
        GoType = GenericType;
        GoAttribute = GenericAttribute;
        GoVariable = GenericVariable;
        PhpType = GenericType;
        PhpAttribute = GenericAttribute;
        PhpVariable = GenericVariable;
        CrystalType = GenericType;
        CsharpType = GenericType;
        CsharpAttribute = GenericAttribute;
        CsharpVariable = GenericVariable;
        RustType = GenericType;
        JavascriptType = GenericType;
        JavascriptAttribute = GenericAttribute;
        IsStored = true;
        IsEdited = true;
        RowCount = schema.RowCount;
    }

    // -- INQUIRIES

    long GetColumncount(
        )
    {
        return ColumnArray.length;
    }

    // ~~

    long GetStoredColumnCount(
        )
    {
        long
            stored_column_count;

        stored_column_count = 0;

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored )
            {
                ++stored_column_count;
            }
        }

        return stored_column_count;
    }

    // ~~

    long GetValueCount(
        )
    {
        long
            value_count;

        foreach ( column; ColumnArray )
        {
            if ( column.ValueCount > value_count )
            {
                value_count = column.ValueCount;
            }
        }

        return value_count;
    }

    // ~~

    COLUMN FindColumn(
        string column_name
        )
    {
        foreach ( column; ColumnArray )
        {
            if ( column.Name == column_name )
            {
                return column;
            }
        }

        return null;
    }

    // ~~

    string GetAddDatabaseObjectGenerisCode(
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

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored
                 && column.IsKey
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
            generis_code
                ~= "\n";
        }

        if ( SqlOptionIsEnabled )
        {
            generis_code
                ~= "    statement, error_\n"
                   ~ "        := DatabaseSession.Prepare(\n"
                   ~ "               \"insert into `" ~ Name ~ "` ( ";

            column_count = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    if ( column_count > 0 )
                    {
                        generis_code
                            ~= ", ";
                    }

                    generis_code
                        ~= "`" ~ column.StoredName ~ "`";

                    ++column_count;
                }
            }

            generis_code
                ~= " ) values ( ";

            column_count = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    if ( column_count > 0 )
                    {
                        generis_code
                            ~= ", ";
                    }

                    if ( column.IsNow )
                    {
                        if ( column.IsDate() )
                        {
                            generis_code
                                ~= "date( now() )";
                        }
                        else
                        {
                            generis_code
                                ~= "now()";
                        }
                    }
                    else
                    {
                        generis_code
                            ~= "?";
                    }

                    ++column_count;
                }
            }

            generis_code
                ~= " )\"\n"
                   ~ "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    result, error_\n"
                   ~ "        := statement.Exec(\n";

            column_count = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented
                     && !column.IsNow )
                {
                    ++column_count;
                }
            }

            column_index = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented
                     && !column.IsNow )
                {
                    generis_code
                        ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( column_index + 1 < column_count )
                    {
                        generis_code
                            ~= ",";
                    }

                    generis_code
                        ~= "\n";

                    ++column_index;
                }
            }

            generis_code
                ~= "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey
                     && column.IsIncremented )
                {
                    generis_code
                        ~= "    " ~ GoVariable ~ "." ~ column.GoName ~ ", error_ = result.LastInsertId();\n"
                           ~ "\n"
                           ~ "    if ( error_ != nil )\n"
                           ~ "    {\n"
                           ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
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
                   ~ "               \"insert into \\\"" ~ Name ~ "\\\" ( ";

            column_count = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    if ( column_count > 0 )
                    {
                        generis_code
                            ~= ", ";
                    }

                    generis_code
                        ~= "\\\"" ~ column.StoredName ~ "\\\"";

                    ++column_count;
                }
            }

            generis_code
                ~= " ) values ( ";

            column_count = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    if ( column_count > 0 )
                    {
                        generis_code
                            ~= ", ";
                    }

                    generis_code
                        ~= "?";

                    ++column_count;
                }
            }

            generis_code
                ~= " )\",\n";

            column_index = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    generis_code
                        ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( column_index + 1 < column_count )
                    {
                        generis_code
                            ~= ",";
                    }

                    generis_code
                        ~= "\n";

                    ++column_index;
                }
            }

            generis_code
                ~= "               ).Exec();\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
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

    string GetPutDatabaseObjectGenerisCode(
        )
    {
        return
            GetAddDatabaseObjectGenerisCode()
                .replace( "func AddDatabase", "func PutDatabase" )
                .replace( "insert into", "replace into" );
    }

    // ~~

    string GetSetDatabaseObjectGenerisCode(
        )
    {
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
                   ~ "               \"update `" ~ Name ~ "` set ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    generis_code
                        ~= "`" ~ column.StoredName ~ "` = ?";

                    if ( !column.IsLastNonKey )
                    {
                        generis_code
                            ~= ", ";
                    }
                }
            }

            generis_code
                ~= " where ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    generis_code
                        ~= column.StoredName ~ " = ?";

                    if ( !column.IsLastKey )
                    {
                        generis_code
                            ~= ", ";
                    }
                }
            }

            generis_code
                ~= "\"\n"
                   ~ "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    result, error_\n"
                   ~ "        := statement.Exec(\n";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    generis_code
                        ~= "               " ~ GoVariable ~ "." ~ column.GoName ~ ",\n";
                }
            }

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    generis_code
                        ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastKey )
                    {
                        generis_code
                            ~= ",";
                    }

                    generis_code
                        ~= "\n";
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
                   ~ "               \"insert into \\\"" ~ Name ~ "\\\" ( ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code
                        ~= "\\\"" ~ column.StoredName ~ "\\\"";

                    if ( !column.IsLastStored )
                    {
                        generis_code
                            ~= ", ";
                    }
                }
            }

            generis_code
                ~= " ) values ( ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code
                        ~= "?";

                    if ( !column.IsLastStored )
                    {
                        generis_code
                            ~= ", ";
                    }
                }
            }

            generis_code
                ~= " )\",\n";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code
                        ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastStored )
                    {
                        generis_code
                            ~= ",";
                    }

                    generis_code
                        ~= "\n";
                }
            }

            generis_code
                ~= "               ).Exec();\n";
        }

        generis_code
            ~= "\n"
               ~ "    if ( error_ != nil )\n"
               ~ "    {\n"
               ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
               ~ "\n"
               ~ "        return false;\n"
               ~ "    }\n"
               ~ "\n"
               ~ "    return true;\n"
               ~ "}\n";

        return generis_code;
    }

    // ~~

    string GetRemoveDatabaseObjectGenerisCode(
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
                   ~ "               \"delete from `" ~ Name ~ "` where ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    generis_code
                        ~= "`" ~ column.StoredName ~ "` = ?";

                    if ( !column.IsLastKey )
                    {
                        generis_code
                            ~= " and ";
                    }
                }
            }

            generis_code
                ~= "\"\n"
                   ~ "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    result, error_\n"
                   ~ "        := statement.Exec(\n";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    generis_code
                        ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastKey )
                    {
                        generis_code
                            ~= ", ";
                    }

                    generis_code
                        ~= "\n";
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
                   ~ "               \"delete from \\\"" ~ Name ~ "\\\" where ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    generis_code
                        ~= "\\\"" ~ column.StoredName ~ "\\\" = ?";

                    if ( !column.IsLastKey )
                    {
                        generis_code
                            ~= " and ";
                    }
                }
            }

            generis_code
                ~= "\",\n";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    generis_code
                        ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastKey )
                    {
                        generis_code
                            ~= ",\n";
                    }
                    else
                    {
                        generis_code
                            ~= "\n";
                    }
                }
            }

            generis_code
                ~= "               ).Exec();\n";
        }

        generis_code
            ~= "\n"
               ~ "    if ( error_ != nil )\n"
               ~ "    {\n"
               ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
               ~ "\n"
               ~ "        return false;\n"
               ~ "    }\n"
               ~ "\n"
               ~ "    return true;\n"
               ~ "}\n";

        return generis_code;
    }

    // ~~

    string GetGetDatabaseObjectGenerisCode(
        )
    {
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

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    generis_code
                        ~= "`" ~ column.StoredName ~ "`";

                    if ( column.IsStored
                         && !column.IsLastNonKey )
                    {
                        generis_code
                            ~= ", ";
                    }
                }
            }

            generis_code
                ~= " from `" ~ Name ~ "` where ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    generis_code
                        ~= column.StoredName ~ " = ?";

                    if ( !column.IsLastKey )
                    {
                        generis_code
                            ~= " and ";
                    }
                }
            }

            generis_code
                ~= " limit 1\"\n"
                   ~ "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    rows, error_\n"
                   ~ "        := statement.Query(\n";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    generis_code
                        ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastKey )
                    {
                        generis_code
                            ~= ",";
                    }

                    generis_code
                        ~= "\n";
                }
            }

            generis_code
                ~= "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    for rows.Next()\n"
                   ~ "    {\n"
                   ~ "        error_\n"
                   ~ "            = rows.Scan(";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    generis_code
                        ~= "                  &" ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastNonKey )
                    {
                        generis_code
                            ~= ",\n";
                    }
                    else
                    {
                        generis_code
                            ~= "\n";
                    }
                }
            }

            generis_code
                ~= "\n"
                   ~ "                  );\n"
                   ~ "\n"
                   ~ "        if ( error_ != nil )\n"
                   ~ "        {\n"
                   ~ "            error_code.SetError( error_, http.StatusBadRequest );\n"
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

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    generis_code
                        ~= "\\\"" ~ column.StoredName ~ "\\\"";

                    if ( !column.IsLastNonKey )
                    {
                        generis_code
                            ~= ", ";
                    }
                }
            }

            generis_code
                ~= " from \\\"" ~ Name ~ "\\\" where ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    generis_code
                        ~= "\\\"" ~ column.StoredName ~ "\\\" = ?";

                    if ( !column.IsLastKey )
                    {
                        generis_code
                            ~= " and ";
                    }
                }
            }

            generis_code
                ~= "\",\n";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    generis_code
                        ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastKey )
                    {
                        generis_code
                            ~= ",";
                    }

                    generis_code
                        ~= "\n";
                }
            }

            generis_code
                ~= "               )\n"
                   ~ "               .Consistency( gocql.One )\n"
                   ~ "               .Scan(\n";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    generis_code
                        ~= "                    &" ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastNonKey )
                    {
                        generis_code
                            ~= ",\n";
                    }
                    else
                    {
                        generis_code
                            ~= "\n";
                    }
                }
            }

            generis_code
                ~= "                    );\n";
        }

        generis_code
            ~= "\n"
               ~ "    if ( error_ != nil )\n"
               ~ "    {\n"
               ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
               ~ "\n"
               ~ "        return false;\n"
               ~ "    }\n"
               ~ "\n"
               ~ "    return true;\n"
               ~ "}\n";

        return generis_code;
    }

    // ~~

    string GetGetDatabaseObjectArrayGenerisCode(
        )
    {
        string
            generis_code;

        generis_code
            = "func GetDatabase" ~ GoAttribute ~ "List(\n"
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

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code
                        ~= "`" ~ column.StoredName ~ "`";

                    if ( !column.IsLastStored )
                    {
                        generis_code
                            ~= ", ";
                    }
                }
            }

            generis_code
                ~= " from `" ~ Name ~ "`\"\n"
                   ~ "               );\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    rows, error_ := statement.Query();\n"
                   ~ "\n"
                   ~ "    if ( error_ != nil )\n"
                   ~ "    {\n"
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
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

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code
                        ~= "                  &" ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastStored )
                    {
                        generis_code
                            ~= ",\n";
                    }
                    else
                    {
                        generis_code
                            ~= "\n";
                    }
                }
            }

            generis_code
                ~= "                  );\n"
                   ~ "\n"
                   ~ "        if ( error_ != nil )\n"
                   ~ "        {\n"
                   ~ "            error_code.SetError( error_, http.StatusBadRequest );\n"
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

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code
                        ~= "\\\"" ~ column.StoredName ~ "\\\"";

                    if ( !column.IsLastStored )
                    {
                        generis_code
                            ~= ", ";
                    }
                }
            }

            generis_code
                ~= " from \\\"" ~ Name ~ "\\\"\"\n"
                   ~ "               )\n"
                   ~ "               .Consistency( gocql.One )\n"
                   ~ "               .Iter();\n"
                   ~ "\n"
                   ~ "    *" ~ GoVariable ~ "_array = make( [] " ~ GoType ~ ", 0 );\n"
                   ~ "\n"
                   ~ "    for iterator.Scan(\n";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    generis_code
                        ~= "            &" ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastStored )
                    {
                        generis_code
                            ~= ",\n";
                    }
                    else
                    {
                        generis_code
                            ~= "\n";
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
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
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
              ~ "    writer io.Writer,\n"
              ~ "    " ~ GoVariable ~ " * " ~ GoType ~ "\n"
              ~ "    )\n"
              ~ "{\n"
              ~ "    WriteResponse( writer, \"{\" );\n";

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored )
            {
                generis_code
                    ~= "    WriteResponse( writer, \"\\\"" ~ column.GoName ~ "\\\":\" );\n"
                       ~ "    WriteResponse" ~ column.GoAttribute ~ "( writer, " ~ GoVariable ~ "." ~ column.GoName ~ " );\n";

                if ( !column.IsLastStored )
                {
                    generis_code
                        ~= "    WriteResponse( writer, \",\" );\n";
                }
            }
        }

        generis_code
            ~= "    WriteResponse( writer, \"}\" );\n"
               ~ "}\n";

        return generis_code.replace( "\" );\n    WriteResponse( writer, \"", "" );
    }

    // ~~

    string GetHandleAddRequestGenerisCode(
        )
    {
        string
            generis_code;

        generis_code
            = "func HandleAdd" ~ GoAttribute ~ "DatabaseRequest(\n"
              ~ "    response_writer http.ResponseWriter,\n"
              ~ "    request * http.Request\n"
              ~ "    )\n"
              ~ "{\n"
              ~ "    var\n"
              ~ "        error_code ERROR_CODE;\n"
              ~ "    var\n"
              ~ "        " ~ GoVariable ~ " " ~ GoType ~ ";\n"
              ~ "\n";

        generis_code
            ~= "    if ( IsAdministratorSession( request, &error_code )\n";

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored
                 && !( column.IsKey
                       && column.IsUnique
                       && ( column.StoredType == "uuid"
                            || column.IsIncremented) ) )
            {
                generis_code
                    ~= "         && GetRequest" ~ column.GoAttribute ~ "( request, &" ~ GoVariable ~ "." ~ column.GoName ~ ", \"" ~ column.StoredName ~ "\", &error_code )\n";
            }
        }

        generis_code
            ~= "         && AddDatabase" ~ GoAttribute ~ "( &" ~ GoVariable ~ ", &error_code ) )\n"
               ~ "    {\n"
               ~ "        WriteResponse( response_writer, \"{\" );\n";

        foreach ( column; ColumnArray )
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
            = "func HandleSet" ~ GoAttribute ~ "DatabaseRequest(\n"
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

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored )
            {
                generis_code
                    ~= "         && GetRequest" ~ column.GoAttribute ~ "( request, &" ~ GoVariable ~ "." ~ column.GoName ~ ", \"" ~ column.StoredName ~ "\", &error_code )\n";
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
            = "func HandleRemove" ~ GoAttribute ~ "DatabaseRequest(\n"
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

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored
                 && column.IsKey )
            {
                generis_code
                    ~= "         && GetRequest" ~ column.GoAttribute ~ "( request, &" ~ GoVariable ~ "." ~ column.GoName ~ ", \"" ~ column.StoredName ~ "\", &error_code )\n";
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
            = "func HandleGet" ~ GoAttribute ~ "DatabaseRequest(\n"
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

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored
                 && column.IsKey )
            {
                generis_code
                    ~= "         && GetRequest" ~ column.GoAttribute ~ "( request, &" ~ GoVariable ~ "." ~ column.GoName ~ ", \"" ~ column.StoredName ~ "\", &error_code )\n";
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
            "func HandleGet" ~ GoAttribute ~ "ListDatabaseRequest(\n"
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
            ~ "         && GetDatabase" ~ GoAttribute ~ "List( &" ~ GoVariable ~ "_array, &error_code ) )\n"
            ~ "    {\n"
            ~ "        WriteResponse( response_writer, \"{\\\"" ~ GoAttribute ~ "List\\\":[\" );\n"
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
            "    router.Post( \"/add_" ~ GoVariable ~ "\", HandleAdd" ~ GoAttribute ~ "DatabaseRequest );\n"
            ~ "    router.Post( \"/set_" ~ GoVariable ~ "\", HandleSet" ~ GoAttribute ~ "DatabaseRequest );\n"
            ~ "    router.Post( \"/remove_" ~ GoVariable ~ "\", HandleRemove" ~ GoAttribute ~ "DatabaseRequest );\n"
            ~ "    router.Post( \"/get_" ~ GoVariable ~ "\", HandleGet" ~ GoAttribute ~ "DatabaseRequest );\n"
            ~ "    router.Post( \"/get_" ~ GoVariable ~ "_list\", HandleGet" ~ GoAttribute ~ "ListDatabaseRequest );\n";
    }

    // ~~

    string GetBindDatabaseColumnPhoenixCode(
        COLUMN column,
        long column_index
        )
    {
        string
            phoenix_code;

        if ( !column.IsScalar() )
        {
            phoenix_code
                = "    "
                  ~ column.PhpVariable
                  ~ " = json_encode( "
                  ~ column.PhpVariable
                  ~ " );\n";
        }

        phoenix_code
            ~= "    statement.bindParam( "
               ~ ( column_index + 1 ).to!string()
               ~ ", "
               ~ column.PhpVariable
               ~ ", "
               ~ column.PhpParameterType
               ~ " );\n";

        return phoenix_code;
    }

    // ~~

    string GetEncodeDatabaseColumnPhoenixCode(
        string indentation
        )
    {
        string
            phoenix_code;

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored
                 && ( column.IsNatural()
                      || column.IsInteger() ) )
            {
                phoenix_code
                    ~= indentation
                       ~ PhpVariable
                       ~ "."
                       ~ column.PhpName
                       ~ " = ( int )( "
                       ~ PhpVariable
                       ~ "."
                       ~ column.PhpName
                       ~ " );\n";
            }
            else if ( column.IsStored
                      && column.IsReal() )
            {
                phoenix_code
                    ~= indentation
                       ~ PhpVariable
                       ~ "."
                       ~ column.PhpName
                       ~ " = ( float )( "
                       ~ PhpVariable
                       ~ "."
                       ~ column.PhpName
                       ~ " );\n";
            }
            else if ( column.IsStored
                      && !column.IsScalar() )
            {
                phoenix_code
                    ~= indentation
                       ~ PhpVariable
                       ~ "."
                       ~ column.PhpName
                       ~ " = json_decode( "
                       ~ PhpVariable
                       ~ "."
                       ~ column.PhpName
                       ~ " );\n";
            }
        }

        return phoenix_code;
    }

    // ~~

    string GetReturnDatabaseObjectPhoenixCode(
        )
    {
        string
            phoenix_code;

        phoenix_code = GetEncodeDatabaseColumnPhoenixCode( "    " );

        if ( phoenix_code == "" )
        {
            phoenix_code
                = "    return statement.fetchObject();\n";
        }
        else
        {
            phoenix_code
                = "    var "
                  ~ PhpVariable
                  ~ " = statement.fetchObject();\n"
                  ~ phoenix_code
                  ~ "\n"
                  ~ "    return "
                  ~ PhpVariable
                  ~ ";\n";
        }

        return phoenix_code;
    }

    // ~~

    string GetReturnDatabaseObjectArrayPhoenixCode(
        )
    {
        string
            phoenix_code;

        phoenix_code = GetEncodeDatabaseColumnPhoenixCode( "        " );

        if ( phoenix_code == "" )
        {
            phoenix_code
                = "    return GetDatabaseObjectArray( statement );\n";
        }
        else
        {
            phoenix_code
                = "    var "
                  ~ PhpVariable
                  ~ "_array = [];\n"
                  ~ "\n"
                  ~ "    while ( var "
                  ~ PhpVariable
                  ~ " = statement.fetchObject() )\n"
                  ~ "    {\n"
                  ~ phoenix_code
                  ~ "        array_push( "
                  ~ PhpVariable
                  ~ "_array, "
                  ~ PhpVariable
                  ~ " );\n"
                  ~ "    }\n"
                  ~ "\n"
                  ~ "    return "
                  ~ PhpVariable
                  ~ "_array;\n";
        }

        return phoenix_code;
    }

    // ~~

    string GetAddDatabaseObjectPhoenixCode(
        )
    {
        long
            column_count,
            column_index;
        string
            phoenix_code;

        phoenix_code
            = "\n// ~~\n\n"
              ~ "function AddDatabase" ~ PhpAttribute ~ "(";

        column_count = 0;

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored
                 && !column.IsIncremented
                 && !column.IsNow )
            {
                if ( column_count > 0 )
                {
                    phoenix_code
                        ~= ",";
                }

                phoenix_code
                    ~= "\n    " ~ column.PhpType ~ " " ~ column.PhpVariable;

                ++column_count;
            }
        }

        phoenix_code
              ~= "\n    )\n"
                 ~ "{\n";

        if ( SqlOptionIsEnabled )
        {
            phoenix_code
                ~= "    var statement = GetDatabaseStatement( 'insert into `" ~ Name ~ "` ( ";

            column_count = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    if ( column_count > 0 )
                    {
                        phoenix_code
                            ~= ", ";
                    }

                    phoenix_code
                        ~= "`" ~ column.StoredName ~ "`";

                    ++column_count;
                }
            }

            phoenix_code
                ~= " ) values ( ";

            column_count = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented )
                {
                    if ( column_count > 0 )
                    {
                        phoenix_code
                            ~= ", ";
                    }

                    if ( column.IsNow )
                    {
                        if ( column.IsDate() )
                        {
                            phoenix_code
                                ~= "date( now() )";
                        }
                        else
                        {
                            phoenix_code
                                ~= "now()";
                        }
                    }
                    else
                    {
                        phoenix_code
                            ~= "?";
                    }

                    ++column_count;
                }
            }

            phoenix_code
                ~= " )' );\n";

            column_index = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsIncremented
                     && !column.IsNow )
                {
                    phoenix_code
                        ~= GetBindDatabaseColumnPhoenixCode( column, column_index );

                    ++column_index;
                }
            }

            phoenix_code
                ~= "\n"
                   ~ "    if ( !statement.execute() )\n"
                   ~ "    {\n"
                   ~ "        var_dump( statement.errorInfo() );\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    return GetDatabaseAddedId( statement );\n";
        }

        phoenix_code
            ~= "}\n";

        return phoenix_code;
    }

    // ~~

    string GetPutDatabaseObjectPhoenixCode(
        )
    {
        return
            GetAddDatabaseObjectPhoenixCode()
                .replace( "function AddDatabase", "function PutDatabase" )
                .replace( "insert into", "replace into" );
    }

    // ~~

    string GetSetDatabaseObjectPhoenixCode(
        )
    {
        long
            column_index;
        string
            phoenix_code;

        phoenix_code
            = "\n// ~~\n\n"
              ~ "function SetDatabase" ~ PhpAttribute ~ "(";

        column_index = 0;

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored )
            {
                if ( column_index > 0 )
                {
                    phoenix_code
                        ~= ",";
                }

                phoenix_code
                    ~= "\n    " ~ column.PhpType ~ " " ~ column.PhpVariable;

                ++column_index;
            }
        }

        phoenix_code
              ~= "\n    )\n"
                 ~ "{\n";

        if ( SqlOptionIsEnabled )
        {
            phoenix_code
                ~= "    var statement = GetDatabaseStatement( 'update `" ~ Name ~ "` set ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    phoenix_code
                        ~= "`" ~ column.StoredName ~ "` = ?";

                    if ( !column.IsLastNonKey )
                    {
                        phoenix_code
                            ~= ", ";
                    }
                }
            }

            phoenix_code
                ~= " where ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    phoenix_code
                        ~= column.StoredName ~ " = ?";

                    if ( !column.IsLastKey )
                    {
                        phoenix_code
                            ~= ", ";
                    }
                }
            }

            phoenix_code
                ~= "' );\n";

            column_index = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    phoenix_code
                        ~= GetBindDatabaseColumnPhoenixCode( column, column_index );

                    ++column_index;
                }
            }

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    phoenix_code
                        ~= GetBindDatabaseColumnPhoenixCode( column, column_index );

                    ++column_index;
                }
            }

            phoenix_code
                ~= "\n"
                   ~ "    if ( !statement.execute() )\n"
                   ~ "    {\n"
                   ~ "        var_dump( statement.errorInfo() );\n"
                   ~ "    }\n";
        }

        phoenix_code
            ~= "}\n";

        return phoenix_code;
    }

    // ~~

    string GetRemoveDatabaseObjectPhoenixCode(
        )
    {
        long
            column_index;
        string
            phoenix_code;

        phoenix_code
            = "\n// ~~\n\n"
              ~ "function RemoveDatabase" ~ PhpAttribute ~ "By";

        column_index = 0;

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored
                 && column.IsKey )
            {
                if ( column_index > 0 )
                {
                    phoenix_code
                        ~= "And";
                }

                phoenix_code
                    ~= column.PhpName;

                ++column_index;
            }
        }

        phoenix_code
            ~= "(";

        column_index = 0;

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored
                 && column.IsKey )
            {
                if ( column_index > 0 )
                {
                    phoenix_code
                        ~= ",";
                }

                phoenix_code
                    ~= "\n    " ~ column.PhpType ~ " " ~ column.PhpVariable;

                ++column_index;
            }
        }

        phoenix_code
              ~= "\n    )\n"
                 ~ "{\n";

        if ( SqlOptionIsEnabled )
        {
            phoenix_code
                ~= "    var statement = GetDatabaseStatement( 'delete from `" ~ Name ~ "` where ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    phoenix_code
                        ~= "`" ~ column.StoredName ~ "` = ?";

                    if ( !column.IsLastKey )
                    {
                        phoenix_code
                            ~= " and ";
                    }
                }
            }

            phoenix_code
                ~= "' );\n";

            column_index = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    phoenix_code
                        ~= GetBindDatabaseColumnPhoenixCode( column, column_index );

                    ++column_index;
                }
            }

            phoenix_code
                ~= "\n"
                   ~ "    if ( !statement.execute() )\n"
                   ~ "    {\n"
                   ~ "        var_dump( statement.errorInfo() );\n"
                   ~ "    }\n";
        }

        phoenix_code
            ~= "}\n";

        return phoenix_code;
    }

    // ~~

    string GetGetDatabaseObjectPhoenixCode(
        )
    {
        long
            column_index;
        string
            phoenix_code;

        phoenix_code
            = "\n// ~~\n\n"
              ~ "function GetDatabase" ~ PhpAttribute ~ "By";

        column_index = 0;

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored
                 && column.IsKey )
            {
                if ( column_index > 0 )
                {
                    phoenix_code
                        ~= "And";
                }

                phoenix_code
                    ~= column.PhpName;

                ++column_index;
            }
        }

        phoenix_code
            ~= "(";

        column_index = 0;

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored
                 && column.IsKey )
            {
                if ( column_index > 0 )
                {
                    phoenix_code
                        ~= ",";
                }

                phoenix_code
                    ~= "\n    " ~ column.PhpType ~ " " ~ column.PhpVariable;

                ++column_index;
            }
        }

        phoenix_code
              ~= "\n    )\n"
                 ~ "{\n";

        if ( SqlOptionIsEnabled )
        {
            phoenix_code
                ~= "    var statement = GetDatabaseStatement( 'select ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    phoenix_code
                        ~= "`" ~ column.StoredName ~ "`";

                    if ( !column.IsLastStored )
                    {
                        phoenix_code
                            ~= ", ";
                    }
                }
            }

            phoenix_code
                ~= " from `" ~ Name ~ "` where ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    phoenix_code
                        ~= "`" ~ column.StoredName ~ "` = ?";

                    if ( !column.IsLastKey )
                    {
                        phoenix_code
                            ~= " and ";
                    }
                }
            }

            phoenix_code
                ~= " limit 1' );\n";

            column_index = 0;

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
                {
                    phoenix_code
                        ~= GetBindDatabaseColumnPhoenixCode( column, column_index );

                    ++column_index;
                }
            }

            phoenix_code
                ~= "\n"
                   ~ "    if ( !statement.execute() )\n"
                   ~ "    {\n"
                   ~ "        var_dump( statement.errorInfo() );\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ GetReturnDatabaseObjectPhoenixCode();
        }

        phoenix_code
            ~= "}\n";

        return phoenix_code;
    }

    // ~~

    string GetGetDatabaseObjectByKeyPhoenixCode(
        )
    {
        long
            column_index;
        string
            phoenix_code;

        foreach ( key_column; ColumnArray )
        {
            if ( key_column.IsAccessed )
            {
                phoenix_code
                    = "\n// ~~\n\n"
                      ~ "function GetDatabase" ~ PhpAttribute ~ "By" ~ key_column.PhpName ~ "(\n"
                      ~ "    " ~ key_column.PhpType ~ " " ~ key_column.PhpVariable ~ "\n"
                      ~ "    )\n"
                      ~ "{\n";

                if ( SqlOptionIsEnabled )
                {
                    phoenix_code
                        ~= "    var statement = GetDatabaseStatement( 'select ";

                    foreach ( column; ColumnArray )
                    {
                        if ( column.IsStored )
                        {
                            phoenix_code
                                ~= "`" ~ column.StoredName ~ "`";

                            if ( !column.IsLastStored )
                            {
                                phoenix_code
                                    ~= ", ";
                            }
                        }
                    }

                    phoenix_code
                        ~= " from `" ~ Name ~ "` where `" ~ key_column.StoredName ~ "` = ? limit 1' );\n"
                           ~ "    statement.bindParam( 1, " ~ key_column.PhpVariable ~ ", " ~ key_column.PhpParameterType ~ " );\n"
                           ~ "\n"
                           ~ "    if ( !statement.execute() )\n"
                           ~ "    {\n"
                           ~ "        var_dump( statement.errorInfo() );\n"
                           ~ "    }\n"
                           ~ "\n"
                           ~ GetReturnDatabaseObjectPhoenixCode();
                }

                phoenix_code
                    ~= "}\n";
            }
        }

        return phoenix_code;
    }

    // ~~

    string GetGetDatabaseObjectArrayPhoenixCode(
        string function_prefix,
        bool table_is_sorted
        )
    {
        long
            column_index,
            order_index;
        string
            phoenix_code;

        phoenix_code
            = "function Get" ~ function_prefix ~ "Database" ~ PhpAttribute ~ "Array(\n"
              ~ "    )\n"
              ~ "{\n";

        if ( SqlOptionIsEnabled )
        {
            phoenix_code
                ~= "    var statement = GetDatabaseStatement( 'select ";

            foreach ( column; ColumnArray )
            {
                if ( column.IsStored )
                {
                    phoenix_code
                        ~= "`" ~ column.StoredName ~ "`";

                    if ( !column.IsLastStored )
                    {
                        phoenix_code
                            ~= ", ";
                    }
                }
            }

            phoenix_code
                ~= " from `" ~ Name ~ "`";

            if ( table_is_sorted )
            {
                column_index = 0;

                for ( order_index = 1;
                      order_index <= ColumnArray.length;
                      ++order_index )
                {
                    foreach ( column; ColumnArray )
                    {
                        if ( column.IsStored
                             && ( column.IsAscending
                               || column.IsDescending )
                             && column.OrderIndex == order_index )
                        {
                            if ( column_index == 0 )
                            {
                                phoenix_code
                                    ~= " order by ";
                            }
                            else
                            {
                                phoenix_code
                                    ~= ", ";
                            }

                            phoenix_code
                                ~= "`" ~ column.StoredName ~ "`";

                            if ( column.IsAscending )
                            {
                                phoenix_code
                                    ~= " asc";
                            }
                            else
                            {
                                phoenix_code
                                    ~= " desc";
                            }

                            ++column_index;
                        }
                    }
                }
            }

            phoenix_code
                ~= "' );\n"
                   ~ "\n"
                   ~ "    if ( !statement.execute() )\n"
                   ~ "    {\n"
                   ~ "        var_dump( statement.errorInfo() );\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ GetReturnDatabaseObjectArrayPhoenixCode();
        }

        phoenix_code
            ~= "}\n";

        return phoenix_code;
    }

    // ~~

    string GetGetDatabaseObjectArrayPhoenixCode(
        )
    {
        bool
            table_is_sorted;

        foreach ( column; ColumnArray )
        {
            if ( column.IsStored
                 && ( column.IsAscending
                      || column.IsDescending ) )
            {
                table_is_sorted = true;
            }
        }

        if ( IsSorted || !table_is_sorted )
        {
            return GetGetDatabaseObjectArrayPhoenixCode( "", true );
        }
        else
        {
            return
                GetGetDatabaseObjectArrayPhoenixCode( "", false )
                ~ "\n// ~~\n\n"
                ~ GetGetDatabaseObjectArrayPhoenixCode( "Sorted", true );
        }
    }

    // ~~

    string GetGetDatabaseObjectArrayByKeyPhoenixCode(
        )
    {
        string
            phoenix_code;

        foreach ( key_column; ColumnArray )
        {
            if ( key_column.IsFiltered )
            {
                phoenix_code
                    = "\n// ~~\n\n"
                      ~ "function GetDatabase" ~ PhpAttribute ~ "ArrayBy" ~ key_column.PhpName ~ "(\n"
                      ~ "    " ~ key_column.PhpType ~ " " ~ key_column.PhpVariable ~ "\n"
                      ~ "    )\n"
                      ~ "{\n";

                if ( SqlOptionIsEnabled )
                {
                    phoenix_code
                        ~= "    var statement = GetDatabaseStatement( 'select ";

                    foreach ( column; ColumnArray )
                    {
                        if ( column.IsStored )
                        {
                            phoenix_code
                                ~= "`" ~ column.StoredName ~ "`";

                            if ( !column.IsLastStored )
                            {
                                phoenix_code
                                    ~= ", ";
                            }
                        }
                    }

                    phoenix_code
                        ~= " from `" ~ Name ~ "` where `" ~ key_column.StoredName ~ "` = ?' );\n"
                           ~ "    statement.bindParam( 1, " ~ key_column.PhpVariable ~ ", " ~ key_column.PhpParameterType ~ " );\n"
                           ~ "\n"
                           ~ "    if ( !statement.execute() )\n"
                           ~ "    {\n"
                           ~ "        var_dump( statement.errorInfo() );\n"
                           ~ "    }\n"
                           ~ "\n"
                           ~ GetReturnDatabaseObjectArrayPhoenixCode();
                }

                phoenix_code
                    ~= "}\n";
            }
        }

        return phoenix_code;
    }

    // ~~

    string GetGetDatabaseObjectArrayByKeyMapPhoenixCode(
        )
    {
        string
            phoenix_code;

        foreach ( key_column; ColumnArray )
        {
            if ( key_column.IsGrouped )
            {
                phoenix_code
                    = "\n// ~~\n\n"
                      ~ "function GetDatabase" ~ PhpAttribute ~ "ArrayBy" ~ key_column.PhpName ~ "Map(\n"
                      ~ "    )\n"
                      ~ "{\n";

                if ( SqlOptionIsEnabled )
                {
                    phoenix_code
                        ~= "    var statement = GetDatabaseStatement( 'select ";

                    foreach ( column; ColumnArray )
                    {
                        if ( column.IsStored )
                        {
                            phoenix_code
                                ~= "`" ~ column.StoredName ~ "`";

                            if ( !column.IsLastStored )
                            {
                                phoenix_code
                                    ~= ", ";
                            }
                        }
                    }

                    phoenix_code
                        ~= " from `" ~ Name ~ "`' );\n"
                           ~ "\n"
                           ~ "    if ( !statement.execute() )\n"
                           ~ "    {\n"
                           ~ "        var_dump( statement.errorInfo() );\n"
                           ~ "    }\n"
                           ~ "\n"
                           ~ "    var " ~ PhpVariable ~ "_array_by_" ~ key_column.PhpVariable ~ "_map = [];\n"
                           ~ "\n"
                           ~ "    while ( var " ~ PhpVariable ~ " = statement.fetchObject() )\n"
                           ~ "    {\n"
                           ~ GetEncodeDatabaseColumnPhoenixCode( "        " )
                           ~ "\n"
                           ~ "        if ( !isset( " ~ PhpVariable ~ "_array_by_" ~ key_column.PhpVariable ~ "_map[ " ~ PhpVariable ~ "." ~ key_column.PhpName ~ " ] ) )\n"
                           ~ "        {\n"
                           ~ "            " ~ PhpVariable ~ "_array_by_" ~ key_column.PhpVariable ~ "_map[ " ~ PhpVariable ~ "." ~ key_column.PhpName ~ " ] = array( " ~ PhpVariable ~ " );\n"
                           ~ "        }\n"
                           ~ "        else\n"
                           ~ "        {\n"
                           ~ "            array_push( " ~ PhpVariable ~ "_array_by_" ~ key_column.PhpVariable ~ "_map[ " ~ PhpVariable ~ "." ~ key_column.PhpName ~ " ], " ~ PhpVariable ~ " );\n"
                           ~ "        }\n"
                           ~ "    }\n"
                           ~ "\n"
                           ~ "    return " ~ PhpVariable ~ "_array_by_" ~ key_column.PhpVariable ~ "_map;\n";
                }

                phoenix_code
                    ~= "}\n";
            }
        }

        return phoenix_code;
    }

    // ~~

    string GetGetDatabaseObjectByKeyMapPhoenixCode(
        )
    {
        string
            phoenix_code;

        foreach ( key_column; ColumnArray )
        {
            if ( key_column.IsMapped )
            {
                phoenix_code
                    = "\n// ~~\n\n"
                      ~ "function GetDatabase" ~ PhpAttribute ~ "By" ~ key_column.PhpName ~ "Map(\n"
                      ~ "    )\n"
                      ~ "{\n";

                if ( SqlOptionIsEnabled )
                {
                    phoenix_code
                        ~= "    var statement = GetDatabaseStatement( 'select ";

                    foreach ( column; ColumnArray )
                    {
                        if ( column.IsStored )
                        {
                            phoenix_code
                                ~= "`" ~ column.StoredName ~ "`";

                            if ( !column.IsLastStored )
                            {
                                phoenix_code
                                    ~= ", ";
                            }
                        }
                    }

                    phoenix_code
                        ~= " from `" ~ Name ~ "`' );\n"
                           ~ "\n"
                           ~ "    if ( !statement.execute() )\n"
                           ~ "    {\n"
                           ~ "        var_dump( statement.errorInfo() );\n"
                           ~ "    }\n"
                           ~ "\n"
                           ~ "    var " ~ PhpVariable ~ "_by_" ~ key_column.PhpVariable ~ "_map = [];\n"
                           ~ "\n"
                           ~ "    while ( var " ~ PhpVariable ~ " = statement.fetchObject() )\n"
                           ~ "    {\n"
                           ~ GetEncodeDatabaseColumnPhoenixCode( "        " )
                           ~ "        " ~ PhpVariable ~ "_by_" ~ key_column.PhpVariable ~ "_map[ " ~ PhpVariable ~ "." ~ key_column.PhpName ~ " ] = " ~ PhpVariable ~ ";\n"
                           ~ "    }\n"
                           ~ "\n"
                           ~ "    return " ~ PhpVariable ~ "_by_" ~ key_column.PhpVariable ~ "_map;\n";
                }

                phoenix_code
                    ~= "}\n";
            }
        }

        return phoenix_code;
    }

    // ~~

    void SetProperties(
        )
    {
        PropertyValueMap[ "name" ] = Name;
        PropertyValueMap[ "type" ] = GenericType;
        PropertyValueMap[ "attribute" ] = GenericAttribute;
        PropertyValueMap[ "variable" ] = GenericVariable;
        PropertyValueMap[ "style" ] = GenericStyle;
        PropertyValueMap[ "title" ] = GenericTitle;
        PropertyValueMap[ "sentence" ] = GenericSentence;
        PropertyValueMap[ "locution" ] = GenericLocution;
        PropertyValueMap[ "go_type" ] = GoType;
        PropertyValueMap[ "go_attribute" ] = GoAttribute;
        PropertyValueMap[ "go_variable" ] = GoVariable;
        PropertyValueMap[ "php_type" ] = PhpType;
        PropertyValueMap[ "php_attribute" ] = PhpAttribute;
        PropertyValueMap[ "php_variable" ] = PhpVariable;
        PropertyValueMap[ "crystal_type" ] = CrystalType;
        PropertyValueMap[ "csharp_type" ] = CsharpType;
        PropertyValueMap[ "csharp_attribute" ] = CsharpAttribute;
        PropertyValueMap[ "csharp_variable" ] = CsharpVariable;
        PropertyValueMap[ "rust_type" ] = RustType;
        PropertyValueMap[ "javascript_type" ] = JavascriptType;
        PropertyValueMap[ "javascript_attribute" ] = JavascriptAttribute;
        PropertyValueMap[ "key_attribute" ] = KeyAttribute;
        PropertyValueMap[ "key_variable" ] = KeyVariable;
        PropertyValueMap[ "go_attribute_declaration" ] = GoAttributeDeclaration;
        PropertyValueMap[ "go_type_declaration" ] = GoTypeDeclaration;
        PropertyValueMap[ "generis_attribute_declaration" ] = GenerisAttributeDeclaration;
        PropertyValueMap[ "generis_type_declaration" ] = GenerisTypeDeclaration;
        PropertyValueMap[ "crystal_attribute_declaration" ] = CrystalAttributeDeclaration;
        PropertyValueMap[ "crystal_type_declaration" ] = CrystalTypeDeclaration;
        PropertyValueMap[ "cibyl_attribute_declaration" ] = CybilAttributeDeclaration;
        PropertyValueMap[ "cibyl_type_declaration" ] = CybilTypeDeclaration;
        PropertyValueMap[ "csharp_attribute_declaration" ] = CsharpAttributeDeclaration;
        PropertyValueMap[ "csharp_type_declaration" ] = CsharpTypeDeclaration;
        PropertyValueMap[ "javascript_attribute_declaration" ] = JavascriptAttributeDeclaration;
        PropertyValueMap[ "javascript_type_declaration" ] = JavascriptTypeDeclaration;
        PropertyValueMap[ "rust_attribute_declaration" ] = RustAttributeDeclaration;
        PropertyValueMap[ "rust_type_declaration" ] = RustTypeDeclaration;
        PropertyValueMap[ "is_stored" ] = GetBooleanText( IsStored );
        PropertyValueMap[ "is_non_stored" ] = GetBooleanText( !IsStored );
        PropertyValueMap[ "is_edited" ] = GetBooleanText( IsEdited );
        PropertyValueMap[ "is_non_edited" ] = GetBooleanText( !IsEdited );
        PropertyValueMap[ "is_first" ] = GetBooleanText( IsFirst );
        PropertyValueMap[ "is_first_stored" ] = GetBooleanText( IsFirstStored );
        PropertyValueMap[ "is_first_non_stored" ] = GetBooleanText( IsFirstNonStored );
        PropertyValueMap[ "is_first_edited" ] = GetBooleanText( IsFirstEdited );
        PropertyValueMap[ "is_first_non_edited" ] = GetBooleanText( IsFirstNonEdited );
        PropertyValueMap[ "is_last" ] = GetBooleanText( IsLast );
        PropertyValueMap[ "is_last_stored" ] = GetBooleanText( IsLastStored );
        PropertyValueMap[ "is_last_non_stored" ] = GetBooleanText( IsLastNonStored );
        PropertyValueMap[ "is_last_edited" ] = GetBooleanText( IsLastEdited );
        PropertyValueMap[ "is_last_non_edited" ] = GetBooleanText( IsLastNonEdited );
        PropertyValueMap[ "column_count" ] = GetColumncount().to!string();
        PropertyValueMap[ "stored_column_count" ] = GetStoredColumnCount().to!string();

        foreach ( column; ColumnArray )
        {
            column.SetProperties();
        }
    }

    // ~~

    string ReplaceProperties(
        string template_text
        )
    {
        return template_text.ReplaceProperties( "{#", "#}", PropertyValueMap );
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
                    value_text_array ~= "false";
                }
                else
                {
                    value_text_array ~= "true";
                }
            }

            property_name = value_text_array[ 0 ];

            if ( property_name == "stored"
                 && value_text_array.length == 2 )
            {
                IsStored = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "edited"
                      && value_text_array.length == 2 )
            {
                IsEdited = ( value_text_array[ 1 ] != "false" );
            }
            else if ( property_name == "sorted"
                      && value_text_array.length == 2 )
            {
                IsSorted = ( value_text_array[ 1 ] != "false" );
            }
            else if ( value_text_array[ 0 ] == "dropped"
                      && value_text_array.length == 2 )
            {
                IsDropped = ( value_text_array[ 1 ] != "false" );
            }
            else if ( value_text_array[ 0 ] == "count"
                      && value_text_array.length == 2 )
            {
                RowCount = value_text_array[ 1 ].GetInteger();
            }
            else
            {
                PropertyValueMap[ value_text_array[ 0 ] ] = value_text_array[ 1 .. $ ].join( ' ' );
            }
        }
    }

    // ~~

    void MakeTypes(
        )
    {
        COLUMN
            first_added_column,
            first_added_key_column,
            first_added_non_key_column,
            first_column,
            first_edited_column,
            first_edited_key_column,
            first_edited_non_key_column,
            first_incremented_column,
            first_key_column,
            first_non_added_column,
            first_non_added_key_column,
            first_non_added_non_key_column,
            first_non_edited_column,
            first_non_edited_key_column,
            first_non_edited_non_key_column,
            first_non_incremented_column,
            first_non_key_column,
            first_non_stored_column,
            first_non_stored_key_column,
            first_non_stored_non_key_column,
            first_stored_column,
            first_stored_key_column,
            first_stored_non_key_column,
            last_added_column,
            last_added_key_column,
            last_added_non_key_column,
            last_column,
            last_edited_column,
            last_edited_key_column,
            last_edited_non_key_column,
            last_incremented_column,
            last_key_column,
            last_non_added_column,
            last_non_added_key_column,
            last_non_added_non_key_column,
            last_non_edited_column,
            last_non_edited_key_column,
            last_non_edited_non_key_column,
            last_non_incremented_column,
            last_non_key_column,
            last_non_stored_column,
            last_non_stored_key_column,
            last_non_stored_non_key_column,
            last_stored_column,
            last_stored_key_column,
            last_stored_non_key_column;

        writeln( "Processing table : ", Name );

        foreach ( column; ColumnArray )
        {
            column.MakeType();
        }

        first_column = null;
        first_key_column = null;
        first_non_key_column = null;
        first_stored_column = null;
        first_non_stored_column = null;
        first_stored_key_column = null;
        first_non_stored_key_column = null;
        first_stored_non_key_column = null;
        first_non_stored_non_key_column = null;
        first_added_column = null;
        first_non_added_column = null;
        first_added_key_column = null;
        first_non_added_key_column = null;
        first_added_non_key_column = null;
        first_non_added_non_key_column = null;
        first_edited_column = null;
        first_non_edited_column = null;
        first_edited_key_column = null;
        first_non_edited_key_column = null;
        first_edited_non_key_column = null;
        first_non_edited_non_key_column = null;
        first_incremented_column = null;
        first_non_incremented_column = null;

        last_column = null;
        last_key_column = null;
        last_non_key_column = null;
        last_stored_column = null;
        last_non_stored_column = null;
        last_stored_key_column = null;
        last_non_stored_key_column = null;
        last_stored_non_key_column = null;
        last_non_stored_non_key_column = null;
        last_added_column = null;
        last_non_added_column = null;
        last_added_key_column = null;
        last_non_added_key_column = null;
        last_added_non_key_column = null;
        last_non_added_non_key_column = null;
        last_edited_column = null;
        last_non_edited_column = null;
        last_edited_key_column = null;
        last_non_edited_key_column = null;
        last_edited_non_key_column = null;
        last_non_edited_non_key_column = null;
        last_incremented_column = null;
        last_non_incremented_column = null;

        foreach_reverse ( column; ColumnArray )
        {
            first_column = column;

            if ( column.IsKey )
            {
                first_key_column = column;
            }

            if ( !column.IsKey )
            {
                first_non_key_column = column;
            }

            if ( column.IsStored )
            {
                first_stored_column = column;
            }

            if ( !column.IsStored )
            {
                first_non_stored_column = column;
            }

            if ( column.IsStored
                 && column.IsKey )
            {
                first_stored_key_column = column;
            }

            if ( !column.IsStored
                 && column.IsKey )
            {
                first_non_stored_key_column = column;
            }

            if ( column.IsStored
                 && !column.IsKey )
            {
                first_stored_non_key_column = column;
            }

            if ( !column.IsStored
                 && !column.IsKey )
            {
                first_non_stored_non_key_column = column;
            }

            if ( column.IsAdded )
            {
                first_added_column = column;
            }

            if ( !column.IsAdded )
            {
                first_non_added_column = column;
            }

            if ( column.IsAdded
                 && column.IsKey )
            {
                first_added_key_column = column;
            }

            if ( !column.IsAdded
                 && column.IsKey )
            {
                first_non_added_key_column = column;
            }

            if ( column.IsAdded
                 && !column.IsKey )
            {
                first_added_non_key_column = column;
            }

            if ( !column.IsAdded
                 && !column.IsKey )
            {
                first_non_added_non_key_column = column;
            }

            if ( column.IsEdited )
            {
                first_edited_column = column;
            }

            if ( !column.IsEdited )
            {
                first_non_edited_column = column;
            }

            if ( column.IsEdited
                 && column.IsKey )
            {
                first_edited_key_column = column;
            }

            if ( !column.IsEdited
                 && column.IsKey )
            {
                first_non_edited_key_column = column;
            }

            if ( column.IsEdited
                 && !column.IsKey )
            {
                first_edited_non_key_column = column;
            }

            if ( !column.IsEdited
                 && !column.IsKey )
            {
                first_non_edited_non_key_column = column;
            }

            if ( column.IsIncremented )
            {
                first_incremented_column = column;
            }

            if ( !column.IsIncremented )
            {
                first_non_incremented_column = column;
            }
        }

        foreach ( column; ColumnArray )
        {
            last_column = column;

            if ( column.IsKey )
            {
                last_key_column = column;
            }

            if ( !column.IsKey )
            {
                last_non_key_column = column;
            }

            if ( column.IsStored )
            {
                last_stored_column = column;
            }

            if ( !column.IsStored )
            {
                last_non_stored_column = column;
            }

            if ( column.IsStored
                 && column.IsKey )
            {
                last_stored_key_column = column;
            }

            if ( !column.IsStored
                 && column.IsKey )
            {
                last_non_stored_key_column = column;
            }

            if ( column.IsStored
                 && !column.IsKey )
            {
                last_stored_non_key_column = column;
            }

            if ( !column.IsStored
                 && !column.IsKey )
            {
                last_non_stored_non_key_column = column;
            }

            if ( column.IsAdded )
            {
                last_added_column = column;
            }

            if ( !column.IsAdded )
            {
                last_non_added_column = column;
            }

            if ( column.IsAdded
                 && column.IsKey )
            {
                last_added_key_column = column;
            }

            if ( !column.IsAdded
                 && column.IsKey )
            {
                last_non_added_key_column = column;
            }

            if ( column.IsAdded
                 && !column.IsKey )
            {
                last_added_non_key_column = column;
            }

            if ( !column.IsAdded
                 && !column.IsKey )
            {
                last_non_added_non_key_column = column;
            }

            if ( column.IsEdited )
            {
                last_edited_column = column;
            }

            if ( !column.IsEdited )
            {
                last_non_edited_column = column;
            }

            if ( column.IsEdited
                 && column.IsKey )
            {
                last_edited_key_column = column;
            }

            if ( !column.IsEdited
                 && column.IsKey )
            {
                last_non_edited_key_column = column;
            }

            if ( column.IsEdited
                 && !column.IsKey )
            {
                last_edited_non_key_column = column;
            }

            if ( !column.IsEdited
                 && !column.IsKey )
            {
                last_non_edited_non_key_column = column;
            }

            if ( column.IsIncremented )
            {
                last_incremented_column = column;
            }

            if ( !column.IsIncremented )
            {
                last_non_incremented_column = column;
            }
        }

        if ( first_column !is null )
        {
            first_column.IsFirst = true;
        }

        if ( first_key_column !is null )
        {
            first_key_column.IsFirstKey = true;
        }

        if ( first_non_key_column !is null )
        {
            first_non_key_column.IsFirstNonKey = true;
        }

        if ( first_stored_column !is null )
        {
            first_stored_column.IsFirstStored = true;
        }

        if ( first_non_stored_column !is null )
        {
            first_non_stored_column.IsFirstNonStored = true;
        }

        if ( first_stored_key_column !is null )
        {
            first_stored_key_column.IsFirstStoredKey = true;
        }

        if ( first_non_stored_key_column !is null )
        {
            first_non_stored_key_column.IsFirstNonStoredKey = true;
        }

        if ( first_stored_non_key_column !is null )
        {
            first_stored_non_key_column.IsFirstStoredNonKey = true;
        }

        if ( first_non_stored_non_key_column !is null )
        {
            first_non_stored_non_key_column.IsFirstNonStoredNonKey = true;
        }

        if ( first_added_column !is null )
        {
            first_added_column.IsFirstAdded = true;
        }

        if ( first_non_added_column !is null )
        {
            first_non_added_column.IsFirstNonAdded = true;
        }

        if ( first_added_key_column !is null )
        {
            first_added_key_column.IsFirstAddedKey = true;
        }

        if ( first_non_added_key_column !is null )
        {
            first_non_added_key_column.IsFirstNonAddedKey = true;
        }

        if ( first_added_non_key_column !is null )
        {
            first_added_non_key_column.IsFirstAddedNonKey = true;
        }

        if ( first_non_added_non_key_column !is null )
        {
            first_non_added_non_key_column.IsFirstNonAddedNonKey = true;
        }

        if ( first_added_column !is null )
        {
            first_added_column.IsFirstAdded = true;
        }

        if ( first_non_added_column !is null )
        {
            first_non_added_column.IsFirstNonAdded = true;
        }

        if ( first_added_key_column !is null )
        {
            first_added_key_column.IsFirstAddedKey = true;
        }

        if ( first_non_added_key_column !is null )
        {
            first_non_added_key_column.IsFirstNonAddedKey = true;
        }

        if ( first_added_non_key_column !is null )
        {
            first_added_non_key_column.IsFirstAddedNonKey = true;
        }

        if ( first_non_added_non_key_column !is null )
        {
            first_non_added_non_key_column.IsFirstNonAddedNonKey = true;
        }

        if ( first_edited_column !is null )
        {
            first_edited_column.IsFirstEdited = true;
        }

        if ( first_non_edited_column !is null )
        {
            first_non_edited_column.IsFirstNonEdited = true;
        }

        if ( first_edited_key_column !is null )
        {
            first_edited_key_column.IsFirstEditedKey = true;
        }

        if ( first_non_edited_key_column !is null )
        {
            first_non_edited_key_column.IsFirstNonEditedKey = true;
        }

        if ( first_edited_non_key_column !is null )
        {
            first_edited_non_key_column.IsFirstEditedNonKey = true;
        }

        if ( first_non_edited_non_key_column !is null )
        {
            first_non_edited_non_key_column.IsFirstNonEditedNonKey = true;
        }

        if ( first_incremented_column !is null )
        {
            first_incremented_column.IsFirstIncremented = true;
        }

        if ( first_non_incremented_column !is null )
        {
            first_non_incremented_column.IsFirstNonIncremented = true;
        }

        if ( last_column !is null )
        {
            last_column.IsLast = true;
        }

        if ( last_key_column !is null )
        {
            last_key_column.IsLastKey = true;
        }

        if ( last_non_key_column !is null )
        {
            last_non_key_column.IsLastNonKey = true;
        }

        if ( last_stored_column !is null )
        {
            last_stored_column.IsLastStored = true;
        }

        if ( last_non_stored_column !is null )
        {
            last_non_stored_column.IsLastNonStored = true;
        }

        if ( last_stored_key_column !is null )
        {
            last_stored_key_column.IsLastStoredKey = true;
        }

        if ( last_non_stored_key_column !is null )
        {
            last_non_stored_key_column.IsLastNonStoredKey = true;
        }

        if ( last_stored_non_key_column !is null )
        {
            last_stored_non_key_column.IsLastStoredNonKey = true;
        }

        if ( last_non_stored_non_key_column !is null )
        {
            last_non_stored_non_key_column.IsLastNonStoredNonKey = true;
        }

        if ( last_added_column !is null )
        {
            last_added_column.IsLastAdded = true;
        }

        if ( last_non_added_column !is null )
        {
            last_non_added_column.IsLastNonAdded = true;
        }

        if ( last_added_key_column !is null )
        {
            last_added_key_column.IsLastAddedKey = true;
        }

        if ( last_non_added_key_column !is null )
        {
            last_non_added_key_column.IsLastNonAddedKey = true;
        }

        if ( last_added_non_key_column !is null )
        {
            last_added_non_key_column.IsLastAddedNonKey = true;
        }

        if ( last_non_added_non_key_column !is null )
        {
            last_non_added_non_key_column.IsLastNonAddedNonKey = true;
        }

        if ( last_edited_column !is null )
        {
            last_edited_column.IsLastEdited = true;
        }

        if ( last_non_edited_column !is null )
        {
            last_non_edited_column.IsLastNonEdited = true;
        }

        if ( last_edited_key_column !is null )
        {
            last_edited_key_column.IsLastEditedKey = true;
        }

        if ( last_non_edited_key_column !is null )
        {
            last_non_edited_key_column.IsLastNonEditedKey = true;
        }

        if ( last_edited_non_key_column !is null )
        {
            last_edited_non_key_column.IsLastEditedNonKey = true;
        }

        if ( last_non_edited_non_key_column !is null )
        {
            last_non_edited_non_key_column.IsLastNonEditedNonKey = true;
        }

        if ( last_incremented_column !is null )
        {
            last_incremented_column.IsLastIncremented = true;
        }

        if ( last_non_incremented_column !is null )
        {
            last_non_incremented_column.IsLastNonIncremented = true;
        }
    }

    // ~~

    void MakeValues(
        )
    {
        writeln( "Filling table : ", Name );

        foreach ( column; ColumnArray )
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
    bool
        IsDropped;
    long
        RowCount;
    string
        TemplateFileText;

    // -- CONSTRUCTORS

    this(
        )
    {
        RowCount = 0;
    }

    // -- INQUIRIES

    TABLE FindTable(
        string table_name
        )
    {
        foreach ( table; TableArray )
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

    // ~~

    string FindColumnValue(
        string table_name,
        string key_column_name,
        string key_column_value_text,
        string value_column_name
        )
    {
        long
            row_index;
        COLUMN
            column,
            key_column;
        TABLE
            table;

        table = FindTable( table_name );

        if ( table !is null )
        {
            key_column = table.FindColumn( key_column_name );
            column = table.FindColumn( value_column_name );

            if ( key_column !is null
                 && column !is null )
            {
                row_index = key_column.FindRowIndex( key_column_value_text );

                if ( row_index >= 0 )
                {
                    return column.FindValueText( row_index );
                }
            }
        }

        return "";
    }

    // -- OPERATIONS

    void SetPropertyValue(
        string property_text
        )
    {
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
                    value_text_array ~= "false";
                }
                else
                {
                    value_text_array ~= "true";
                }
            }

            if ( value_text_array.length == 2 )
            {
                if ( value_text_array[ 0 ] == "dropped" )
                {
                    IsDropped = ( value_text_array[ 1 ] != "false" );
                }
                else if ( value_text_array[ 0 ] == "count" )
                {
                    RowCount = value_text_array[ 1 ].GetInteger();
                }
                else
                {
                    Abort( "Invalid schema property : " ~ property_text );
                }
            }
            else
            {
                Abort( "Invalid schema property : " ~ property_text );
            }
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
                line_part_array = stripped_line.GetPartArray( "|" );
                column_part_array = line_part_array[ 0 ].GetPartArray( ":" );

                if ( column_part_array.length >= 2 )
                {
                    column_name = column_part_array[ 0 ].strip();
                    column_type = column_part_array[ 1 .. $ ].join( ':' ).strip();

                    column = new COLUMN( table, column_name, column_type );
                    column.Index = table.ColumnArray.length;

                    table.ColumnArray ~= column;

                    if ( line_part_array.length == 2 )
                    {
                        property_part_array = line_part_array[ 1 ].GetPartArray( "," );

                        foreach ( ref property_text; property_part_array )
                        {
                            column.SetPropertyValue( property_text.strip() );
                        }

                        if ( column.IsStored
                             && column.IsKey )
                        {
                            table.KeyNameArray ~= column.Name;

                            if ( table.KeyNameArray.length == 1 )
                            {
                                table.KeyAttribute = column.Name.GetAttributeCaseText();
                                table.KeyVariable = column.Name.GetVariableCaseText();
                            }
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
                line_part_array = stripped_line.GetPartArray( "|" );

                table_name = line_part_array[ 0 ].strip();

                table = new TABLE( this, table_name );
                TableArray ~= table;

                if ( line_part_array.length == 2 )
                {
                    property_part_array = line_part_array[ 1 ].GetPartArray( "," );

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
                line_part_array = stripped_line.GetPartArray( "|" );

                Name = line_part_array[ 0 ].strip();

                if ( line_part_array.length == 2 )
                {
                    property_part_array = line_part_array[ 1 ].GetPartArray( "," );

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

    void SetProperties(
        )
    {
        foreach ( table; TableArray )
        {
            table.SetProperties();
        }
    }

    // ~~

    void MakeTypes(
        )
    {
        TABLE
            first_non_stored_table,
            first_stored_table,
            first_table,
            last_non_stored_table,
            last_stored_table,
            last_table;

        foreach ( table; TableArray )
        {
            table.MakeTypes();
        }

        first_table = null;
        first_stored_table = null;
        first_non_stored_table = null;

        last_table = null;
        last_stored_table = null;
        last_non_stored_table = null;

        foreach_reverse ( table; TableArray )
        {
            first_table = table;

            if ( table.IsStored )
            {
                first_stored_table = table;
            }

            if ( !table.IsStored )
            {
                first_non_stored_table = table;
            }
        }

        foreach ( table; TableArray )
        {
            last_table = table;

            if ( table.IsStored )
            {
                last_stored_table = table;
            }

            if ( !table.IsStored )
            {
                last_non_stored_table = table;
            }
        }

        if ( first_table !is null )
        {
            first_table.IsFirst = true;
        }

        if ( first_stored_table !is null )
        {
            first_stored_table.IsFirstStored = true;
        }

        if ( first_non_stored_table !is null )
        {
            first_non_stored_table.IsFirstNonStored = true;
        }

        if ( last_table !is null )
        {
            last_table.IsLast = true;
        }

        if ( last_stored_table !is null )
        {
            last_stored_table.IsLastStored = true;
        }

        if ( last_non_stored_table !is null )
        {
            last_non_stored_table.IsLastNonStored = true;
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
            column_index,
            line_index,
            row_count,
            sub_value_index;
        string
            line,
            next_line,
            stripped_line,
            table_name,
            value_line;
        string[]
            column_name_array;
        COLUMN
            column;
        COLUMN[]
            column_array;
        DATA_VALUE
            data_value;
        TABLE
            table;

        table = null;
        column_array = null;

        for ( line_index = 0;
              line_index < line_array.length;
              ++line_index )
        {
            line = line_array[ line_index ];
            writeln( line );

            stripped_line = line.strip();

            if ( line.startsWith( "        " ) )
            {
                if ( table is null
                     || column_array is null )
                {
                    Abort( "Invalid line : " ~ stripped_line );
                }

                while ( line_index + 1 < line_array.length )
                {
                    next_line = line_array[ line_index + 1 ];

                    if ( next_line.startsWith( "         " ) )
                    {
                        writeln( next_line );
                        stripped_line ~= next_line.strip();

                        ++line_index;
                    }
                    else
                    {
                        break;
                    }
                }

                data_value = new DATA_VALUE( "{" ~ stripped_line ~ "}" );

                if ( data_value.SubValueArray.length != column_array.length )
                {
                    for ( column_index = 0;
                          column_index < column_array.length;
                          ++column_index )
                    {
                        if ( column_index < data_value.SubValueArray.length )
                        {
                            writeln( "[", column_index, "] ", column_array[ column_index ].Name, " : ", data_value.SubValueArray[ column_index ].GetText() );
                        }
                        else
                        {
                            writeln( "[", column_index, "] ", column_array[ column_index ].Name, " ?" );
                        }
                    }

                    while ( column_index < data_value.SubValueArray.length )
                    {
                        writeln( "[", column_index, "] ? : ", data_value.SubValueArray[ column_index ].GetText() );

                        ++column_index;
                    }

                    Abort( "Invalid value count (" ~ data_value.SubValueArray.length.to!string() ~ "/" ~ column_array.length.to!string() ~ ") : " ~ data_value.GetText() );
                }

                for ( sub_value_index = 0;
                      sub_value_index < data_value.SubValueArray.length;
                      ++sub_value_index )
                {
                    column_array[ sub_value_index ].AddValue( data_value.SubValueArray[ sub_value_index ] );
                }

                ++row_count;

                if ( row_count > table.RowCount )
                {
                    table.RowCount = row_count;
                }
            }
            else if ( line.startsWith( "    " ) )
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
                        Abort( "Invalid column name : " ~ column_name );
                    }

                    column_array ~= column;
                }

                row_count = table.GetValueCount();
            }
            else
            {
                table_name = stripped_line;
                table = FindTable( table_name );

                if ( table is null )
                {
                    Abort( "Invalid table name : " ~ table_name );
                }
            }
        }
    }

    // ~~

    void MakeValues(
        )
    {
        foreach ( table; TableArray )
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

    void CheckValues(
        )
    {
        foreach ( table; TableArray )
        {
            foreach ( ref column; table.ColumnArray )
            {
                if ( column.IsStored )
                {
                    column.CheckValues();
                }
            }
        }
    }

    // ~~

    string[] GetStrippedLineArray(
        string text
        )
    {
        string
            stripped_line;
        string[]
            line_array,
            stripped_line_array;

        line_array = text.split( '\n' );
        stripped_line_array = null;

        foreach ( line; line_array )
        {
            line = line.stripRight();
            stripped_line = line.strip();

            if ( stripped_line != ""
                 && !stripped_line.startsWith( "--" ) )
            {
                stripped_line_array ~= line;
            }
        }

        return stripped_line_array;
    }

    // ~~

    void ReadFiles(
        string[] file_path_array
        )
    {
        string
            data_file_text,
            file_text,
            schema_file_text;

        foreach ( file_path; file_path_array )
        {
            if ( !exists( file_path ) )
            {
                Abort( "Invalid file path : " ~ file_path );
            }

            file_text = file_path.ReadText().replace( "\r", "" ).replace( "\t", "    " ) ~ "\n";

            if ( file_path.endsWith( ".bs" ) )
            {
                schema_file_text ~= file_text;
            }
            else if ( file_path.endsWith( ".bd" ) )
            {
                data_file_text ~= file_text;
            }
            else if ( file_path.endsWith( ".bt" ) )
            {
                TemplateFileText ~= file_text;
            }
            else
            {
                Abort( "Invalid file path : " ~ file_path );
            }
        }

        TableArray = null;

        AddTables( GetStrippedLineArray( schema_file_text ) );
        MakeTypes();

        AddValues( GetStrippedLineArray( data_file_text ) );
        MakeValues();
        CheckValues();
    }

    // ~~

    void WriteUmlSchemaFile(
        string uml_schema_file_path
        )
    {

        string
            uml_schema_file_text;

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

        foreach ( table; TableArray )
        {
            uml_schema_file_text ~= "\nclass " ~ table.Name ~ " {\n";

            foreach ( ref column; table.ColumnArray )
            {
                uml_schema_file_text ~= "    " ~ column.Name ~ " : " ~ column.Type.Name ~ "\n";
            }

            uml_schema_file_text ~= "}\n";
        }

        foreach ( table; TableArray )
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

        uml_schema_file_path.WriteText( uml_schema_file_text );
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

        sql_schema_file_text
            = "set @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;\n"
              ~ "set @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;\n"
              ~ "set @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';\n\n";

        if ( ( IsDropped && !DropIsIgnored )
             || DropIsForced )
        {
            sql_schema_file_text
                ~= "drop schema if exists `" ~ Name ~ "`;\n\n";
        }

        sql_schema_file_text
            ~= "create schema if not exists `" ~ Name ~ "` default character set utf8mb4 collate utf8mb4_general_ci;\n\n"
               ~ "use `" ~ Name ~ "`;\n\n";

        foreach ( table; TableArray )
        {
            if ( table.IsStored )
            {
                if ( ( table.IsDropped && !DropIsIgnored )
                     || DropIsForced )
                {
                    sql_schema_file_text
                        ~= "drop table if exists `" ~ Name ~ "`.`" ~ table.Name ~ "`;\n\n";
                }

                sql_schema_file_text
                    ~= "create table if not exists `" ~ Name ~ "`.`" ~ table.Name ~ "`(\n";

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
                    if ( column.IsIndexed
                         && column.IsStored
                         && column.IsForeign
                         && column.ForeignColumn.IsKey
                         && column.ForeignColumn.IsStored
                         && column.ForeignColumn.Table.IsStored )
                    {
                        ++foreign_key_index;

                        sql_schema_file_text
                            ~= "    index `index_"
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
                    if ( column.IsConstrained
                         && column.IsStored
                         && column.IsForeign
                         && column.ForeignColumn.IsKey
                         && column.ForeignColumn.IsStored
                         && column.ForeignColumn.Table.IsStored )
                    {
                        ++foreign_key_index;

                        sql_schema_file_text
                            ~= "    constraint `constraint_"
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

        sql_schema_file_path.WriteText( sql_schema_file_text.GetFilteredScript( ExcludedCommandArray ) );
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

        foreach ( table; TableArray )
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

        sql_data_file_path.WriteText( sql_data_file_text );
    }

    // ~~

    void WriteSqlDumpFile(
        string sql_dump_file_path
        )
    {
        string
            sql_dump_file_text;
        TABLE[]
            sorted_table_array;

        sorted_table_array = TableArray.dup();
        sorted_table_array.sort!( ( first_table, second_table ) => first_table.Name < second_table.Name )();

        foreach ( table; sorted_table_array )
        {
            if ( table.IsStored )
            {
                sql_dump_file_text
                    ~= "CREATE TABLE `" ~ table.Name ~ "` (\n";

                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.IsStored )
                    {
                        sql_dump_file_text
                            ~= "  `"
                               ~ column.SqlName
                               ~ "` "
                               ~ column.SqlType
                               ~ " "
                               ~ column.SqlPropertyArray.join( ' ' );

                            if ( !column.IsLastStored )
                            {
                                sql_dump_file_text ~= ", ";
                            }

                        sql_dump_file_text ~= "\n";
                    }
                }

                sql_dump_file_text
                    ~= ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n";

                if ( table.RowCount > 0 )
                {
                    sql_dump_file_text
                        ~= "\n"
                           ~ "INSERT INTO `" ~ table.Name ~ "` (";

                    foreach ( ref column; table.ColumnArray )
                    {
                        if ( column.IsStored )
                        {
                            sql_dump_file_text
                                ~= "`"
                                   ~ column.SqlName
                                   ~ "`";

                            if ( !column.IsLastStored )
                            {
                                sql_dump_file_text ~= ", ";
                            }
                        }
                    }

                    sql_dump_file_text
                        ~= ") VALUES\n";

                    foreach ( row_index; 0 .. table.RowCount )
                    {
                        sql_dump_file_text ~= "(";

                        foreach ( ref column; table.ColumnArray )
                        {
                            if ( column.IsStored )
                            {
                                sql_dump_file_text ~= column.ValueArray[ row_index ].GetSqlText( false, true );

                                if ( !column.IsLastStored )
                                {
                                    sql_dump_file_text ~= ", ";
                                }
                            }
                        }

                        sql_dump_file_text ~= ")";

                        if ( row_index < table.RowCount - 1 )
                        {
                            sql_dump_file_text ~= ",";
                        }
                        else
                        {
                            sql_dump_file_text ~= ";";
                        }

                        sql_dump_file_text ~= "\n";
                    }
                }

                sql_dump_file_text
                    ~= "\n";
            }
        }

        foreach ( table; sorted_table_array )
        {
            if ( table.IsStored )
            {
                foreach ( ref column; table.ColumnArray )
                {
                    if ( column.IsStored
                         && column.IsKey )
                    {
                        sql_dump_file_text
                            ~= "ALTER TABLE `" ~ table.Name ~ "`\n"
                               ~ "  ADD PRIMARY KEY (`" ~ column.SqlName ~ "`);\n\n";
                    }
                }
            }
        }

        sql_dump_file_path.WriteText( sql_dump_file_text );
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

        if ( ( IsDropped && !DropIsIgnored )
             || DropIsForced )
        {
            cql_schema_file_text
                = "drop keyspace if exists " ~ Name ~ ";\n";
        }

        cql_schema_file_text
            ~= "create keyspace if not exists " ~ Name ~ " with replication = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };\n";

        foreach ( table; TableArray )
        {
            if ( table.IsStored )
            {
                if ( ( table.IsDropped && !DropIsIgnored )
                     || DropIsForced )
                {
                    cql_schema_file_text
                        ~= "drop table if exists " ~ Name ~ "." ~ table.Name ~ ";\n";
                }

                cql_schema_file_text
                    ~= "create table if not exists " ~ Name ~ "." ~ table.Name ~ "(";

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

        cql_schema_file_path.WriteText( cql_schema_file_text.GetFilteredScript( ExcludedCommandArray ) );
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

        foreach ( table; TableArray )
        {
            if ( table.IsStored )
            {
                column_count = table.ColumnArray.length;

                foreach ( row_index; 0 .. table.RowCount )
                {
                    cql_data_file_text ~= "insert into " ~ table.SchemaName ~ "." ~ table.Name ~ " ( ";

                    foreach ( ref column; table.ColumnArray )
                    {
                        if ( column.IsStored )
                        {
                            cql_data_file_text ~= column.CqlName ~ "";

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

        cql_data_file_path.WriteText( cql_data_file_text );
    }

    // ~~

    void WriteJsonDataFile(
        string json_data_file_path
        )
    {
        long
            column_count;
        string
            json_data_file_text;

        json_data_file_text = "{";

        foreach ( table; TableArray )
        {
            if ( table.IsStored )
            {
                json_data_file_text ~= table.JavascriptAttribute ~ "List=[";

                column_count = table.ColumnArray.length;

                foreach ( row_index; 0 .. table.RowCount )
                {
                    if ( row_index > 0 )
                    {
                        json_data_file_text ~= ",";
                    }

                    json_data_file_text ~= "{";

                    foreach ( ref column; table.ColumnArray )
                    {
                        if ( column.IsStored )
                        {
                            json_data_file_text ~= column.JavascriptName ~ "=" ~ column.ValueArray[ row_index ].GetJsonText();

                            if ( !column.IsLastStored )
                            {
                                json_data_file_text ~= ",";
                            }
                        }
                    }

                    json_data_file_text ~= "}";
                }

                json_data_file_text ~= "]";

                if ( !table.IsLastStored )
                {
                    json_data_file_text ~= ",";
                }
            }
        }

        json_data_file_path.WriteText( json_data_file_text );
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
                    go_attribute_declaration ~= "    `db:\"" ~ column.StoredName ~ "\"`";
                }
                else
                {
                    go_attribute_declaration ~= "    `db:\"-\"`";
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

        go_type_file_path.WriteText( go_type_file_text );
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
                    generis_attribute_declaration ~= "    `db:\"" ~ column.StoredName ~ "\"`";
                }
                else
                {
                    generis_attribute_declaration ~= "    `db:\"-\"`";
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

        generis_type_file_path.WriteText( generis_type_file_text );
    }

    // ~~

    void WriteGenerisQueryFile(
        string generis_query_file_path
        )
    {
        string
            generis_query_file_text;

        generis_query_file_text = "";

        foreach ( table_index, ref table; TableArray )
        {
            if ( table.IsStored )
            {
                generis_query_file_text
                    ~= table.GetAddDatabaseObjectGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetPutDatabaseObjectGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetSetDatabaseObjectGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetRemoveDatabaseObjectGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetGetDatabaseObjectGenerisCode()
                       ~ "\n// ~~\n\n"
                       ~ table.GetGetDatabaseObjectArrayGenerisCode();

                if ( table_index + 1 < TableArray.length )
                {
                    generis_query_file_text ~= "\n// ~~\n\n";
                }
            }
        }

        generis_query_file_path.WriteText( generis_query_file_text );
    }

    // ~~

    void WriteGenerisResponseFile(
        string generis_response_file_path
        )
    {
        string
            generis_response_file_text;

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

        generis_response_file_path.WriteText( generis_response_file_text );
    }

    // ~~

    void WriteGenerisRequestFile(
        string generis_request_file_path
        )
    {
        string
            generis_request_file_text;

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

        generis_request_file_path.WriteText( generis_request_file_text );
    }

    // ~~

    void WriteGenerisRouteFile(
        string generis_route_file_path
        )
    {
        string
            generis_route_file_text;

        generis_route_file_text
            = "func RouteDatabaseRequests(\n"
              ~ "    router chi.Router\n"
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

        generis_route_file_path.WriteText( generis_route_file_text );
    }

    // ~~

    void WriteGenerisConstantFile(
        string generis_constant_file_path
        )
    {
        long
            character_index;
        string
            generis_constant_file_text,
            id,
            uuid;

        if ( Random.IdTextArray.length > 0 )
        {
            generis_constant_file_text = "const (\n";

            foreach ( id_text; Random.IdTextArray )
            {
                id = Random.IdMap[ id_text ];

                generis_constant_file_text ~= "    " ~ id_text ~ " = " ~ id ~ ";\n";
            }

            generis_constant_file_text ~= "    );\n\n";
        }

        if ( Random.UuidTextArray.length > 0 )
        {
            foreach ( uuid_text; Random.UuidTextArray )
            {
                uuid = Random.UuidMap[ uuid_text ].replace( "-", "" );

                generis_constant_file_text ~= "var " ~ uuid_text ~ " = gocql.UUID { ";

                for ( character_index = 0;
                      character_index < 32;
                      character_index += 2 )
                {
                    if ( character_index > 0 )
                    {
                        generis_constant_file_text ~= ", ";
                    }

                    generis_constant_file_text ~= "0x" ~ uuid[ character_index .. character_index + 2 ];
                }

                generis_constant_file_text ~= " };\n";
            }
        }

        generis_constant_file_path.WriteText( generis_constant_file_text );
    }

    // ~~

    void WritePhoenixQueryFiles(
        string phoenix_folder_path
        )
    {
        string
            phoenix_model_file_path,
            phoenix_model_file_text;

        foreach ( table_index, ref table; TableArray )
        {
            if ( table.IsStored )
            {
                phoenix_model_file_path = phoenix_folder_path ~ table.PhpVariable ~ ".phx";

                phoenix_model_file_text
                    = "// -- FUNCTIONS\n\n"
                      ~ table.GetGetDatabaseObjectArrayPhoenixCode()
                      ~ table.GetGetDatabaseObjectArrayByKeyPhoenixCode()
                      ~ table.GetGetDatabaseObjectArrayByKeyMapPhoenixCode()
                      ~ table.GetGetDatabaseObjectByKeyMapPhoenixCode()
                      ~ table.GetGetDatabaseObjectPhoenixCode()
                      ~ table.GetGetDatabaseObjectByKeyPhoenixCode()
                      ~ table.GetAddDatabaseObjectPhoenixCode()
                      ~ table.GetPutDatabaseObjectPhoenixCode()
                      ~ table.GetSetDatabaseObjectPhoenixCode()
                      ~ table.GetRemoveDatabaseObjectPhoenixCode();

                phoenix_model_file_path.WriteText( phoenix_model_file_text );
            }
        }
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

        crystal_type_file_path.WriteText( crystal_type_file_text );
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

        csharp_type_file_path.WriteText( csharp_type_file_text );
    }

    // ~~

    void WriteCsharpConstantFile(
        string csharp_constant_file_path
        )
    {
        string
            csharp_constant_file_text,
            id,
            uuid;

        if ( Random.IdTextArray.length > 0 )
        {
            csharp_constant_file_text = "    public const long\n";

            foreach ( id_index, id_text; Random.IdTextArray )
            {
                if ( id_index > 0 )
                {
                    csharp_constant_file_text ~= ",\n";
                }

                id = Random.IdMap[ id_text ];

                csharp_constant_file_text ~= "        " ~ id_text ~ " = " ~ id;
            }

            csharp_constant_file_text ~= ";\n";
        }

        if ( Random.UuidTextArray.length > 0 )
        {
            csharp_constant_file_text ~= "    public static UUID\n";

            foreach ( uuid_index, uuid_text; Random.UuidTextArray )
            {
                if ( uuid_index > 0 )
                {
                    csharp_constant_file_text ~= ",\n";
                }

                uuid = Random.UuidMap[ uuid_text ];

                csharp_constant_file_text ~= "        " ~ uuid_text ~ " = new UUID( \"" ~ uuid ~ "\" )";
            }

            csharp_constant_file_text ~= ";\n";
        }

        csharp_constant_file_path.WriteText( csharp_constant_file_text );
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

        rust_type_file_path.WriteText( rust_type_file_text );
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

        javascript_type_file_path.WriteText( javascript_type_file_text );
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

        if ( !instance_text.startsWith( "%%" ) )
        {
            Abort( "Missing instance file path : " ~ instance_text );
        }

        instance_file_text_array = instance_text[ 2 .. $ ].split( "\n%%" );

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
            instance_file_text = instance_file_line_array[ 1 .. $ ].join( '\n' ).ReplaceIgnoredTags();

            instance_file_path.WriteText( instance_file_text );
        }
    }

    // ~~

    void WriteInstanceFiles(
        )
    {
        string
            instance_file_text;

        if ( TemplateFileText != "" )
        {
            SetProperties();

            instance_file_text
                = TemplateFileText
                      .ReplaceTableTags( TableArray )
                      .ReplaceConditionalTags( "<~", "~>", "<>" )
                      .ReplaceConditionalTags( "<+~", "~+>", "<+>" )
                      .ReplaceConditionalTags( "<++~", "~++>", "<++>" );

            WriteInstanceFiles( instance_file_text );
        }
    }
}

// -- VARIABLES

bool
    CqlOptionIsEnabled,
    DropIsForced,
    DropIsIgnored,
    SqlOptionIsEnabled;
string
    DatabaseFormat;
string[]
    OutputFormatArray;
string[]
    ExcludedCommandArray;
RANDOM
    Random;
SCHEMA
    Schema;

// -- FUNCTIONS

void PrintWarning(
    string message
    )
{
    writeln( "*** WARNING : ", message );
}

// ~~

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

void Abort(
    string message,
    Exception exception
    )
{
    PrintError( message );
    PrintError( exception.msg );

    exit( -1 );
}

// ~~

bool IsLinux(
    )
{
    version ( linux )
    {
        return true;
    }
    else
    {
        return false;
    }
}

// ~~

bool IsMacOs(
    )
{
    version ( OSX )
    {
        return true;
    }
    else
    {
        return false;
    }
}

// ~~

bool IsWindows(
    )
{
    version ( Windows )
    {
        return true;
    }
    else
    {
        return false;
    }
}

// ~~

string GetFolderPath(
    string file_path
    )
{
    long
        folder_separator_character_index;

    folder_separator_character_index = file_path.replace( '\\', '/' ).lastIndexOf( '/' );

    if ( folder_separator_character_index >= 0 )
    {
        return file_path[ 0 .. folder_separator_character_index + 1 ];
    }
    else
    {
        return "";
    }
}

// ~~

string GetFileName(
    string file_path
    )
{
    long
        folder_separator_character_index;

    folder_separator_character_index = file_path.replace( '\\', '/' ).lastIndexOf( '/' );

    if ( folder_separator_character_index >= 0 )
    {
        return file_path[ folder_separator_character_index + 1 .. $ ];
    }
    else
    {
        return file_path;
    }
}

// ~~

void CreateFolder(
    string folder_path
    )
{
    if ( folder_path != ""
         && folder_path != "/"
         && !folder_path.exists() )
    {
        writeln( "Creating folder : ", folder_path );

        try
        {
            folder_path.mkdirRecurse();
        }
        catch ( Exception exception )
        {
            Abort( "Can't create folder : " ~ folder_path, exception );
        }
    }
}

// ~~

void WriteText(
    string file_path,
    string file_text
    )
{
    CreateFolder( file_path.dirName() );

    writeln( "Writing file : ", file_path );

    file_text = file_text.stripRight();

    if ( file_text != ""
         && !file_text.endsWith( '\n' ) )
    {
        file_text ~= '\n';
    }

    try
    {
        if ( !file_path.exists()
             || file_path.readText() != file_text )
        {
            file_path.write( file_text );
        }
    }
    catch ( Exception exception )
    {
        Abort( "Can't write file : " ~ file_path, exception );
    }
}

// ~~

string ReadText(
    string file_path
    )
{
    string
        file_text;

    writeln( "Reading file : ", file_path );

    try
    {
        file_text = file_path.readText();
    }
    catch ( Exception exception )
    {
        Abort( "Can't read file : " ~ file_path, exception );
    }

    return file_text;
}

// ~~

bool IsInteger(
    string text
    )
{
    if ( text.length > 0
         && text[ 0 ] == '-' )
    {
        text = text[ 1 .. $ ];
    }

    if ( text.length > 0 )
    {
        foreach ( character; text )
        {
            if ( character < '0'
                 || character > '9' )
            {
                return false;
            }
        }

        return true;
    }
    else
    {
        return false;
    }
}

// ~~

ulong GetNatural(
    string text
    )
{
    try
    {
        return text.to!ulong();
    }
    catch ( Exception exception )
    {
        Abort( "Invalid natural : " ~ text, exception );
    }

    return 0;
}

// ~~

long GetInteger(
    string text
    )
{
    try
    {
        return text.to!long();
    }
    catch ( Exception exception )
    {
        Abort( "Invalid integer : " ~ text, exception );
    }

    return 0;
}

// ~~

double GetReal(
    string text
    )
{
    try
    {
        return text.to!double();
    }
    catch ( Exception exception )
    {
        Abort( "Invalid real : " ~ text, exception );
    }

    return 0.0;
}

// ~~

bool IsDigitCharacter(
    dchar character
    )
{
    return
        character >= '0'
        && character <= '9';
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

string AddPrefix(
    string text,
    string prefix
    )
{
    return prefix ~ text;
}

// ~~

string RemovePrefix(
    string text,
    string prefix
    )
{
    if ( text.startsWith( prefix ) )
    {
        return text[ prefix.length .. $ ];
    }
    else
    {
        return text;
    }
}

// ~~

string ReplacePrefix(
    string text,
    string old_prefix,
    string new_prefix
    )
{
    if ( text.startsWith( old_prefix ) )
    {
        return new_prefix ~ text[ old_prefix.length .. $ ];
    }
    else
    {
        return text;
    }
}

// ~~

string AddSuffix(
    string text,
    string suffix
    )
{
    return text ~ suffix;
}

// ~~

string RemoveSuffix(
    string text,
    string suffix
    )
{
    if ( text.endsWith( suffix ) )
    {
        return text[ 0 .. $ - suffix.length ];
    }
    else
    {
        return text;
    }
}

// ~~

string ReplaceSuffix(
    string text,
    string old_suffix,
    string new_suffix
    )
{
    if ( text.endsWith( old_suffix ) )
    {
        return text[ 0 .. $ - old_suffix.length ] ~ new_suffix;
    }
    else
    {
        return text;
    }
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
    dstring
        unicode_text;

    if ( text == "" )
    {
        return "";
    }
    else
    {
        unicode_text = text.to!dstring();

        return ( unicode_text[ 0 .. 1 ].capitalize() ~ unicode_text[ 1 .. $ ] ).to!string();
    }
}

// ~~

string GetPascalCaseText(
    string text
    )
{
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

dstring GetSnakeCaseText(
    dstring text
    )
{
    dchar
        character,
        next_character,
        prior_character;
    long
        character_index;
    dstring
        snake_case_text;

    text = text.replace( dchar( '-' ), dchar( '_' ) );

    snake_case_text = "";
    prior_character = 0;

    for ( character_index = 0;
          character_index < text.length;
          ++character_index )
    {
        character = text[ character_index ];

        if ( character_index + 1 < text.length )
        {
            next_character = text[ character_index + 1 ];
        }
        else
        {
            next_character = 0;
        }

        if ( ( prior_character.isLower()
               && ( character.isUpper()
                    || character.isDigit() ) )
             || ( prior_character.isDigit()
                  && ( character.isLower()
                       || character.isUpper() ) )
             || ( prior_character.isUpper()
                  && character.isUpper()
                  && next_character.isLower() ) )
        {
            snake_case_text ~= '_';
        }

        snake_case_text ~= character;
        prior_character = character;
    }

    return snake_case_text;
}

// ~~

string GetSnakeCaseText(
    string text
    )
{
    return text.to!dstring().GetSnakeCaseText().to!string();
}

// ~~

string GetKebabCaseText(
    string text
    )
{
    return text.GetSnakeCaseText().replace( '_', '-' );
}

// ~~

string GetTypeCaseText(
    string text
    )
{
    return text.GetSnakeCaseText().toUpper();
}

// ~~

string GetAttributeCaseText(
    string text
    )
{
    return text.GetSnakeCaseText().toLower().GetPascalCaseText();
}

// ~~

string GetVariableCaseText(
    string text
    )
{
    return text.GetSnakeCaseText().toLower();
}

// ~~

string GetStyleCaseText(
    string text
    )
{
    return text.GetKebabCaseText().toLower();
}

// ~~

string GetTitleCaseText(
    string text
    )
{
    string[]
        word_array;

    word_array = text.GetSnakeCaseText().toLower().split( '_' );

    foreach ( ref word; word_array )
    {
        word = word.GetCapitalizedText();
    }

    return word_array.join( " " );
}

// ~~

string GetSentenceCaseText(
    string text
    )
{
    return text.GetSnakeCaseText().toLower().replace( '_', ' ' ).GetCapitalizedText();
}

// ~~

string GetLocutionCaseText(
    string text
    )
{
    return text.GetSnakeCaseText().toLower().replace( '_', ' ' );
}

// ~~

dstring GetSlugCaseText(
    dstring text
    )
{
    dstring
        slug_case_text;

    foreach ( character; text )
    {
        if ( character.isAlpha() )
        {
            slug_case_text ~= character.toLower();
        }
        else if ( character >= '0'
                  && character <= '9' )
        {
            if ( slug_case_text != ""
                 && !slug_case_text.endsWith( '-' )
                 && !IsDigitCharacter( slug_case_text[ $ - 1 ] ) )
            {
                slug_case_text ~= '-';
            }

            slug_case_text ~= character;
        }
        else
        {
            if ( !slug_case_text.endsWith( '-' ) )
            {
                slug_case_text ~= '-';
            }
        }
    }

    if ( slug_case_text.endsWith( '-' ) )
    {
        slug_case_text = slug_case_text[ 0 .. $ - 1 ];
    }

    return slug_case_text;
}

// ~~

string GetSlugCaseText(
    string text
    )
{
    return text.to!dstring().GetSlugCaseText().to!string();
}

// ~~

string GetPluralText(
    string text
    )
{
    char
        last_character;

    if ( text == "" )
    {
        return "";
    }
    else
    {
        last_character = text[ $ - 1 ];

        if ( last_character >= 'a' && last_character <= 'z' )
        {
            text = text ~ 's';

            if ( text.endsWith( "ays" )
                 || text.endsWith( "eys" )
                 || text.endsWith( "oys" ) )
            {
                return text;
            }
            else
            {
                return
                    text
                        .ReplaceSuffix( "fs", "ves" )
                        .ReplaceSuffix( "hs", "hes" )
                        .ReplaceSuffix( "iss", "es" )
                        .ReplaceSuffix( "os", "oes" )
                        .ReplaceSuffix( "ss", "ses" )
                        .ReplaceSuffix( "xs", "xes" )
                        .ReplaceSuffix( "ys", "ies" )
                        .ReplaceSuffix( "zs", "zes" );
            }
        }
        else if ( last_character >= 'A' && last_character <= 'Z' )
        {
            text = text ~ 'S';

            if ( text.endsWith( "AYS" )
                 || text.endsWith( "EYS" )
                 || text.endsWith( "OYS" ) )
            {
                return text;
            }
            else
            {
                return
                    text
                        .ReplaceSuffix( "FS", "VES" )
                        .ReplaceSuffix( "HS", "HES" )
                        .ReplaceSuffix( "ISS", "ES" )
                        .ReplaceSuffix( "OS", "OES" )
                        .ReplaceSuffix( "SS", "SES" )
                        .ReplaceSuffix( "XS", "XES" )
                        .ReplaceSuffix( "YS", "IES" )
                        .ReplaceSuffix( "ZS", "ZES" );
            }
        }
        else
        {
            return text;
        }
    }
}

// ~~

bool HasCommand(
    string line,
    string[] command_array
    )
{
    foreach ( command; command_array )
    {
        if ( line.startsWith( command ) )
        {
            return true;
        }
    }

    return false;
}

// ~~

string GetFilteredScript(
    string script,
    string[] excluded_command_array
    )
{
    string[]
        filtered_line_array,
        line_array;

    line_array = script.split( '\n' );

    foreach ( line; line_array )
    {
        if ( !line.HasCommand( excluded_command_array ) )
        {
            filtered_line_array ~= line;
        }
        else if ( filtered_line_array.length > 0
                  && filtered_line_array[ $ - 1 ] == "" )
        {
            --filtered_line_array.length;
        }
    }

    return filtered_line_array.join( '\n' );
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

string GetProcessedText(
    string text
    )
{
    char
        character;
    long
        character_index;
    string
        processed_text;

    for ( character_index = 0;
          character_index < text.length;
          ++character_index )
    {
        character = text[ character_index ];

        if ( character == '\\'
             && character_index + 1 < text.length )
        {
            ++character_index;
            character = text[ character_index ];

            if ( character == 'n' )
            {
                processed_text ~= '\n';
            }
            else if ( character == 'r' )
            {
                processed_text ~= '\r';
            }
            else if ( character == 's' )
            {
                processed_text ~= ' ';
            }
            else if ( character == 't' )
            {
                processed_text ~= '\t';
            }
            else if ( character != 'v' )
            {
                processed_text ~= character;
            }
        }
        else
        {
            processed_text ~= character;
        }
    }

    return processed_text;
}

// ~~

string[] Split(
    string text,
    char separator_character
    )
{
    char
        character;
    long
        character_index;
    string[]
        part_array;

    if ( text != "" )
    {
        part_array ~= "";

        for ( character_index = 0;
              character_index < text.length;
              ++character_index )
        {
            character = text[ character_index ];

            if ( character == separator_character )
            {
                part_array ~= "";
            }
            else
            {
                part_array[ $ - 1 ] ~= character;

                if ( character == '\\'
                     && character_index + 1 < text.length )
                {
                    ++character_index;
                    part_array[ $ - 1 ] ~= text[ character_index ];
                }
            }
        }
    }

    return part_array;
}

// ~~

string[] GetPartArray(
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

string[] GetPartArray(
    string text,
    string separator
    )
{
    bool
        character_is_in_string;
    char
        character;
    long
        character_index;
    string[]
        part_array;

    if ( text != "" )
    {
        part_array = [ "" ];
        character_is_in_string = false;

        for ( character_index = 0;
              character_index < text.length;
              ++character_index )
        {
            character = text[ character_index ];

            if ( character_is_in_string )
            {
                part_array[ part_array.length.to!long() - 1 ] ~= character;

                if ( character == '\\'
                     && character_index + 1 < text.length )
                {
                    ++character_index;

                    part_array[ part_array.length.to!long() - 1 ] ~= text[ character_index ];
                }
                else if ( character == '"' )
                {
                    character_is_in_string = false;
                }
            }
            else if ( character == separator[ 0 ]
                      && character_index + separator.length <= text.length
                      && ( separator.length == 1
                           || text[ character_index .. character_index + separator.length ] == separator ) )
            {
                part_array ~= "";
            }
            else
            {
                part_array[ part_array.length.to!long() - 1 ] ~= character;

                if ( character == '"' )
                {
                    character_is_in_string = true;
                }
            }
        }
    }

    return part_array;
}

// ~~

string ReplaceColumnTags(
    string template_text,
    TABLE table
    )
{
    bool
        added_is_checked,
        edited_is_checked,
        key_is_checked,
        stored_is_checked,
        column_is_any,
        column_is_key,
        column_is_stored;
    long
        tag_index;
    string
        closing_tag,
        instance_part,
        opening_tag;
    string[]
        template_part_array;

    for ( tag_index = 0;
          tag_index < 15;
          ++tag_index )
    {
        opening_tag = [ "<%^", "<@^", "<$^", "<%°", "<@°", "<$°", "<%¨", "<@¨", "<$¨", "<%§", "<@§", "<$§", "<%", "<@", "<$" ][ tag_index ];
        closing_tag = [ "^%>", "^@>", "^$>", "°%>", "°@>", "°$>", "¨%>", "¨@>", "¨$>", "§%>", "§@>", "§$>", "%>", "@>", "$>" ][ tag_index ];
        key_is_checked = [ false, true, true, false, true, true, false, true, true, false, true, true, false, true, true ][ tag_index ];
        column_is_key = [ false, true, false, false, true, false, false, true, false, false, true, false, false, true, false ][ tag_index ];
        stored_is_checked = [ true, true, true, true, true, true, false, false, false, false, false, false, false, false, false ][ tag_index ];
        column_is_stored = [ true, true, true, false, false, false, false, false, false, false, false, false, false, false, false ][ tag_index ];
        added_is_checked = [ false, false, false, false, false, false, true, true, true, false, false, false, false, false, false ][ tag_index ];
        edited_is_checked = [ false, false, false, false, false, false, false, false, false, true, true, true, false, false, false ][ tag_index ];

        template_part_array = template_text.GetPartArray( opening_tag, closing_tag );

        foreach ( template_part_index, ref template_part; template_part_array )
        {
            if ( ( template_part_index & 1 ) == 1 )
            {
                instance_part = "";

                foreach ( column; table.ColumnArray )
                {
                    if ( ( !key_is_checked || column.IsKey == column_is_key )
                         && ( !stored_is_checked || column.IsStored == column_is_stored )
                         && ( !added_is_checked || column.IsAdded )
                         && ( !edited_is_checked || column.IsEdited ) )
                    {
                        instance_part ~= column.ReplaceProperties( template_part );
                    }
                }

                template_part = instance_part;
            }
        }

        template_text = template_part_array.join( "" );
    }

    return template_text;
}

// ~~

string ReplaceTableTags(
    string template_text,
    TABLE[] table_array
    )
{

    bool
        edited_is_checked,
        stored_is_checked,
        table_is_any,
        table_is_stored;
    long
        tag_index;
    string
        closing_tag,
        instance_part,
        opening_tag;
    string[]
        template_part_array;

    for ( tag_index = 0;
          tag_index < 4;
          ++tag_index )
    {
        opening_tag = [ "<#^", "<#°", "<#§", "<#" ][ tag_index ];
        closing_tag = [ "^#>", "°#>", "§#>", "#>" ][ tag_index ];
        stored_is_checked = [ true, true, false, false ][ tag_index ];
        table_is_stored = [ true, false, false, false ][ tag_index ];
        edited_is_checked = [ false, false, true, false ][ tag_index ];

        template_part_array = template_text.GetPartArray( opening_tag, closing_tag );

        foreach ( template_part_index, ref template_part; template_part_array )
        {
            if ( ( template_part_index & 1 ) == 1 )
            {
                instance_part = "";

                foreach ( table; table_array )
                {
                    if ( ( !stored_is_checked || table.IsStored == table_is_stored )
                         && ( !edited_is_checked || table.IsEdited ) )
                    {
                        instance_part
                            ~= table.ReplaceProperties( template_part )
                                    .ReplaceColumnTags( table );
                    }
                }

                template_part = instance_part;
            }
        }

        template_text = template_part_array.join( "" );
    }

    return template_text;
}

// ~~

string ReplaceProperties(
    string template_text,
    string opening_tag,
    string closing_tag,
    string[ string ] property_value_map
    )
{
    string *
        property_value;
    string[]
        template_part_array;

    template_part_array = template_text.GetPartArray( opening_tag, closing_tag );

    foreach ( template_part_index, ref template_part; template_part_array )
    {
        if ( ( template_part_index & 1 ) == 1 )
        {
            property_value = template_part in property_value_map;

            if ( property_value !is null )
            {
                template_part = *property_value;
            }
            else
            {
                template_part = "false";
            }
        }
    }

    return template_part_array.join( "" );
}

// ~~

string GetBooleanText(
    bool boolean
    )
{
    if ( boolean )
    {
        return "true";
    }
    else
    {
        return "false";
    }
}

// ~~

string EvaluateBooleanExpression(
    string boolean_expression
    )
{
    string
        old_boolean_expression;

    do
    {
        old_boolean_expression = boolean_expression;

        boolean_expression
            = boolean_expression
                  .replace( " ", "" )
                  .replace( "!false", "true" )
                  .replace( "!true", "false" )
                  .replace( "false&&false", "false" )
                  .replace( "false&&true", "false" )
                  .replace( "true&&false", "false" )
                  .replace( "true&&true", "true" )
                  .replace( "false||false", "false" )
                  .replace( "false||true", "true" )
                  .replace( "true||false", "true" )
                  .replace( "true||true", "true" )
                  .replace( "(true)", "true")
                  .replace( "(false)", "false" );
    }
    while ( boolean_expression != old_boolean_expression );

    return boolean_expression;
}

// ~~

string ReplaceConditionalTags(
    string text,
    string opening_tag,
    string closing_tag,
    string separator_tag
    )
{
    char
        closing_tag_first_character,
        opening_tag_first_character;
    long
        character_index,
        closing_tag_character_count,
        first_character_index,
        level,
        opening_tag_character_count,
        post_character_index;
    string
        boolean_expression,
        old_text,
        result_text,
        sub_value_separator_text,
        template_text,
        value_result_text,
        value_separator_text,
        value_text,
        variable_name;
    string[]
        argument_array,
        sub_value_array,
        value_array;

    if ( text.indexOf( opening_tag ) > 0 )
    {
        opening_tag_character_count = opening_tag.length;
        closing_tag_character_count = closing_tag.length;

        opening_tag_first_character = opening_tag[ 0 ];
        closing_tag_first_character = closing_tag[ 0 ];

        do
        {
            old_text = text;
            first_character_index = -1;

            for ( character_index = 0;
                  character_index + opening_tag_character_count - 1 < text.length;
                  ++character_index )
            {
                if ( text[ character_index ] == opening_tag_first_character
                     && text[ character_index .. character_index + opening_tag_character_count ] == opening_tag )
                {
                    first_character_index = character_index;
                    character_index += opening_tag_character_count - 1;
                }
                else if ( text[ character_index ] == closing_tag_first_character
                          && text[ character_index .. character_index + closing_tag_character_count ] == closing_tag )
                {
                    post_character_index = character_index + closing_tag_character_count;

                    if ( first_character_index < 0 )
                    {
                        Abort( "Invalid " ~ opening_tag ~ " " ~ closing_tag ~" block : " ~ text[ 0 .. post_character_index ] );
                    }

                    argument_array = text[ first_character_index + opening_tag_character_count .. character_index ].split( separator_tag );

                    if ( ( argument_array.length == 4
                           || argument_array.length == 5 )
                         && argument_array[ 0 ] == "Equals" )
                    {
                        if ( argument_array[ 1 ] == argument_array[ 2 ] )
                        {
                            result_text = argument_array[ 3 ];
                        }
                        else if ( argument_array.length == 5 )
                        {
                            result_text = argument_array[ 4 ];
                        }
                        else
                        {
                            result_text = "";
                        }
                    }
                    else if ( ( argument_array.length == 4
                                || argument_array.length == 5 )
                              && argument_array[ 0 ] == "!Equals" )
                    {
                        if ( argument_array[ 1 ] != argument_array[ 2 ] )
                        {
                            result_text = argument_array[ 3 ];
                        }
                        else if ( argument_array.length == 5 )
                        {
                            result_text = argument_array[ 4 ];
                        }
                        else
                        {
                            result_text = "";
                        }
                    }
                    else if ( ( argument_array.length == 4
                                || argument_array.length == 5 )
                              && argument_array[ 0 ] == "HasPrefix" )
                    {
                        if ( argument_array[ 1 ].startsWith( argument_array[ 2 ] ) )
                        {
                            result_text = argument_array[ 3 ];
                        }
                        else if ( argument_array.length == 5 )
                        {
                            result_text = argument_array[ 4 ];
                        }
                        else
                        {
                            result_text = "";
                        }
                    }
                    else if ( ( argument_array.length == 4
                                || argument_array.length == 5 )
                              && argument_array[ 0 ] == "!HasPrefix" )
                    {
                        if ( !argument_array[ 1 ].startsWith( argument_array[ 2 ] ) )
                        {
                            result_text = argument_array[ 3 ];
                        }
                        else if ( argument_array.length == 5 )
                        {
                            result_text = argument_array[ 4 ];
                        }
                        else
                        {
                            result_text = "";
                        }
                    }
                    else if ( ( argument_array.length == 4
                                || argument_array.length == 5 )
                              && argument_array[ 0 ] == "HasSuffix" )
                    {
                        if ( argument_array[ 1 ].endsWith( argument_array[ 2 ] ) )
                        {
                            result_text = argument_array[ 3 ];
                        }
                        else if ( argument_array.length == 5 )
                        {
                            result_text = argument_array[ 4 ];
                        }
                        else
                        {
                            result_text = "";
                        }
                    }
                    else if ( ( argument_array.length == 4
                                || argument_array.length == 5 )
                              && argument_array[ 0 ] == "!HasSuffix" )
                    {
                        if ( !argument_array[ 1 ].endsWith( argument_array[ 2 ] ) )
                        {
                            result_text = argument_array[ 3 ];
                        }
                        else if ( argument_array.length == 5 )
                        {
                            result_text = argument_array[ 4 ];
                        }
                        else
                        {
                            result_text = "";
                        }
                    }
                    else if ( ( argument_array.length == 4
                                || argument_array.length == 5 )
                              && argument_array[ 0 ] == "Contains" )
                    {
                        if ( argument_array[ 1 ].indexOf( argument_array[ 2 ] ) >= 0 )
                        {
                            result_text = argument_array[ 3 ];
                        }
                        else if ( argument_array.length == 5 )
                        {
                            result_text = argument_array[ 4 ];
                        }
                        else
                        {
                            result_text = "";
                        }
                    }
                    else if ( ( argument_array.length == 4
                                || argument_array.length == 5 )
                              && argument_array[ 0 ] == "!Contains" )
                    {
                        if ( argument_array[ 1 ].indexOf( argument_array[ 2 ] ) < 0 )
                        {
                            result_text = argument_array[ 3 ];
                        }
                        else if ( argument_array.length == 5 )
                        {
                            result_text = argument_array[ 4 ];
                        }
                        else
                        {
                            result_text = "";
                        }
                    }
                    else if ( ( argument_array.length == 2
                                || argument_array.length == 3 )
                              && argument_array[ 0 ] == "IsLinux" )
                    {

                        if ( IsLinux() )
                        {
                            result_text = argument_array[ 1 ];
                        }
                        else if ( argument_array.length == 3 )
                        {
                            result_text = argument_array[ 2 ];
                        }
                        else
                        {
                            result_text = "";
                        }
                    }
                    else if ( ( argument_array.length == 2
                                || argument_array.length == 3 )
                              && argument_array[ 0 ] == "IsMacOS" )
                    {

                        if ( IsMacOs() )
                        {
                            result_text = argument_array[ 1 ];
                        }
                        else if ( argument_array.length == 3 )
                        {
                            result_text = argument_array[ 2 ];
                        }
                        else
                        {
                            result_text = "";
                        }
                    }
                    else if ( ( argument_array.length == 2
                                || argument_array.length == 3 )
                              && argument_array[ 0 ] == "IsWindows" )
                    {

                        if ( IsWindows() )
                        {
                            result_text = argument_array[ 1 ];
                        }
                        else if ( argument_array.length == 3 )
                        {
                            result_text = argument_array[ 2 ];
                        }
                        else
                        {
                            result_text = "";
                        }
                    }
                    else if ( argument_array.length == 3
                              && argument_array[ 0 ] == "RemovePrefix" )
                    {
                        result_text = argument_array[ 1 ].RemovePrefix( argument_array[ 2 ] );
                    }
                    else if ( argument_array.length == 4
                              && argument_array[ 0 ] == "ReplacePrefix" )
                    {
                        result_text = argument_array[ 1 ].ReplacePrefix( argument_array[ 2 ],  argument_array[ 3 ] );
                    }
                    else if ( argument_array.length == 3
                              && argument_array[ 0 ] == "RemoveSuffix" )
                    {
                        result_text = argument_array[ 1 ].RemoveSuffix( argument_array[ 2 ] );
                    }
                    else if ( argument_array.length == 4
                              && argument_array[ 0 ] == "ReplaceSuffix" )
                    {
                        result_text = argument_array[ 1 ].ReplaceSuffix( argument_array[ 2 ],  argument_array[ 3 ] );
                    }
                    else if ( argument_array.length == 3
                              && argument_array[ 0 ] == "Remove" )
                    {
                        result_text = argument_array[ 1 ].replace( argument_array[ 2 ], "" );
                    }
                    else if ( argument_array.length == 4
                              && argument_array[ 0 ] == "Replace" )
                    {
                        result_text = argument_array[ 1 ].replace( argument_array[ 2 ], argument_array[ 3 ] );
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "LowerCase" )
                    {
                        result_text = argument_array[ 1 ].toLower();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "UpperCase" )
                    {
                        result_text = argument_array[ 1 ].toUpper();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "PascalCase" )
                    {
                        result_text = argument_array[ 1 ].GetPascalCaseText();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "SnakeCase" )
                    {
                        result_text = argument_array[ 1 ].GetSnakeCaseText();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "KebabCase" )
                    {
                        result_text = argument_array[ 1 ].GetKebabCaseText();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "TypeCase" )
                    {
                        result_text = argument_array[ 1 ].GetTypeCaseText();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "AttributeCase" )
                    {
                        result_text = argument_array[ 1 ].GetAttributeCaseText();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "VariableCase" )
                    {
                        result_text = argument_array[ 1 ].GetVariableCaseText();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "StyleCase" )
                    {
                        result_text = argument_array[ 1 ].GetStyleCaseText();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "TitleCase" )
                    {
                        result_text = argument_array[ 1 ].GetTitleCaseText();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "SentenceCase" )
                    {
                        result_text = argument_array[ 1 ].GetSentenceCaseText();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "LocutionCase" )
                    {
                        result_text = argument_array[ 1 ].GetLocutionCaseText();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "SlugCase" )
                    {
                        result_text = argument_array[ 1 ].GetSlugCaseText();
                    }
                    else if ( argument_array.length == 2
                              && argument_array[ 0 ] == "Plural" )
                    {
                        result_text = argument_array[ 1 ].GetPluralText();
                    }
                    else if ( argument_array.length == 5
                              && argument_array[ 0 ] == "Split" )
                    {
                        variable_name = argument_array[ 1 ];
                        value_text = argument_array[ 2 ];
                        value_separator_text = argument_array[ 3 ];
                        result_text = argument_array[ 4 ];

                        value_array = value_text.split( value_separator_text );

                        foreach ( value_index, value; value_array )
                        {
                            result_text
                                = result_text.replace( "{*" ~ variable_name ~ ( value_index + 1 ).to!string() ~ "*}", value );
                        }
                    }
                    else if ( argument_array.length == 5
                              && argument_array[ 0 ] == "Map" )
                    {
                        variable_name = argument_array[ 1 ];
                        value_text = argument_array[ 2 ];
                        value_separator_text = argument_array[ 3 ];
                        template_text = argument_array[ 4 ];

                        result_text = "";

                        value_array = value_text.split( value_separator_text );

                        foreach ( value; value_array )
                        {
                            result_text
                                ~= template_text.replace( "{*" ~ variable_name ~ "*}", value );
                        }
                    }
                    else if ( argument_array.length == 6
                              && argument_array[ 0 ] == "Map" )
                    {
                        variable_name = argument_array[ 1 ];
                        value_text = argument_array[ 2 ];
                        value_separator_text = argument_array[ 3 ];
                        sub_value_separator_text = argument_array[ 4 ];
                        template_text = argument_array[ 5 ];

                        result_text = "";

                        value_array = value_text.split( value_separator_text );

                        foreach ( value; value_array )
                        {
                            value_result_text = template_text;

                            sub_value_array = value.split( sub_value_separator_text );

                            foreach ( sub_value_index, sub_value; sub_value_array )
                            {
                                value_result_text
                                    = value_result_text.replace( "{*" ~ variable_name ~ ( sub_value_index + 1 ).to!string() ~ "*}", sub_value );
                            }

                            result_text ~= value_result_text;
                        }
                    }

                    else if ( ( argument_array.length == 2
                                || argument_array.length == 3 ) )
                    {
                        boolean_expression = EvaluateBooleanExpression( argument_array[ 0 ] );

                        if ( boolean_expression == "true" )
                        {
                            result_text = argument_array[ 1 ];
                        }
                        else if ( boolean_expression == "false" )
                        {
                            if ( argument_array.length == 3 )
                            {
                                result_text = argument_array[ 2 ];
                            }
                            else
                            {
                                result_text = "";
                            }
                        }
                        else
                        {
                            Abort( "Invalid boolean expression : " ~ argument_array[ 0 ] );
                        }
                    }
                    else
                    {
                        Abort( "Invalid <~ ~> block : " ~ text[ first_character_index .. post_character_index ] );
                    }

                    text
                        = text[ 0 .. first_character_index ]
                          ~ result_text
                          ~ text[ post_character_index .. $ ];

                    break;
                }
            }
        }
        while ( text != old_text );
    }

    return text;
}

// ~~

string ReplaceIgnoredTags(
    string text
    )
{
    return
        text
            .replace( "<\\#", "<#" )
            .replace( "#\\>", "#>" )
            .replace( "<\\%", "<%" )
            .replace( "%\\>", "%>" )
            .replace( "<\\@", "<@" )
            .replace( "@\\>", "@>" )
            .replace( "<\\$", "<$" )
            .replace( "$\\>", "$>" )
            .replace( "<\\*", "<*" )
            .replace( "*\\>", "*>" )
            .replace( "<\\*>", "<*>" )
            .replace( "<\\~", "<~" )
            .replace( "<\\+\\~", "<+~" )
            .replace( "<\\+\\+\\~", "<++~" )
            .replace( "~\\>", "~>" )
            .replace( "~\\+\\>", "~+>" )
            .replace( "~\\+\\+\\>", "~++>" )
            .replace( "<\\>", "<>" )
            .replace( "<\\+\\>", "<+>" )
            .replace( "<\\+\\+\\>", "<++>" )
            .replace( "{\\#", "{#" )
            .replace( "#\\}", "#}" )
            .replace( "{\\%", "{%" )
            .replace( "%\\}", "%}" )
            .replace( "%\\%", "%%" );
}

// ~~

void ProcessFiles(
    string[] file_path_array
    )
{
    string
        base_file_path;

    base_file_path = file_path_array[ 0 ][ 0 .. $ - 3 ];

    Random = new RANDOM();

    Schema = new SCHEMA();
    Schema.ReadFiles( file_path_array );

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
            Schema.WriteSqlDumpFile( base_file_path ~ "_dump.sql" );
        }
        else if ( output_format == "cql" )
        {
            Schema.WriteCqlSchemaFile( base_file_path ~ ".cql" );
            Schema.WriteCqlDataFile( base_file_path ~ "_data.cql" );
        }
        else if ( output_format == "json" )
        {
            Schema.WriteJsonDataFile( base_file_path ~ "_data.json" );
        }
        else if ( output_format == "go" )
        {
            Schema.WriteGoTypeFile( GetFolderPath( base_file_path ) ~ "GO/" ~ GetFileName( base_file_path ) ~ "_type.go" );
        }
        else if ( output_format == "generis" )
        {
            Schema.WriteGenerisTypeFile( GetFolderPath( base_file_path ) ~ "GS/" ~ GetFileName( base_file_path ) ~ "_type.gs" );
            Schema.WriteGenerisQueryFile( GetFolderPath( base_file_path ) ~ "GS/" ~ GetFileName( base_file_path ) ~ "_query.gs" );
            Schema.WriteGenerisResponseFile( GetFolderPath( base_file_path ) ~ "GS/" ~ GetFileName( base_file_path ) ~ "_response.gs" );
            Schema.WriteGenerisRequestFile( GetFolderPath( base_file_path ) ~ "GS/" ~ GetFileName( base_file_path ) ~ "_request.gs" );
            Schema.WriteGenerisRouteFile( GetFolderPath( base_file_path ) ~ "GS/" ~ GetFileName( base_file_path ) ~ "_route.gs" );
            Schema.WriteGenerisConstantFile( GetFolderPath( base_file_path ) ~ "GS/" ~ GetFileName( base_file_path ) ~ "_constant.gs" );
        }
        else if ( output_format == "phoenix" )
        {
            Schema.WritePhoenixQueryFiles( GetFolderPath( base_file_path ) ~ "PHX/MODEL/" );
        }
        else if ( output_format == "crystal" )
        {
            Schema.WriteCrystalTypeFile( GetFolderPath( base_file_path ) ~ "CR/" ~ GetFileName( base_file_path ) ~ "_type.cr" );
        }
        else if ( output_format == "csharp" )
        {
            Schema.WriteCsharpTypeFile( GetFolderPath( base_file_path ) ~ "CS/" ~ GetFileName( base_file_path ) ~ "_type.cs" );
            Schema.WriteCsharpConstantFile( GetFolderPath( base_file_path ) ~ "CS/" ~ GetFileName( base_file_path ) ~ "_constant.cs" );
        }
        else if ( output_format == "rust" )
        {
            Schema.WriteRustTypeFile( GetFolderPath( base_file_path ) ~ "RS/" ~ GetFileName( base_file_path ) ~ "_type.rs" );
        }
        else if ( output_format == "javascript" )
        {
            Schema.WriteJavascriptTypeFile( GetFolderPath( base_file_path ) ~ "JS/" ~ GetFileName( base_file_path ) ~ "_type.js" );
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
    DropIsIgnored = false;
    DropIsForced = false;

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
        else if ( option == "--json"
                  && DatabaseFormat != "" )
        {
            OutputFormatArray ~= "json";
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
        else if ( option == "--phoenix"
                  && DatabaseFormat != "" )
        {
            OutputFormatArray ~= "phoenix";
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
        else if ( option == "--ignore-drop" )
        {
            DropIsIgnored = true;
        }
        else if ( option == "--force-drop" )
        {
            DropIsForced = true;
        }
        else if ( option == "--exclude-command"
                  && argument_array.length >= 1 )
        {
            ExcludedCommandArray ~= argument_array[ 0 ] ~ ' ';

            argument_array = argument_array[ 1 .. $ ];
        }
        else
        {
            Abort( "Invalid option : " ~ option );
        }
    }

    if ( argument_array.length >= 1 )
    {
        ProcessFiles( argument_array );
    }
    else
    {
        writeln( "Usage :" );
        writeln( "    basil [options] script_file.bs [script_file.bs|bd|bt ...]" );
        writeln( "Options :" );
        writeln( "    --uml" );
        writeln( "    --sql" );
        writeln( "    --cql" );
        writeln( "    --go" );
        writeln( "    --generis" );
        writeln( "    --phoenix" );
        writeln( "    --crystal" );
        writeln( "    --csharp" );
        writeln( "    --rust" );
        writeln( "    --javascript" );
        writeln( "    --template <template_file_path>" );
        writeln( "    --ignore-drop" );
        writeln( "    --force-drop" );
        writeln( "    --exclude-command <command_name>" );
        writeln( "Examples :" );
        writeln( "    basil --uml script_file.bs" );
        writeln( "    basil --uml --sql --go script_file.bs" );

        Abort( "Invalid arguments : " ~ argument_array.to!string() );
    }
}
