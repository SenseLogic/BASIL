class ITEM
    @uuid : String
    @bool : bool
    @int8 : Int8
    @uint8 : Uint8
    @int16 : Int16
    @uint16 : Uint16
    @int32 : Int32
    @uint32 : Uint32
    @int64 : Int64
    @uint64 : Uint64
    @float32 : Float32
    @float64 : Float64
    @string : String
    @date : String
    @date_time : String
    @blob : String
end

class COLLECTION
    @id : Int32
    @tuple : Tuple(INT32,STRING)
    @map : Map(INT32,STRING)
    @set : Set(Int32)
    @list : List(Int32)
    @item_uuid : String
    @item_list : List(String)
end

