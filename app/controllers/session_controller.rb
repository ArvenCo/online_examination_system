class SessionController < ApplicationController
    def new
        @user = User.new
    end
    def create
        user = User.find_by(username: params[:user][:username])
       
        if user.present? && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:notice] = ["User not found"]
            redirect_back fallback_location: root_path
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
    
end