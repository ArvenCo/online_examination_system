class UserController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id
        else
            flash[:notice] = @user.errors.full_messages
            redirect_back fallback_location: root_path
        end
    end
    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation, :role)
    end
    
end