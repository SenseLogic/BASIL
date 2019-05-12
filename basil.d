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
import std.file : dirEntries, exists, mkdirRecurse, readText, thisExePath, write, FileException, SpanMode;
import std.random : uniform;
import std.path : dirName;
import std.regex : regex, replaceAll, Regex;
import std.stdio : writeln;
import std.string : endsWith, format, indexOf, join, lineSplitter, replace, startsWith, split, strip, stripRight, toLower, toUpper;
import std.digest.md : md5Of;

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

        text = GetExecutablePath( "english_text.txt" ).ReadText();
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

        text = GetExecutablePath( "latin_text.txt" ).ReadText();
        WordArray = text.replace( "\r", "" ).replace( "\n", " " ).strip().split( ' ' );

        GetExecutablePath( "word_table.txt" ).WriteText( WordArray.join( '\n' ) );
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
            ~ "-"
            ~ MakeBlob( 4 )
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
            return "time.Time";
        }
        else if ( type_name == "DATETIME" )
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
            return "DateTime";
        }
        else if ( type_name == "DATETIME" )
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
            return "Array( " ~ GetSubTypeCrystalText() ~ " )";
        }
        else if ( type_name == "TUPLE" )
        {
            return "Tuple( " ~ GetSubTypeCrystalText() ~ " )";
        }
        else if ( type_name == "LIST" )
        {
            return "List( " ~ GetSubTypeCrystalText() ~ " )";
        }
        else if ( type_name == "SET" )
        {
            return "Set( " ~ GetSubTypeCrystalText() ~ " )";
        }
        else if ( type_name == "MAP" )
        {
            return "Hash( " ~ GetSubTypeCrystalText() ~ " )";
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
            return "List< " ~ GetSubTypeCsharpText() ~ " >";
        }
        else if ( type_name == "TUPLE" )
        {
            return "Tuple< " ~ GetSubTypeCsharpText() ~ " >";
        }
        else if ( type_name == "LIST" )
        {
            return "List< " ~ GetSubTypeCsharpText() ~ " >";
        }
        else if ( type_name == "SET" )
        {
            return "HashSet< " ~ GetSubTypeCsharpText() ~ " >";
        }
        else if ( type_name == "MAP" )
        {
            return "Dictionary< " ~ GetSubTypeCsharpText() ~ " >";
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

        foreach ( ref sub_type; ActualType.SubTypeArray )
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
            return "Weak< " ~ GetSubTypeRustText() ~ " >";
        }
        else if ( type_name == "ARRAY" )
        {
            return "Vec< " ~ GetSubTypeRustText() ~ " >";
        }
        else if ( type_name == "TUPLE" )
        {
            return "( " ~ GetSubTypeRustText() ~ " )";
        }
        else if ( type_name == "LIST" )
        {
            return "List< " ~ GetSubTypeRustText() ~ " >";
        }
        else if ( type_name == "SET" )
        {
            return "List< " ~ GetSubTypeRustText() ~ " >";
        }
        else if ( type_name == "MAP" )
        {
            return "Map< " ~ GetSubTypeRustText() ~ " >";
        }
        else
        {
            return Name;
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
                    for ( next_data_token_index = data_token_index;
                          next_data_token_index < data_token_array.length;
                          ++next_data_token_index )
                    {
                        next_data_token = data_token_array[ next_data_token_index ];

                        if ( next_data_token.IsSeparator
                             && next_data_token.Text == "~"
                             && next_data_token.Level == level + 1 )
                        {
                            break;
                        }
                    }

                    SubValueArray ~= new DATA_VALUE( data_token_array[ data_token_index .. next_data_token_index ] );

                    data_token_index = next_data_token_index;
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

    // ~~

    string GetSqlText(
        bool it_is_sub_value = false
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
                sql_text = "1";
            }
            else
            {
                sql_text = "0";
            }
        }
        else if ( type_name == "TUPLE" )
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
        else if ( type_name == "DATE"
                  || type_name == "DATETIME"
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
            foreach ( uuid_text, uuid; Random.UuidMap )
            {
                if ( uuid == Text )
                {
                    text = "#" ~ uuid_text;

                    break;
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
        else
        {
            Text = data_value.Text;
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
            else if ( Type.Column.IsRandomReal )
            {
                Text = Random.MakeReal( Type.Column.MinimumRandomReal, Type.Column.MaximumRandomReal ).to!string();
            }
            else if ( Type.Column.IsRandomInteger )
            {
                Text = Random.MakeInteger( Type.Column.MinimumRandomInteger, Type.Column.MaximumRandomInteger ).to!string();
            }
            else if ( Type.Column.IsRandomNatural )
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
        IsLast,
        IsStored,
        IsLastStored,
        IsLastNotStored,
        IsUnique,
        IsKey,
        IsLastKey,
        IsLastNotKey,
        IsPartitioned,
        IsClustered,
        IsIndexed,
        IsStatic,
        IsRequired,
        IsIncremented,
        IsLastIncremented,
        IsLastNotIncremented,
        IsForeign,
        IsProcessed;
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
    long
        ValueCount;
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
        CsharpAttribute,
        CsharpVariable,
        RustName,
        RustType,
        JavascriptName;

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
                .replace( "{{column_csharp_attribute}}", CsharpAttribute )
                .replace( "{{column_csharp_variable}}", CsharpVariable )
                .replace( "{{column_rust_name}}", RustName )
                .replace( "{{column_rust_type}}", RustType )
                .replace( "{{column_javascript_name}}", JavascriptName )
                .replace( "{{column_is_last}}", GetBooleanText( IsLast ) )
                .replace( "{{column_is_stored}}", GetBooleanText( IsStored ) )
                .replace( "{{column_is_last_stored}}", GetBooleanText( IsLastStored ) )
                .replace( "{{column_is_last_not_stored}}", GetBooleanText( IsLastNotStored ) )
                .replace( "{{column_is_key}}", GetBooleanText( IsKey ) )
                .replace( "{{column_is_last_key}}", GetBooleanText( IsLastKey ) )
                .replace( "{{column_is_last_not_key}}", GetBooleanText( IsLastNotKey ) )
                .replace( "{{column_is_incremented}}", GetBooleanText( IsIncremented ) )
                .replace( "{{column_is_last_incremented}}", GetBooleanText( IsLastIncremented ) )
                .replace( "{{column_is_last_not_incremented}}", GetBooleanText( IsLastNotIncremented ) );
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
        GoVariable = GoName.GetVariableText();
        CrystalType = Type.GetCrystalText();
        CsharpType = Type.GetCsharpText();
        CsharpAttribute = Type.GetCsharpAttributeText();
        CsharpVariable = CsharpName.GetVariableText();
        RustType = Type.GetRustText();

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
        GoType,
        GoAttribute,
        GoVariable,
        CrystalType,
        CsharpType,
        CsharpAttribute,
        CsharpVariable,
        RustType,
        JavascriptType,
        JavascriptAttribute;
    string[]
        KeyNameArray;
    COLUMN[]
        ColumnArray;
    bool
        IsLast,
        IsStored,
        IsLastStored,
        IsLastNotStored;
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
        GoAttribute = name.GetAttributeText();
        GoVariable = name.GetVariableText();
        CrystalType = name;
        CsharpType = name;
        CsharpAttribute = name.GetAttributeText();
        CsharpVariable = name.GetVariableText();
        RustType = name;
        JavascriptType = name;
        JavascriptAttribute = name.GetAttributeText();
        IsStored = true;
        RowCount = schema.RowCount;
    }

    // -- INQUIRIES

    long GetValueCount(
        )
    {
        long
            value_count;

        foreach ( ref column; ColumnArray )
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
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
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
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
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

    string GetSetDatabaseGenerisCode(
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
                   ~ "               \"update " ~ Name ~ " set ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    generis_code ~= column.StoredName ~ " = ?";

                    if ( !column.IsLastNotKey )
                    {
                        generis_code ~= ", ";
                    }
                }
            }

            generis_code ~= " where ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
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
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
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
                if ( column.IsStored
                     && column.IsKey )
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
                if ( column.IsStored
                     && column.IsKey )
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
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    result, error_\n"
                   ~ "        := statement.Exec(\n";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
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
                if ( column.IsStored
                     && column.IsKey )
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
                if ( column.IsStored
                     && column.IsKey )
                {
                    generis_code ~= "               " ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastKey )
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

    string GetGetDatabaseGenerisCode(
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

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    generis_code ~= column.StoredName;

                    if ( column.IsStored
                         && !column.IsLastNotKey )
                    {
                        generis_code ~= ", ";
                    }
                }
            }

            generis_code ~= " from " ~ Name ~ " where ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
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
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    rows, error_\n"
                   ~ "        := statement.Query(\n";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
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
                   ~ "        error_code.SetError( error_, http.StatusBadRequest );\n"
                   ~ "\n"
                   ~ "        return false;\n"
                   ~ "    }\n"
                   ~ "\n"
                   ~ "    for rows.Next()\n"
                   ~ "    {\n"
                   ~ "        error_\n"
                   ~ "            = rows.Scan(";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    generis_code ~= "                  &" ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastNotKey )
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

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    generis_code ~= column.StoredName;

                    if ( !column.IsLastNotKey )
                    {
                        generis_code ~= ", ";
                    }
                }
            }

            generis_code ~= " from " ~ Name ~ " where ";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && column.IsKey )
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
                if ( column.IsStored
                     && column.IsKey )
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
                   ~ "               .Scan(\n";

            foreach ( ref column; ColumnArray )
            {
                if ( column.IsStored
                     && !column.IsKey )
                {
                    generis_code ~= "                    &" ~ GoVariable ~ "." ~ column.GoName;

                    if ( !column.IsLastNotKey )
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

    string GetGetDatabaseArrayGenerisCode(
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

        foreach ( ref column; ColumnArray )
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

        foreach ( ref column; ColumnArray )
        {
            if ( column.IsStored
                 && column.IsKey )
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

        foreach ( ref column; ColumnArray )
        {
            if ( column.IsStored
                 && column.IsKey )
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
                .replace( "{{table_csharp_attribute}}", CsharpAttribute )
                .replace( "{{table_csharp_variable}}", CsharpVariable )
                .replace( "{{table_rust_type}}", RustType )
                .replace( "{{table_javascript_type}}", JavascriptType )
                .replace( "{{table_javascript_attribute}}", JavascriptAttribute )
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
                .replace( "{{table_rust_type_declaration}}", RustTypeDeclaration )
                .replace( "{{table_is_last}}", GetBooleanText( IsLast ) )
                .replace( "{{table_is_stored}}", GetBooleanText( IsStored ) )
                .replace( "{{table_is_last_stored}}", GetBooleanText( IsLastStored ) )
                .replace( "{{table_is_last_not_stored}}", GetBooleanText( IsLastNotStored ) );
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
            last_column,
            last_not_incremented_column,
            last_not_key_column,
            last_not_stored_column,
            last_incremented_column,
            last_key_column,
            last_stored_column;

        writeln( "Processing table : ", Name );

        foreach ( ref column; ColumnArray )
        {
            column.MakeType();
        }

        last_column = null;
        last_stored_column = null;
        last_not_stored_column = null;
        last_key_column = null;
        last_not_key_column = null;
        last_incremented_column = null;
        last_not_incremented_column = null;

        foreach ( ref column; ColumnArray )
        {
            last_column = column;

            if ( column.IsStored )
            {
                last_stored_column = column;
            }

            if ( !column.IsStored )
            {
                last_not_stored_column = column;
            }

            if ( column.IsKey )
            {
                last_key_column = column;
            }

            if ( !column.IsKey )
            {
                last_not_key_column = column;
            }

            if ( column.IsIncremented )
            {
                last_incremented_column = column;
            }

            if ( !column.IsIncremented )
            {
                last_not_incremented_column = column;
            }
        }

        if ( last_column !is null )
        {
            last_column.IsLast = true;
        }

        if ( last_stored_column !is null )
        {
            last_stored_column.IsLastStored = true;
        }

        if ( last_not_stored_column !is null )
        {
            last_not_stored_column.IsLastNotStored = true;
        }

        if ( last_key_column !is null )
        {
            last_key_column.IsLastKey = true;
        }

        if ( last_not_key_column !is null )
        {
            last_not_key_column.IsLastNotKey = true;
        }

        if ( last_incremented_column !is null )
        {
            last_incremented_column.IsLastIncremented = true;
        }

        if ( last_not_incremented_column !is null )
        {
            last_not_incremented_column.IsLastNotIncremented = true;
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
    string
        TemplateFileText;

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

                        if ( column.IsStored
                             && column.IsKey )
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
        TABLE
            last_not_stored_table,
            last_stored_table,
            last_table;

        last_table = null;
        last_stored_table = null;
        last_not_stored_table = null;

        foreach ( ref table; TableArray )
        {
            table.MakeTypes();

            last_table = table;

            if ( table.IsStored )
            {
                last_stored_table = table;
            }

            if ( !table.IsStored )
            {
                last_not_stored_table = table;
            }
        }

        if ( last_table !is null )
        {
            last_table.IsLast = true;
        }

        if ( last_stored_table !is null )
        {
            last_stored_table.IsLastStored = true;
        }

        if ( last_not_stored_table !is null )
        {
            last_not_stored_table.IsLastNotStored = true;
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
                    Abort( "Invalid value count : " ~ data_value.GetText() );
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

    void CheckValues(
        )
    {
        foreach ( ref table; TableArray )
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
            writeln( "Reading file : ", file_path );

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

        sql_schema_file_path.WriteText( sql_schema_file_text );
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

        sql_data_file_path.WriteText( sql_data_file_text );
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

        cql_schema_file_path.WriteText( cql_schema_file_text );
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

        writeln( "Writing JSON data file : ", json_data_file_path );

        json_data_file_text = "{";

        foreach ( ref table; TableArray )
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

        generis_query_file_path.WriteText( generis_query_file_text );
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

        generis_response_file_path.WriteText( generis_response_file_text );
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

        generis_request_file_path.WriteText( generis_request_file_text );
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

        writeln( "Writing Generis uuid file : ", generis_constant_file_path );

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

        writeln( "Writing Csharp uuid file : ", csharp_constant_file_path );

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
            instance_file_text = instance_file_line_array[ 1 .. $ ].join( '\n' );

            writeln( "Writing instance file : " ~ instance_file_path );

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
            instance_file_text
                = TemplateFileText
                      .ReplaceTableTags( TableArray )
                      .ReplaceConditionalTags();

            WriteInstanceFiles( instance_file_text );
        }
    }
}

// -- VARIABLES

bool
    CqlOptionIsEnabled,
    SqlOptionIsEnabled;
string
    DatabaseFormat;
string[]
    OutputFormatArray;
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
    FileException file_exception
    )
{
    PrintError( message );
    PrintError( file_exception.msg );

    exit( -1 );
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
        catch ( FileException file_exception )
        {
            Abort( "Can't create folder : " ~ folder_path, file_exception );
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

    try
    {
        file_path.write( file_text );
    }
    catch ( FileException file_exception )
    {
        Abort( "Can't write file : " ~ file_path, file_exception );
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
    catch ( FileException file_exception )
    {
        Abort( "Can't read file : " ~ file_path, file_exception );
    }

    return file_text;
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

string GetAttributeText(
    string text
    )
{
    return text.GetPascalCaseText();
}

// ~~

string GetVariableText(
    string text
    )
{
    return text.GetSnakeCaseText();
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
    TABLE table
    )
{
    string
        instance_part;
    string[]
        template_part_array;

    template_part_array = template_text.GetSplitText( "<~", "~>" );

    foreach ( template_part_index, ref template_part; template_part_array )
    {
        if ( ( template_part_index & 1 ) == 1 )
        {
            instance_part = "";

            foreach ( column; table.ColumnArray )
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
    TABLE[] table_array
    )
{
    string
        instance_part;
    string[]
        template_part_array;

    template_part_array = template_text.GetSplitText( "<%", "%>" );

    foreach ( template_part_index, ref template_part; template_part_array )
    {
        if ( ( template_part_index & 1 ) == 1 )
        {
            instance_part = "";

            foreach ( table; table_array )
            {
                instance_part
                    ~= table.ReplaceTags( template_part )
                           .ReplaceColumnTags( table );
            }

            template_part = instance_part;
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
    string text
    )
{
    char
        character,
        next_character;
    long
        character_index,
        first_character_index,
        level,
        post_character_index;
    string
        boolean_expression,
        old_text,
        result_text;
    string[]
        argument_array;

    do
    {
        old_text = text;
        first_character_index = -1;

        for ( character_index = 0;
              character_index + 1 < text.length;
              ++character_index )
        {
            character = text[ character_index ];
            next_character = text[ character_index + 1 ];

            if ( character == '<'
                 && next_character == '?' )
            {
                first_character_index = character_index;
                ++character_index;
            }
            else if ( character == '?'
                      && next_character == '>' )
            {
                post_character_index = character_index + 2;

                if ( first_character_index < 0 )
                {
                    Abort( "Invalid <? ?> block : " ~ text[ 0 .. post_character_index ] );
                }

                argument_array = text[ first_character_index + 2 .. character_index ].split( '#' );

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
                else if ( argument_array.length == 3
                          && argument_array[ 0 ] == "RemovePrefix" )
                {
                    if ( argument_array[ 1 ].startsWith( argument_array[ 2 ] ) )
                    {
                        result_text = argument_array[ 1 ][ argument_array[ 2 ].length .. $ ];
                    }
                    else
                    {
                        result_text = argument_array[ 1 ];
                    }
                }
                else if ( argument_array.length == 4
                          && argument_array[ 0 ] == "ReplacePrefix" )
                {
                    if ( argument_array[ 1 ].startsWith( argument_array[ 2 ] ) )
                    {
                        result_text = argument_array[ 3 ] ~ argument_array[ 1 ][ argument_array[ 2 ].length .. $ ];
                    }
                    else
                    {
                        result_text = argument_array[ 1 ];
                    }
                }
                else if ( argument_array.length == 3
                          && argument_array[ 0 ] == "RemoveSuffix" )
                {
                    if ( argument_array[ 1 ].endsWith( argument_array[ 2 ] ) )
                    {
                        result_text = argument_array[ 1 ][ 0 .. $ - argument_array[ 2 ].length ];
                    }
                    else
                    {
                        result_text = argument_array[ 1 ];
                    }
                }
                else if ( argument_array.length == 4
                          && argument_array[ 0 ] == "ReplaceSuffix" )
                {
                    if ( argument_array[ 1 ].endsWith( argument_array[ 2 ] ) )
                    {
                        result_text = argument_array[ 1 ][ 0 .. $ - argument_array[ 2 ].length ] ~ argument_array[ 3 ];
                    }
                    else
                    {
                        result_text = argument_array[ 1 ];
                    }
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
                          && argument_array[ 0 ] == "Snakecase" )
                {
                    result_text = GetSnakeCaseText( argument_array[ 1 ] );
                }
                else if ( argument_array.length == 2
                          && argument_array[ 0 ] == "Pascalcase" )
                {
                    result_text = GetPascalCaseText( argument_array[ 1 ] );
                }
                else if ( argument_array.length == 2
                          && argument_array[ 0 ] == "Lowercase" )
                {
                    result_text = argument_array[ 1 ].toLower();
                }
                else if ( argument_array.length == 2
                          && argument_array[ 0 ] == "Uppercase" )
                {
                    result_text = argument_array[ 1 ].toUpper();
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
                    Abort( "Invalid <? ?> block : " ~ text[ first_character_index .. post_character_index ] );
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

    return text;
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
            Schema.WriteGoTypeFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_type.go" );
        }
        else if ( output_format == "generis" )
        {
            Schema.WriteGenerisTypeFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_type.gs" );
            Schema.WriteGenerisQueryFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_query.gs" );
            Schema.WriteGenerisResponseFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_response.gs" );
            Schema.WriteGenerisRequestFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_request.gs" );
            Schema.WriteGenerisRouteFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_route.gs" );
            Schema.WriteGenerisConstantFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_constant.gs" );
        }
        else if ( output_format == "crystal" )
        {
            Schema.WriteCrystalTypeFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_type.cr" );
        }
        else if ( output_format == "csharp" )
        {
            Schema.WriteCsharpTypeFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_type.cs" );
            Schema.WriteCsharpConstantFile( base_file_path ~ "_" ~ DatabaseFormat ~ "_constant.cs" );
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
        writeln( "    basil [options] script_file.bs [script_file.bs|bsd|bst ...]" );
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
        writeln( "    basil --uml script_file.bs" );
        writeln( "    basil --uml --sql --go script_file.bs" );

        Abort( "Invalid arguments : " ~ argument_array.to!string() );
    }
}
