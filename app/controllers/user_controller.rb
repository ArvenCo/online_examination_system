class UserController < ApplicationController
    def index
    end
    def new
        @user = User.new
        url = request.original_fullpath
        if url == "/user/instructor/new"
            @user = User.new(role: "instructor")
        else
            @user = User.new(role: "student")
        end
        
    end
end