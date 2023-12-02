class SessionController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.find_by(username: params[:username])
        if @user.present? && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            session[:user_role] = @user.role
        else
            flash[:error] = @user.errors.full_messages
        end
    end
    def destroy
        session[:user_id] = nil
        session[:user_role] = nil
        
    end
    
end