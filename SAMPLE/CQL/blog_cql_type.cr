class SECTION
    @uuid : String
    @number : Uint64
    @name : String
    @text : String
    @image : String
    @image_index : Uint64
end

# ~~

class USER
    @uuid : String
    @first_name : String
    @last_name : String
    @email : String
    @pseudonym : String
    @password : String
    @phone : String
    @street : String
    @city : String
    @code : String
    @region : String
    @country : String
    @company : String
    @it_is_administrator : bool
end

# ~~

class ARTICLE
    @uuid : String
    @section_id : String
    @user_id : String
    @title : String
    @text : String
    @image : String
    @date : String
    @section : SECTION
    @user : USER
    @image_index : Uint64
end

# ~~

class COMMENT
    @uuid : String
    @article_id : String
    @user_id : String
    @text : String
    @date_time : String
    @article : ARTICLE
    @user : USER
end

# ~~

class SUBSCRIBER
    @uuid : String
    @name : String
    @email : String
end
