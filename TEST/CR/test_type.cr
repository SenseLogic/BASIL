class SIMPLE
    @uuid : String
    @bool : bool
    @int_8 : Int8
    @uint_8 : Uint8
    @int_16 : Int16
    @uint_16 : Uint16
    @int_32 : Int32
    @uint_32 : Uint32
    @int_64 : Int64
    @uint_64 : Uint64
    @float_32 : Float32
    @float_64 : Float64
    @string : String
    @name : String
    @date : String
    @date_time : String
    @blob : String
    @option : String
    @english_text : String
    @french_text : String
    @german_text : String
    @latin_text : String
    @spanish_text : String
    @integer : Int64
    @natural : Uint64
    @real : Float64
    @address : String
    @category_slug : String
    @category_name : String
    @category_section : String
end

# ~~

class COMPOUND
    @id : Int32
    @location : String
    @name : Tuple(String, String)
    @name_set : Set(Tuple(String, String))
    @phone_list : List(String)
    @email_set : Set(String)
    @company_map : Hash(String, String)
    @simple_date : String
    @simple_date_map : Hash(Tuple(String, String), String)
    @simple_date_set : Set(String)
    @simple_date_list : List(String)
    @name_set_map : Hash(String, Set(Tuple(String, String)))
    @text : String
    @simple_pointer_array : Array(SIMPLE)
end

# ~~

class VALUE
    @tuid : String
    @uuid : String
    @name : String
    @integer : Int32
    @text : String
end

# ~~

class VALUE_DATA
    @uuid : String
    @value_tuid : String
    @value_uuid : String
    @internal_id : Int64
    @internal_uuid : String
    @internal_value_id : Int64
    @internal_value_uuid : String
end

# ~~

class INTERNAL_DATA
    @id : Int64
    @uuid : String
    @value_tuid : String
    @value_uuid : String
    @first_name : String
    @last_name : String
    @is_awesome : bool
end
